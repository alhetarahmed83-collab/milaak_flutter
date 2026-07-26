import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../../core/formatters.dart';
import '../../core/labels.dart';
import '../../data/local/app_database.dart';
import '../../data/repositories/rental_repositories.dart';
import '../../services/message_service.dart';
import '../../services/pdf_service.dart';
import '../../shared/widgets/empty_state.dart';
import '../../shared/widgets/form_helpers.dart';
import '../../shared/widgets/milaak_ui.dart';
import '../../shared/widgets/screen_scaffold.dart';

class TenantsScreen extends ConsumerStatefulWidget {
  const TenantsScreen({super.key});

  @override
  ConsumerState<TenantsScreen> createState() => _TenantsScreenState();
}

class _TenantsScreenState extends ConsumerState<TenantsScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final tenants = ref.watch(tenantsProvider);
    final utilityBills =
        ref.watch(chargeableUtilityBillsProvider).value ??
        <UtilityBillRecord>[];

    return ScreenScaffold(
      title: 'المستأجرون',
      subtitle: 'ملفات المستأجرين، المديونية، الرسائل، وكشف الحساب.',
      actions: [
        IconButton.outlined(
          tooltip: 'تصدير PDF',
          onPressed: () => PdfService().shareTenants(
            tenants.valueOrNull ?? <TenantRecord>[],
            utilityBills: utilityBills,
            context: context,
          ),
          icon: const Icon(Icons.picture_as_pdf_rounded),
        ),
      ],
      action: IconButton.filled(
        tooltip: 'إضافة مستأجر',
        onPressed: () => showMilaakSheet(context, const _TenantForm()),
        icon: const Icon(Icons.person_add_alt_1_rounded),
      ),
      child: tenants.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            Center(child: Text('تعذر جلب المستأجرين: $error')),
        data: (items) {
          final filtered = items.where((tenant) {
            final text =
                '${tenant.name} ${tenant.phone} ${tenant.propertyName} ${tenant.unitId} ${tenant.nationalId ?? ''}';
            return text.contains(_query);
          }).toList();
          return Column(
            children: [
              MilaakSoftCard(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search_rounded),
                    hintText: 'بحث عن مستأجر أو وحدة أو رقم هوية',
                  ),
                  onChanged: (value) => setState(() => _query = value.trim()),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: filtered.isEmpty
                    ? const EmptyState(
                        icon: Icons.groups_rounded,
                        title: 'لا يوجد مستأجرون',
                        message: 'سجل أول مستأجر واربطه بعقار ووحدة.',
                      )
                    : ListView.separated(
                        itemCount: filtered.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (context, index) =>
                            _TenantCard(tenant: filtered[index]),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _TenantCard extends ConsumerWidget {
  const _TenantCard({required this.tenant});

  final TenantRecord tenant;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utilityBills =
        ref.watch(chargeableUtilityBillsProvider).value ??
        <UtilityBillRecord>[];
    final debt = _tenantDebt(
      tenant,
      _chargeableUtilityDebt(utilityBills, tenant.id),
    );
    final properties =
        ref.watch(propertiesProvider).value ?? <PropertyRecord>[];
    final matched = properties.where((p) => p.id == tenant.propertyId).toList();
    final PropertyRecord? property = matched.isNotEmpty ? matched.first : null;

    final hasDebt = debt > 0;
    final waitingContract = tenant.status == 'pending';
    return MilaakSoftCard(
      padding: const EdgeInsets.all(14),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => TenantDetailsScreen(tenant: tenant)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: hasDebt
                    ? MilaakColors.arrears.withValues(alpha: .12)
                    : MilaakColors.primarySoft,
                child: Text(
                  tenant.name.characters.take(2).toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: hasDebt
                        ? MilaakColors.arrears
                        : MilaakColors.primaryDark,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tenant.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      '${tenant.propertyName} - ${formatUnitShort(property?.type, tenant.unitId)}',
                      style: const TextStyle(color: MilaakColors.textSoft),
                    ),
                  ],
                ),
              ),
              MilaakStatusBadge(
                label: waitingContract
                    ? 'بانتظار عقد'
                    : hasDebt
                    ? 'متأخر'
                    : 'ملتزم',
                color: waitingContract
                    ? MilaakColors.contractGold
                    : hasDebt
                    ? MilaakColors.arrears
                    : MilaakColors.collected,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _AmountTile(
                  label: 'المديونية',
                  value: formatCurrency(debt),
                  color: hasDebt
                      ? MilaakColors.arrears
                      : MilaakColors.collected,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _AmountTile(
                  label: 'تأمين العقد',
                  value: formatCurrency(tenant.securityDeposit),
                  color: MilaakColors.contractGold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: hasDebt
                      ? () =>
                            _sendLateReminder(context, ref, tenant, 'whatsapp')
                      : null,
                  icon: const Icon(Icons.notifications_active_outlined),
                  label: const Text('تذكير'),
                ),
              ),
              const SizedBox(width: 8),
              IconButton.outlined(
                tooltip: 'SMS',
                onPressed: hasDebt
                    ? () => _sendLateReminder(context, ref, tenant, 'sms')
                    : null,
                icon: const Icon(Icons.sms_outlined),
              ),
              const SizedBox(width: 8),
              IconButton.outlined(
                tooltip: 'مشاركة',
                onPressed: () =>
                    _sendLateReminder(context, ref, tenant, 'share'),
                icon: const Icon(Icons.ios_share_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TenantDetailsScreen extends ConsumerWidget {
  const TenantDetailsScreen({super.key, required this.tenant});

  final TenantRecord tenant;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final payments = (ref.watch(paymentsProvider).value ?? <PaymentRecord>[])
        .where((item) => item.tenantId == tenant.id)
        .toList();
    final schedules =
        (ref.watch(rentSchedulesProvider).value ?? <RentScheduleRecord>[])
            .where((item) => item.tenantId == tenant.id)
            .toList();
    final utilityBills =
        ref.watch(tenantUtilityBillsProvider(tenant.id)).value ??
        <UtilityBillRecord>[];
    final maintenanceTickets =
        ref.watch(tenantMaintenanceTicketsProvider(tenant.id)).value ??
        <MaintenanceTicketRecord>[];
    final contracts = ref.watch(contractsProvider).value ?? <ContractRecord>[];
    final logs = (ref.watch(messageLogsProvider).value ?? <MessageLogRecord>[])
        .where((item) => item.tenantId == tenant.id)
        .toList();
    final activeContractList = contracts
        .where((item) => item.tenantId == tenant.id && item.status == 'active')
        .toList();
    final ContractRecord? activeContract = activeContractList.isNotEmpty
        ? activeContractList.first
        : null;
    final debt = _tenantDebt(
      tenant,
      _chargeableUtilityDebt(utilityBills, tenant.id),
    );
    final paidTotal = payments.fold<double>(
      0,
      (sum, item) => sum + item.amount,
    );
    final dueTotal = schedules.fold<double>(
      0,
      (sum, item) => sum + (item.amount - item.paidAmount),
    );
    final openUtilityTotal = utilityBills
        .where((bill) => bill.status == 'open' && bill.chargeToTenant)
        .fold<double>(0, (sum, bill) => sum + bill.amount);
    final openMaintenanceTotal = maintenanceTickets
        .where((ticket) => ticket.status != 'closed')
        .fold<double>(0, (sum, ticket) => sum + ticket.cost);
    final properties =
        ref.watch(propertiesProvider).value ?? <PropertyRecord>[];
    final matched = properties.where((p) => p.id == tenant.propertyId).toList();
    final PropertyRecord? property = matched.isNotEmpty ? matched.first : null;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: Text(tenant.name)),
      body: ScreenScaffold(
        title: 'ملف المستأجر',
        subtitle:
            '${tenant.propertyName} - ${formatUnitShort(property?.type, tenant.unitId)}',
        actions: [
          IconButton.outlined(
            tooltip: 'تقرير PDF',
            onPressed: () => PdfService().shareLines(
              context: context,
              title: 'تقرير مستأجر',
              filename: 'tenant_${tenant.id}.pdf',
              lines: [
                'المستأجر: ${tenant.name}',
                'الجوال: ${tenant.phone}',
                'العقار: ${tenant.propertyName}',
                'الوحدة: ${formatUnitShort(property?.type, tenant.unitId)}',
                'المديونية: ${formatCurrency(debt)}',
                'تأمين العقد: ${formatCurrency(tenant.securityDeposit)}',
                'مجموع المدفوعات: ${formatCurrency(paidTotal)}',
                'المتبقي من الاستحقاقات: ${formatCurrency(dueTotal)}',
                'فواتير الخدمات المفتوحة: ${formatCurrency(openUtilityTotal)}',
                'تكاليف الصيانة المفتوحة: ${formatCurrency(openMaintenanceTotal)}',
                '',
                'الاستحقاقات:',
                if (schedules.isEmpty) 'لا توجد استحقاقات.',
                ...schedules
                    .take(12)
                    .map(
                      (item) =>
                          '- ${formatDate(item.dueDate)} | ${formatCurrency(item.amount - item.paidAmount)} | ${scheduleStatusName(item.status)}',
                    ),
                '',
                'السندات:',
                if (payments.isEmpty) 'لا توجد سندات.',
                ...payments
                    .take(12)
                    .map(
                      (item) =>
                          '- ${item.receiptNo} | ${formatCurrency(item.amount)} | ${formatDate(item.date)}',
                    ),
              ],
            ),
            icon: const Icon(Icons.picture_as_pdf_rounded),
          ),
          IconButton.outlined(
            tooltip: 'تذكير WhatsApp',
            onPressed: debt > 0
                ? () => _sendLateReminder(context, ref, tenant, 'whatsapp')
                : null,
            icon: const Icon(Icons.chat_bubble_outline_rounded),
          ),
          if (activeContract != null && tenant.status == 'active')
            IconButton.outlined(
              tooltip: 'إنهاء العقد',
              onPressed: () => _showEndContractDialog(
                context,
                ref,
                tenant,
                activeContract,
                maintenanceTickets,
              ),
              icon: const Icon(Icons.exit_to_app_rounded),
            ),
        ],
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: _AmountTile(
                    label: 'المديونية',
                    value: formatCurrency(debt),
                    color: debt > 0
                        ? MilaakColors.arrears
                        : MilaakColors.collected,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _AmountTile(
                    label: 'تأمين العقد',
                    value: formatCurrency(tenant.securityDeposit),
                    color: MilaakColors.contractGold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _SectionCard(
              title: 'كشف حساب المستأجر',
              empty: 'لا توجد بيانات مالية.',
              children: [
                _InfoLine('إجمالي المدفوعات', formatCurrency(paidTotal)),
                _InfoLine('المتبقي من الاستحقاقات', formatCurrency(dueTotal)),
                _InfoLine(
                  'فواتير خدمات مفتوحة',
                  formatCurrency(openUtilityTotal),
                ),
                _InfoLine(
                  'تكاليف صيانة مفتوحة',
                  formatCurrency(openMaintenanceTotal),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _InfoCard(
              title: 'بيانات التواصل',
              children: [
                _InfoLine('الجوال', tenant.phone),
                _InfoLine('البريد', tenant.email ?? 'غير مسجل'),
                _InfoLine('رقم الهوية', tenant.nationalId ?? 'غير مسجل'),
                _InfoLine('العنوان', tenant.address ?? 'غير مسجل'),
                if (tenant.notes != null) _InfoLine('ملاحظات', tenant.notes!),
              ],
            ),
            const SizedBox(height: 12),
            _SectionCard(
              title: 'الاستحقاقات القادمة',
              empty: 'لا توجد استحقاقات لهذا المستأجر.',
              children: schedules.take(5).map((item) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    item.status == 'paid'
                        ? Icons.check_circle_rounded
                        : Icons.event_note_rounded,
                    color: item.status == 'paid'
                        ? MilaakColors.collected
                        : MilaakColors.contractGold,
                  ),
                  title: Text(
                    formatCurrency(item.amount),
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                  subtitle: Text(
                    '${formatDate(item.dueDate)} - ${scheduleStatusName(item.status)}',
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            _SectionCard(
              title: 'فواتير الخدمات المفتوحة',
              empty: 'لا توجد فواتير مفتوحة لهذا المستأجر.',
              children: utilityBills.map((bill) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.receipt_long_rounded),
                  title: Text(
                    '${utilityBillTypeLabel(bill.type)} - ${formatCurrency(bill.amount)}',
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                  subtitle: Text(
                    '${formatDate(bill.periodStart)} - ${formatDate(bill.periodEnd)}',
                  ),
                  trailing: Badge(
                    label: Text(bill.status == 'paid' ? 'مدفوع' : 'مفتوح'),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            _SectionCard(
              title: 'بلاغات الصيانة المفتوحة',
              empty: 'لا توجد بلاغات صيانة مفتوحة لهذا المستأجر.',
              children: maintenanceTickets
                  .where((ticket) => ticket.status != 'closed')
                  .map((ticket) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.build_circle_outlined),
                      title: Text(
                        ticket.title,
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                      subtitle: Text(
                        '${ticket.description}\nمسؤولية: ${ticket.damageResponsibility}${ticket.chargeFromDeposit ? ' - يخصم من التأمين' : ''}',
                      ),
                      trailing: Badge(
                        label: Text(
                          ticket.status == 'open'
                              ? 'مفتوح'
                              : ticket.status == 'in_progress'
                              ? 'قيد المعالجة'
                              : 'مغلق',
                        ),
                      ),
                      isThreeLine: true,
                    );
                  })
                  .toList(),
            ),
            const SizedBox(height: 12),
            _SectionCard(
              title: 'آخر السندات',
              empty: 'لا توجد سندات قبض.',
              children: payments.take(5).map((payment) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.receipt_long_rounded),
                  title: Text(
                    payment.receiptNo,
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                  subtitle: Text(
                    '${formatCurrency(payment.amount)} - ${formatDate(payment.date)}',
                  ),
                  trailing: Badge(
                    label: Text(payment.status == 'paid' ? 'مدفوع' : 'معلق'),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            _SectionCard(
              title: 'سجل الرسائل',
              empty: 'لم يتم إرسال رسائل لهذا المستأجر.',
              children: logs.take(5).map((log) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    log.channel == 'sms'
                        ? Icons.sms_outlined
                        : Icons.chat_bubble_outline_rounded,
                  ),
                  title: Text(
                    messageTypeName(log.type),
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                  subtitle: Text(
                    '${messageChannelName(log.channel)} - ${formatDate(log.createdAt)}',
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showEndContractDialog(
    BuildContext context,
    WidgetRef ref,
    TenantRecord tenant,
    ContractRecord contract,
    List<MaintenanceTicketRecord> tickets,
  ) async {
    final deductionController = TextEditingController(text: '0');
    var markMaintenance = tickets.any((ticket) => ticket.status != 'closed');

    await showDialog<void>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('إنهاء عقد المستأجر'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('العقار: ${tenant.propertyName} - ${tenant.unitId}'),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: deductionController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'خصم من التأمين',
                    ),
                  ),
                  const SizedBox(height: 12),
                  CheckboxListTile(
                    title: const Text('وضع الوحدة للصيانة بعد الخروج'),
                    value: markMaintenance,
                    onChanged: (value) =>
                        setState(() => markMaintenance = value ?? false),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('إلغاء'),
                ),
                FilledButton(
                  onPressed: () async {
                    final deduction =
                        double.tryParse(deductionController.text) ?? 0;
                    await ref
                        .read(contractsRepositoryProvider)
                        .terminateContract(
                          contract: contract,
                          tenant: tenant,
                          depositDeduction: deduction,
                          markUnitMaintenance: markMaintenance,
                        );
                    if (context.mounted) {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('تم إنهاء العقد وحفظ حالة الوحدة'),
                        ),
                      );
                    }
                  },
                  child: const Text('تأكيد'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _TenantForm extends ConsumerStatefulWidget {
  const _TenantForm();

  @override
  ConsumerState<_TenantForm> createState() => _TenantFormState();
}

class _TenantFormState extends ConsumerState<_TenantForm> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _nationalId = TextEditingController();
  final _address = TextEditingController();
  final _unit = TextEditingController();
  final _notes = TextEditingController();
  PropertyRecord? _property;
  String _rentalType = 'advance';
  bool _saving = false;

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _email.dispose();
    _nationalId.dispose();
    _address.dispose();
    _unit.dispose();
    _notes.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate() || _property == null) return;

    final properties = ref.read(propertiesProvider).value ?? <PropertyRecord>[];
    final property = _propertyById(properties, _property?.id);
    if (property == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('اختر عقاراً صحيحاً')));
      return;
    }
    final units = ref.read(unitsProvider).value ?? <UnitRecord>[];
    final propertyUnits = units
        .where(
          (unit) => unit.propertyId == property.id && unit.status == 'vacant',
        )
        .toList();
    final propertyHasUnits = units.any(
      (unit) => unit.propertyId == property.id,
    );
    if (propertyHasUnits && propertyUnits.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('لا توجد وحدات شاغرة لهذا العقار.')),
        );
      }
      return;
    }

    setState(() => _saving = true);
    await ref
        .read(tenantsRepositoryProvider)
        .addTenant(
          name: _name.text.trim(),
          phone: _phone.text.trim(),
          email: _email.text.trim(),
          nationalId: _nationalId.text.trim(),
          address: _address.text.trim(),
          notes: _notes.text.trim(),
          property: property,
          unitId: _unit.text.trim(),
          rentalType: _rentalType,
        );
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final properties =
        ref.watch(propertiesProvider).value ?? <PropertyRecord>[];
    final units = ref.watch(unitsProvider).value ?? <UnitRecord>[];
    final selectedProperty = _propertyById(properties, _property?.id);
    final propertyUnits = selectedProperty == null
        ? <UnitRecord>[]
        : units
              .where(
                (unit) =>
                    unit.propertyId == selectedProperty.id &&
                    unit.status == 'vacant',
              )
              .toList();
    final propertyHasUnits =
        selectedProperty != null &&
        units.any((unit) => unit.propertyId == selectedProperty.id);
    final selectedUnit = _unitByNo(propertyUnits, _unit.text);

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MilaakSectionHeader(
              title: 'تسجيل مستأجر',
              subtitle:
                  'اربط المستأجر بعقار ووحدة. التأمين يضاف عند إنشاء العقد.',
            ),
            const SizedBox(height: 16),
            const FieldTitle('اسم المستأجر'),
            TextFormField(
              controller: _name,
              validator: (value) =>
                  value == null || value.trim().isEmpty ? 'مطلوب' : null,
            ),
            const SizedBox(height: 12),
            const FieldTitle('رقم الجوال'),
            TextFormField(
              controller: _phone,
              keyboardType: TextInputType.phone,
              validator: (value) =>
                  value == null || value.trim().isEmpty ? 'مطلوب' : null,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FieldTitle('البريد الإلكتروني'),
                      TextFormField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FieldTitle('رقم الهوية'),
                      TextFormField(
                        controller: _nationalId,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const FieldTitle('العنوان'),
            TextFormField(controller: _address),
            const SizedBox(height: 12),
            const FieldTitle('العقار'),
            DropdownButtonFormField<PropertyRecord>(
              value: selectedProperty,
              items: properties
                  .map(
                    (property) => DropdownMenuItem(
                      value: property,
                      child: Text(property.name),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _property = value;
                  _unit.clear();
                });
              },
              validator: (value) => value == null ? 'اختر عقاراً' : null,
              decoration: const InputDecoration(hintText: 'اختر العقار'),
            ),
            const SizedBox(height: 12),
            const FieldTitle('الوحدة'),
            if (selectedProperty != null &&
                propertyHasUnits &&
                propertyUnits.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'لا توجد وحدات شاغرة حالياً في هذا العقار. الوحدات المحجوزة أو المؤجرة غير متاحة.',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: MilaakColors.arrears),
                ),
              )
            else if (propertyUnits.isEmpty)
              TextFormField(
                controller: _unit,
                validator: (value) =>
                    value == null || value.trim().isEmpty ? 'مطلوب' : null,
              )
            else
              DropdownButtonFormField<UnitRecord>(
                value: selectedUnit,
                items: propertyUnits
                    .map(
                      (unit) => DropdownMenuItem(
                        value: unit,
                        child: Text(
                          '${unit.unitNo} - ${unitStatusName(unit.status)}',
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) => setState(() {
                  _unit.text = value?.unitNo ?? '';
                }),
                validator: (value) => value == null ? 'اختر وحدة' : null,
                decoration: const InputDecoration(hintText: 'اختر الوحدة'),
              ),
            const SizedBox(height: 12),
            const FieldTitle('نظام الدفع'),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'advance', label: Text('مقدم')),
                ButtonSegment(value: 'arrears', label: Text('مؤخر')),
              ],
              selected: {_rentalType},
              onSelectionChanged: (value) =>
                  setState(() => _rentalType = value.first),
            ),
            const SizedBox(height: 12),
            const FieldTitle('ملاحظات'),
            TextFormField(controller: _notes, minLines: 2, maxLines: 4),
            const SizedBox(height: 18),
            FilledButton.icon(
              onPressed: _saving ? null : _save,
              icon: _saving
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.save_rounded),
              label: const Text('حفظ المستأجر'),
            ),
          ],
        ),
      ),
    );
  }
}

class _AmountTile extends StatelessWidget {
  const _AmountTile({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .10),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: MilaakColors.textSoft,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: color, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return MilaakSoftCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
          ),
          const Divider(height: 20),
          ...children,
        ],
      ),
    );
  }
}

class _InfoLine extends StatelessWidget {
  const _InfoLine(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(
            width: 86,
            child: Text(
              label,
              style: const TextStyle(color: MilaakColors.textSoft),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.empty,
    required this.children,
  });

  final String title;
  final String empty;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return MilaakSoftCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 8),
          if (children.isEmpty)
            Text(empty, style: const TextStyle(color: MilaakColors.textSoft))
          else
            ...children,
        ],
      ),
    );
  }
}

Future<void> _sendLateReminder(
  BuildContext context,
  WidgetRef ref,
  TenantRecord tenant,
  String channel,
) async {
  final messenger = ScaffoldMessenger.of(context);
  final officeName =
      ref.read(officeNameProvider).valueOrNull ?? 'مكتب مِلاك العقاري';
  final template = await ref
      .read(messagesRepositoryProvider)
      .templateByType('late_payment');
  final properties = ref.read(propertiesProvider).value ?? <PropertyRecord>[];
  final matched = properties.where((p) => p.id == tenant.propertyId).toList();
  final PropertyRecord? property = matched.isNotEmpty ? matched.first : null;
  final unitLabel = formatUnitShort(property?.type, tenant.unitId);
  final systemCurrency = ref
      .read(currencyProvider)
      .maybeWhen(data: (v) => v, orElse: () => 'YER');
  final body = MessageService().latePaymentMessage(
    tenant: tenant,
    officeName: officeName,
    template: template?.body,
    unitLabel: unitLabel,
    currency: systemCurrency,
  );
  final status = await MessageService().sendToTenant(
    repository: ref.read(messagesRepositoryProvider),
    tenant: tenant,
    type: 'late_payment',
    channel: channel,
    body: body,
  );
  messenger.showSnackBar(
    SnackBar(
      content: Text(
        status == 'opened' ? 'تم فتح الرسالة' : 'تعذر فتح قناة الإرسال',
      ),
    ),
  );
}

double _tenantDebt(TenantRecord tenant, [double utilityDebt = 0]) {
  return tenant.accumulatedDebt + tenant.balance + utilityDebt;
}

double _chargeableUtilityDebt(List<UtilityBillRecord> bills, int tenantId) {
  return bills
      .where(
        (bill) =>
            bill.tenantId == tenantId &&
            bill.status == 'open' &&
            bill.chargeToTenant,
      )
      .fold<double>(0, (sum, bill) => sum + bill.amount);
}

PropertyRecord? _propertyById(List<PropertyRecord> items, int? id) {
  if (id == null) return null;
  for (final item in items) {
    if (item.id == id) return item;
  }
  return null;
}

UnitRecord? _unitByNo(List<UnitRecord> items, String unitNo) {
  final trimmed = unitNo.trim();
  if (trimmed.isEmpty) return null;
  for (final item in items) {
    if (item.unitNo == trimmed) return item;
  }
  return null;
}

String scheduleStatusName(String status) {
  return switch (status) {
    'paid' => 'مدفوع',
    'partial' => 'مدفوع جزئياً',
    'overdue' => 'متأخر',
    _ => 'مستحق',
  };
}
