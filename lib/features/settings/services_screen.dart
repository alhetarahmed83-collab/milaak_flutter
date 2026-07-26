import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../../core/formatters.dart';
import '../../core/labels.dart';
import '../../data/local/app_database.dart';
import '../../data/repositories/rental_repositories.dart';
import '../../services/message_service.dart';
import '../../shared/widgets/empty_state.dart';
import '../../shared/widgets/form_helpers.dart';
import '../../shared/widgets/milaak_ui.dart';
import '../../shared/widgets/screen_scaffold.dart';

class ServicesScreen extends ConsumerWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bills = ref.watch(allUtilityBillsProvider);
    final tenants = ref.watch(tenantsProvider).value ?? <TenantRecord>[];

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: const Text('الخدمات والعدادات')),
      body: ScreenScaffold(
        title: 'الخدمات والعدادات',
        subtitle: 'إدارة فواتير الماء والكهرباء والعدادات المشتركة والخاصة.',
        action: IconButton.filled(
          tooltip: 'فاتورة خدمة',
          onPressed: () => showMilaakSheet(context, const _UtilityBillForm()),
          icon: const Icon(Icons.add_task_rounded),
        ),
        child: bills.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) =>
              Center(child: Text('تعذر جلب فواتير الخدمات: $error')),
          data: (items) {
            final openChargeable = items
                .where((bill) => bill.status == 'open' && bill.chargeToTenant)
                .fold<double>(0, (sum, bill) => sum + bill.amount);
            final external = items
                .where((bill) => bill.status == 'paid_external')
                .fold<double>(0, (sum, bill) => sum + bill.amount);

            return ListView.separated(
              padding: const EdgeInsets.only(bottom: 24),
              itemCount: items.isEmpty ? 2 : items.length + 1,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Row(
                    children: [
                      Expanded(
                        child: MilaakStatCard(
                          title: 'خدمات للتحصيل',
                          value: formatCurrency(openChargeable),
                          icon: Icons.receipt_long_rounded,
                          color: MilaakColors.utilityBlue,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: MilaakStatCard(
                          title: 'مدفوع خارجياً',
                          value: formatCurrency(external),
                          icon: Icons.verified_rounded,
                          color: MilaakColors.collected,
                        ),
                      ),
                    ],
                  );
                }

                if (items.isEmpty) {
                  return const EmptyState(
                    icon: Icons.electrical_services_rounded,
                    title: 'لا توجد فواتير خدمات',
                    message: 'أضف فاتورة ماء أو كهرباء أو عداد مشترك.',
                  );
                }

                final bill = items[index - 1];
                return _UtilityBillCard(
                  bill: bill,
                  tenant: _tenantById(tenants, bill.tenantId),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _UtilityBillCard extends ConsumerWidget {
  const _UtilityBillCard({required this.bill, required this.tenant});

  final UtilityBillRecord bill;
  final TenantRecord? tenant;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = switch (bill.status) {
      'paid' || 'paid_external' => MilaakColors.collected,
      'cancelled' => MilaakColors.muted,
      _ =>
        bill.chargeToTenant ? MilaakColors.utilityBlue : MilaakColors.textSoft,
    };
    final showProofButton =
        bill.meterOwnership == 'tenant_meter' && bill.status == 'open';

    return MilaakSoftCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              MilaakIconBadge(
                icon: _serviceIcon(bill.type),
                color: color,
                size: 52,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${utilityBillTypeLabel(bill.type)} - ${formatCurrency(bill.amount)}',
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${bill.tenantName ?? 'بدون مستأجر'} | ${bill.propertyName} - ${formatUnitShort(null, bill.unitId)}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: MilaakColors.textSoft,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              MilaakStatusBadge(
                label: utilityBillStatusLabel(bill.status),
                color: color,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _ChipLine(
                icon: Icons.speed_rounded,
                text: meterOwnershipLabel(bill.meterOwnership),
              ),
              if ((bill.meterNo ?? '').isNotEmpty)
                _ChipLine(icon: Icons.tag_rounded, text: 'رقم ${bill.meterNo}'),
              _ChipLine(
                icon: Icons.event_rounded,
                text:
                    '${formatDate(bill.periodStart)} - ${formatDate(bill.periodEnd)}',
              ),
              if (bill.consumption > 0)
                _ChipLine(
                  icon: Icons.bolt_rounded,
                  text: 'استهلاك ${bill.consumption.toStringAsFixed(1)}',
                ),
              _ChipLine(
                icon: bill.chargeToTenant
                    ? Icons.person_pin_circle_rounded
                    : Icons.visibility_rounded,
                text: bill.chargeToTenant ? 'داخل المديونية' : 'متابعة فقط',
              ),
            ],
          ),
          if (bill.notes != null && bill.notes!.trim().isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(
              bill.notes!,
              style: const TextStyle(color: MilaakColors.textSoft),
            ),
          ],
          if (tenant != null && bill.status == 'open') ...[
            const SizedBox(height: 10),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => _sendUtilityMessage(
                    context: context,
                    ref: ref,
                    bill: bill,
                    tenant: tenant!,
                    channel: 'whatsapp',
                  ),
                  icon: const Icon(Icons.chat_bubble_outline_rounded),
                  label: const Text('تذكير'),
                ),
                if (showProofButton)
                  TextButton.icon(
                    onPressed: () => _markExternal(context, ref, bill),
                    icon: const Icon(Icons.verified_rounded),
                    label: const Text('إثبات دفع'),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _UtilityBillForm extends ConsumerStatefulWidget {
  const _UtilityBillForm();

  @override
  ConsumerState<_UtilityBillForm> createState() => _UtilityBillFormState();
}

class _UtilityBillFormState extends ConsumerState<_UtilityBillForm> {
  final _formKey = GlobalKey<FormState>();
  final _meterNo = TextEditingController();
  final _previousReading = TextEditingController(text: '0');
  final _currentReading = TextEditingController(text: '0');
  final _rate = TextEditingController(text: '0');
  final _amount = TextEditingController();
  final _proofPath = TextEditingController();
  final _notes = TextEditingController();

  int? _tenantId;
  int? _propertyId;
  String _type = 'electricity';
  String _meterOwnership = 'owner_meter';
  bool _chargeToTenant = true;
  bool _paidExternally = false;
  DateTime _periodStart = DateTime(DateTime.now().year, DateTime.now().month);
  DateTime _periodEnd = DateTime.now();
  bool _saving = false;

  @override
  void dispose() {
    _meterNo.dispose();
    _previousReading.dispose();
    _currentReading.dispose();
    _rate.dispose();
    _amount.dispose();
    _proofPath.dispose();
    _notes.dispose();
    super.dispose();
  }

  Future<void> _pickDate(bool start) async {
    final initial = start ? _periodStart : _periodEnd;
    final value = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (value == null) return;
    setState(() {
      if (start) {
        _periodStart = value;
        if (_periodEnd.isBefore(value)) _periodEnd = value;
      } else {
        _periodEnd = value;
      }
    });
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final tenants = ref.read(tenantsProvider).value ?? <TenantRecord>[];
    final properties = ref.read(propertiesProvider).value ?? <PropertyRecord>[];
    final units = ref.read(unitsProvider).value ?? <UnitRecord>[];
    final previous = _readDouble(_previousReading);
    final current = _readDouble(_currentReading);
    final rate = _readDouble(_rate);
    final consumption = math.max<double>(current - previous, 0);
    final amount = _readDouble(_amount) > 0
        ? _readDouble(_amount)
        : consumption * rate;

    if (amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('أدخل مبلغ الفاتورة أو القراءة والسعر')),
      );
      return;
    }

    setState(() => _saving = true);
    try {
      if (_meterOwnership == 'shared_meter') {
        final property = _propertyById(properties, _propertyId);
        if (property == null) {
          throw StateError('اختر العقار للعداد المشترك');
        }
        await ref
            .read(utilityBillsRepositoryProvider)
            .addSharedUtilityBills(
              property: property,
              tenants: tenants,
              type: _type,
              periodStart: _periodStart,
              periodEnd: _periodEnd,
              totalAmount: amount,
              previousReading: previous,
              currentReading: current,
              rate: rate,
              meterNo: _meterNo.text.trim(),
              notes: _notes.text.trim(),
            );
      } else {
        final tenant = _tenantById(tenants, _tenantId);
        if (tenant == null) {
          throw StateError('اختر المستأجر');
        }
        final property = _propertyById(properties, tenant.propertyId);
        final unit = _unitForTenant(units, tenant);
        final policy = _effectiveServicePolicy(property, unit, _type);
        if (policy == 'unavailable') {
          throw StateError('هذه الخدمة غير مفعلة لهذا العقار أو الوحدة');
        }
        await ref
            .read(utilityBillsRepositoryProvider)
            .addUtilityBill(
              tenant: tenant,
              type: _type,
              periodStart: _periodStart,
              periodEnd: _periodEnd,
              consumption: consumption,
              rate: rate,
              amount: amount,
              meterOwnership: _meterOwnership,
              meterNo: _meterNo.text.trim(),
              previousReading: previous,
              currentReading: current,
              chargeToTenant: _chargeToTenant,
              paidExternally: _paidExternally,
              proofPath: _proofPath.text.trim(),
              notes: _notes.text.trim(),
            );
      }
      if (!mounted) return;
      Navigator.of(context).pop();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('تم حفظ فاتورة الخدمة')));
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('تعذر حفظ الفاتورة: $error')));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tenants = ref.watch(tenantsProvider).value ?? <TenantRecord>[];
    final properties =
        ref.watch(propertiesProvider).value ?? <PropertyRecord>[];
    final units = ref.watch(unitsProvider).value ?? <UnitRecord>[];
    final selectedTenant = _tenantById(tenants, _tenantId);
    final selectedProperty = _propertyById(properties, _propertyId);
    final selectedTenantProperty = selectedTenant == null
        ? null
        : _propertyById(properties, selectedTenant.propertyId);
    final selectedUnit = _unitForTenant(units, selectedTenant);
    final selectedPolicy = _effectiveServicePolicy(
      selectedTenantProperty,
      selectedUnit,
      _type,
    );
    final sharedTenants = selectedProperty == null
        ? <TenantRecord>[]
        : tenants
              .where((tenant) => tenant.propertyId == selectedProperty.id)
              .toList();

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MilaakSectionHeader(
              title: 'فاتورة خدمة جديدة',
              subtitle: 'حدد نوع العداد وهل تدخل الفاتورة في مديونية المستأجر.',
            ),
            const SizedBox(height: 16),
            const FieldTitle('نوع الخدمة'),
            DropdownButtonFormField<String>(
              value: _type,
              items: const ['electricity', 'water', 'gas', 'other']
                  .map(
                    (type) => DropdownMenuItem(
                      value: type,
                      child: Text(utilityBillTypeLabel(type)),
                    ),
                  )
                  .toList(),
              onChanged: (value) => setState(() {
                _type = value ?? 'electricity';
                _applySelectedServicePolicy(
                  tenant: selectedTenant,
                  property: selectedTenantProperty,
                  unit: selectedUnit,
                );
              }),
            ),
            const SizedBox(height: 12),
            const FieldTitle('طريقة الخدمة'),
            DropdownButtonFormField<String>(
              value: _meterOwnership,
              items: const ['owner_meter', 'tenant_meter', 'shared_meter']
                  .map(
                    (ownership) => DropdownMenuItem(
                      value: ownership,
                      child: Text(meterOwnershipLabel(ownership)),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                final ownership = value ?? 'owner_meter';
                setState(() {
                  _meterOwnership = ownership;
                  _chargeToTenant = ownership != 'tenant_meter';
                  _paidExternally = false;
                  _tenantId = null;
                  _propertyId = null;
                });
              },
            ),
            if (selectedTenant != null && selectedPolicy != 'manual') ...[
              const SizedBox(height: 8),
              _PolicyHint(policy: selectedPolicy),
            ],
            const SizedBox(height: 12),
            if (_meterOwnership == 'shared_meter') ...[
              const FieldTitle('العقار'),
              DropdownButtonFormField<int>(
                value: _propertyId,
                items: properties
                    .map(
                      (property) => DropdownMenuItem(
                        value: property.id,
                        child: Text(property.name),
                      ),
                    )
                    .toList(),
                onChanged: (value) => setState(() => _propertyId = value),
                validator: (value) => value == null ? 'اختر العقار' : null,
              ),
              if (selectedProperty != null) ...[
                const SizedBox(height: 8),
                Text(
                  'سيتم توزيع الفاتورة بالتساوي على ${sharedTenants.length} مستأجر مرتبط بهذا العقار.',
                  style: const TextStyle(color: MilaakColors.textSoft),
                ),
              ],
            ] else ...[
              const FieldTitle('المستأجر'),
              DropdownButtonFormField<int>(
                value: _tenantId,
                items: tenants
                    .map(
                      (tenant) => DropdownMenuItem(
                        value: tenant.id,
                        child: Text('${tenant.name} - ${tenant.propertyName}'),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  final nextTenant = _tenantById(tenants, value);
                  final nextProperty = nextTenant == null
                      ? null
                      : _propertyById(properties, nextTenant.propertyId);
                  final nextUnit = _unitForTenant(units, nextTenant);
                  setState(() {
                    _tenantId = value;
                    _applySelectedServicePolicy(
                      tenant: nextTenant,
                      property: nextProperty,
                      unit: nextUnit,
                    );
                  });
                },
                validator: (value) => value == null ? 'اختر المستأجر' : null,
              ),
              if (selectedTenant != null) ...[
                const SizedBox(height: 8),
                Text(
                  '${selectedTenant.propertyName} - ${formatUnitShort(null, selectedTenant.unitId)}',
                  style: const TextStyle(color: MilaakColors.textSoft),
                ),
              ],
            ],
            const SizedBox(height: 12),
            const FieldTitle('رقم العداد'),
            TextFormField(
              controller: _meterNo,
              decoration: const InputDecoration(hintText: 'اختياري'),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _pickDate(true),
                    icon: const Icon(Icons.event_rounded),
                    label: Text('من ${formatDate(_periodStart)}'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _pickDate(false),
                    icon: const Icon(Icons.event_available_rounded),
                    label: Text('إلى ${formatDate(_periodEnd)}'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _NumberField(
                    title: 'آخر قراءة',
                    controller: _previousReading,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _NumberField(
                    title: 'القراءة الحالية',
                    controller: _currentReading,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _NumberField(title: 'السعر', controller: _rate),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _NumberField(
                    title: 'المبلغ',
                    controller: _amount,
                    hint: 'أو يحسب تلقائياً',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              value: _chargeToTenant,
              onChanged: _meterOwnership == 'shared_meter'
                  ? null
                  : (value) => setState(() => _chargeToTenant = value),
              title: const Text('تدخل في مديونية المستأجر'),
              subtitle: Text(
                _meterOwnership == 'tenant_meter'
                    ? 'اتركها مغلقة إذا كان المستأجر يدفع للشركة مباشرة.'
                    : 'فعّلها عندما يريد المكتب تحصيل الفاتورة من المستأجر.',
              ),
            ),
            if (_meterOwnership == 'tenant_meter') ...[
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                value: _paidExternally,
                onChanged: (value) => setState(() => _paidExternally = value),
                title: const Text('مدفوعة خارج التطبيق'),
                subtitle: const Text(
                  'تسجل كمتابعة ولا تدخل في صافي دخل المكتب.',
                ),
              ),
              const FieldTitle('مسار إثبات الدفع'),
              TextFormField(
                controller: _proofPath,
                decoration: const InputDecoration(hintText: 'اختياري'),
              ),
              const SizedBox(height: 12),
            ],
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
              label: const Text('حفظ الفاتورة'),
            ),
          ],
        ),
      ),
    );
  }

  void _applySelectedServicePolicy({
    required TenantRecord? tenant,
    required PropertyRecord? property,
    required UnitRecord? unit,
  }) {
    final policy = _effectiveServicePolicy(property, unit, _type);
    if (policy == 'manual') return;

    if (policy == 'shared_meter') {
      _meterOwnership = 'shared_meter';
      _propertyId = tenant?.propertyId ?? property?.id;
      _tenantId = null;
      _chargeToTenant = true;
      _paidExternally = false;
      _meterNo.clear();
      return;
    }

    if (policy == 'tenant_meter') {
      _meterOwnership = 'tenant_meter';
      _propertyId = null;
      _chargeToTenant = false;
      _paidExternally = false;
      _meterNo.text = _meterNoForService(unit, _type) ?? '';
      return;
    }

    if (policy == 'owner_meter') {
      _meterOwnership = 'owner_meter';
      _propertyId = null;
      _chargeToTenant = true;
      _paidExternally = false;
      _meterNo.text = _meterNoForService(unit, _type) ?? '';
      return;
    }

    if (policy == 'unavailable') {
      _meterOwnership = 'owner_meter';
      _propertyId = null;
      _chargeToTenant = false;
      _paidExternally = false;
      _meterNo.clear();
    }
  }
}

class _NumberField extends StatelessWidget {
  const _NumberField({
    required this.title,
    required this.controller,
    this.hint,
  });

  final String title;
  final TextEditingController controller;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldTitle(title),
        TextFormField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(hintText: hint),
        ),
      ],
    );
  }
}

class _PolicyHint extends StatelessWidget {
  const _PolicyHint({required this.policy});

  final String policy;

  @override
  Widget build(BuildContext context) {
    final unavailable = policy == 'unavailable';
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: unavailable
            ? MilaakColors.arrears.withValues(alpha: .08)
            : MilaakColors.utilityBlue.withValues(alpha: .08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: unavailable
              ? MilaakColors.arrears.withValues(alpha: .25)
              : MilaakColors.utilityBlue.withValues(alpha: .25),
        ),
      ),
      child: Row(
        children: [
          Icon(
            unavailable
                ? Icons.warning_amber_rounded
                : Icons.rule_folder_rounded,
            color: unavailable
                ? MilaakColors.arrears
                : MilaakColors.utilityBlue,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              unavailable
                  ? 'هذه الخدمة غير مفعلة لهذا العقار أو الوحدة.'
                  : 'سيتم تطبيق إعداد الوحدة/العقار: ${servicePolicyLabel(policy)}.',
              style: TextStyle(
                color: unavailable
                    ? MilaakColors.arrears
                    : MilaakColors.utilityBlue,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChipLine extends StatelessWidget {
  const _ChipLine({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: MilaakColors.softSurface,
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: MilaakColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: MilaakColors.textSoft),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              color: MilaakColors.textSoft,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _sendUtilityMessage({
  required BuildContext context,
  required WidgetRef ref,
  required UtilityBillRecord bill,
  required TenantRecord tenant,
  required String channel,
}) async {
  final messenger = ScaffoldMessenger.of(context);
  final type = bill.meterOwnership == 'tenant_meter' && !bill.chargeToTenant
      ? 'utility_proof_request'
      : 'utility_payment_reminder';
  final officeName =
      ref.read(officeNameProvider).valueOrNull ?? 'مكتب مِلاك العقاري';
  final template = await ref
      .read(messagesRepositoryProvider)
      .templateByType(type);
  final body = _utilityMessageBody(
    template: template?.body,
    tenant: tenant,
    bill: bill,
    officeName: officeName,
  );
  final status = await MessageService().sendToTenant(
    repository: ref.read(messagesRepositoryProvider),
    tenant: tenant,
    type: type,
    channel: channel,
    body: body,
  );
  messenger.showSnackBar(
    SnackBar(
      content: Text(
        status == 'opened' ? 'تم فتح رسالة الخدمة' : 'تعذر فتح قناة الإرسال',
      ),
    ),
  );
}

String _utilityMessageBody({
  required String? template,
  required TenantRecord tenant,
  required UtilityBillRecord bill,
  required String officeName,
}) {
  final body =
      template ??
      'مرحباً {tenantName}، نذكركم بفاتورة {serviceType} بمبلغ {amount} للفترة {period}. {officeName}.';
  return MessageService().renderTemplate(body, {
    'tenantName': tenant.name,
    'serviceType': utilityBillTypeLabel(bill.type),
    'amount': formatCurrency(bill.amount),
    'period': '${formatDate(bill.periodStart)} - ${formatDate(bill.periodEnd)}',
    'receiptNo': bill.paymentId?.toString() ?? '',
    'officeName': officeName,
  });
}

Future<void> _markExternal(
  BuildContext context,
  WidgetRef ref,
  UtilityBillRecord bill,
) async {
  await ref.read(utilityBillsRepositoryProvider).markPaidExternally(bill);
  if (!context.mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('تم تسجيل الفاتورة كمدفوعة خارج التطبيق')),
  );
}

IconData _serviceIcon(String type) {
  return switch (type) {
    'water' => Icons.water_drop_rounded,
    'gas' => Icons.local_fire_department_rounded,
    'electricity' => Icons.bolt_rounded,
    _ => Icons.receipt_long_rounded,
  };
}

double _readDouble(TextEditingController controller) {
  return double.tryParse(controller.text.trim().replaceAll(',', '.')) ?? 0;
}

TenantRecord? _tenantById(List<TenantRecord> items, int? id) {
  if (id == null) return null;
  for (final item in items) {
    if (item.id == id) return item;
  }
  return null;
}

PropertyRecord? _propertyById(List<PropertyRecord> items, int? id) {
  if (id == null) return null;
  for (final item in items) {
    if (item.id == id) return item;
  }
  return null;
}

UnitRecord? _unitForTenant(List<UnitRecord> units, TenantRecord? tenant) {
  if (tenant == null) return null;
  for (final unit in units) {
    if (unit.tenantId == tenant.id) return unit;
  }
  for (final unit in units) {
    if (unit.propertyId == tenant.propertyId && unit.unitNo == tenant.unitId) {
      return unit;
    }
  }
  return null;
}

String _effectiveServicePolicy(
  PropertyRecord? property,
  UnitRecord? unit,
  String type,
) {
  final unitPolicy = switch (type) {
    'electricity' => unit?.electricityServiceMode,
    'water' => unit?.waterServiceMode,
    'gas' => unit?.gasServiceMode,
    _ => null,
  };
  if (unitPolicy != null && unitPolicy != 'inherit') return unitPolicy;

  final propertyPolicy = switch (type) {
    'electricity' => property?.electricityServiceMode,
    'water' => property?.waterServiceMode,
    'gas' => property?.gasServiceMode,
    _ => null,
  };
  return propertyPolicy ?? 'manual';
}

String? _meterNoForService(UnitRecord? unit, String type) {
  if (unit == null) return null;
  return switch (type) {
    'electricity' => unit.electricityMeterNo,
    'water' => unit.waterMeterNo,
    'gas' => unit.gasMeterNo,
    _ => null,
  };
}
