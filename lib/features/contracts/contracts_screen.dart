import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../../core/formatters.dart';
import '../../data/local/app_database.dart';
import '../../data/repositories/rental_repositories.dart';
import '../../services/pdf_service.dart';
import '../../shared/widgets/empty_state.dart';
import '../../shared/widgets/form_helpers.dart';
import '../../shared/widgets/milaak_ui.dart';
import '../../shared/widgets/screen_scaffold.dart';

class ContractsScreen extends ConsumerWidget {
  const ContractsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contracts = ref.watch(contractsProvider);

    return ScreenScaffold(
      title: 'العقود',
      subtitle: 'إنشاء واعتماد عقود الإيجار محلياً.',
      actions: [
        IconButton.outlined(
          tooltip: 'تصدير أرشيف العقود',
          onPressed: () => PdfService().shareContracts(
            contracts.valueOrNull ?? <ContractRecord>[],
            context: context,
          ),
          icon: const Icon(Icons.picture_as_pdf_rounded),
        ),
      ],
      action: IconButton.filled(
        onPressed: () => showMilaakSheet(context, const _ContractForm()),
        icon: const Icon(Icons.post_add_rounded),
      ),
      child: contracts.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            Center(child: Text('تعذر جلب العقود: $error')),
        data: (items) => items.isEmpty
            ? const EmptyState(
                icon: Icons.description_rounded,
                title: 'لا توجد عقود',
                message: 'أنشئ عقداً واربطه بالمستأجر والعقار لتحديث الحسابات.',
              )
            : ListView.separated(
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) =>
                    _ContractCard(contract: items[index]),
              ),
      ),
    );
  }
}

class _ContractCard extends StatelessWidget {
  const _ContractCard({required this.contract});

  final ContractRecord contract;

  @override
  Widget build(BuildContext context) {
    final isClose = contract.endDate.isBefore(
      DateTime.now().add(const Duration(days: 45)),
    );
    return MilaakSoftCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const MilaakIconBadge(
                icon: Icons.description_rounded,
                color: MilaakColors.contractGold,
                size: 52,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contract.contractNo.isEmpty
                          ? 'عقد ${contract.id}'
                          : contract.contractNo,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      '${contract.tenantName} - ${contract.propertyName} - ${contract.unitId}',
                      style: const TextStyle(color: MilaakColors.textSoft),
                    ),
                  ],
                ),
              ),
              IconButton.outlined(
                onPressed: () =>
                    PdfService().shareContract(contract, context: context),
                icon: const Icon(Icons.picture_as_pdf_rounded),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: Text('من ${formatDate(contract.startDate)}')),
              Expanded(child: Text('إلى ${formatDate(contract.endDate)}')),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                formatCurrency(contract.rentAmount),
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: MilaakColors.primaryDark,
                ),
              ),
              const Spacer(),
              if (isClose)
                const MilaakStatusBadge(
                  label: 'قريب الانتهاء',
                  color: MilaakColors.arrears,
                )
              else
                const MilaakStatusBadge(
                  label: 'نشط',
                  color: MilaakColors.collected,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContractForm extends ConsumerStatefulWidget {
  const _ContractForm();

  @override
  ConsumerState<_ContractForm> createState() => _ContractFormState();
}

class _ContractFormState extends ConsumerState<_ContractForm> {
  final _formKey = GlobalKey<FormState>();
  final _landlord = TextEditingController(text: 'مكتب مِلاك العقاري');
  final _rent = TextEditingController();
  final _deposit = TextEditingController(text: '0');
  final _terms = TextEditingController();
  TenantRecord? _tenant;
  DateTime _start = DateTime.now();
  DateTime _end = DateTime(
    DateTime.now().year + 1,
    DateTime.now().month,
    DateTime.now().day,
  );
  String _frequency = 'شهري';
  bool _saving = false;

  @override
  void dispose() {
    _landlord.dispose();
    _rent.dispose();
    _deposit.dispose();
    _terms.dispose();
    super.dispose();
  }

  Future<void> _pickDate({required bool start}) async {
    final initial = start ? _start : _end;
    final value = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (value != null) setState(() => start ? _start = value : _end = value);
  }

  Future<void> _save() async {
    final properties = ref.read(propertiesProvider).value ?? <PropertyRecord>[];
    final tenants = ref.read(tenantsProvider).value ?? <TenantRecord>[];
    final tenant = _tenantById(tenants, _tenant?.id);
    final property = _propertyById(properties, tenant?.propertyId);
    final unitId = tenant?.unitId.trim() ?? '';

    if (!_formKey.currentState!.validate() || tenant == null) {
      return;
    }
    if (property == null || unitId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ملف المستأجر لا يحتوي عقاراً أو وحدة صالحة.'),
        ),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      await ref
          .read(contractsRepositoryProvider)
          .approveContract(
            CreateContractInput(
              property: property,
              tenant: tenant,
              unitId: unitId,
              landlordName: _landlord.text.trim(),
              startDate: _start,
              endDate: _end,
              rentAmount: double.tryParse(_rent.text) ?? 0,
              securityDepositAmount: double.tryParse(_deposit.text) ?? 0,
              paymentFrequency: _frequency,
              customTerms: _terms.text.trim(),
            ),
          );
      if (mounted) Navigator.of(context).pop();
    } catch (error) {
      if (!mounted) return;
      setState(() => _saving = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_friendlyContractError(error))));
    }
  }

  @override
  Widget build(BuildContext context) {
    final properties =
        ref.watch(propertiesProvider).value ?? <PropertyRecord>[];
    final tenants = ref.watch(tenantsProvider).value ?? <TenantRecord>[];
    final units = ref.watch(unitsProvider).value ?? <UnitRecord>[];
    final contracts = ref.watch(contractsProvider).value ?? <ContractRecord>[];
    final activeTenantIds = contracts
        .where((contract) => contract.status == 'active')
        .map((contract) => contract.tenantId)
        .toSet();
    final contractableTenants = tenants
        .where((tenant) => !activeTenantIds.contains(tenant.id))
        .toList();
    final selectedTenant = _tenantById(contractableTenants, _tenant?.id);
    final selectedProperty = _propertyById(
      properties,
      selectedTenant?.propertyId,
    );
    final selectedUnit = selectedTenant == null
        ? null
        : _unitByNo(
            units
                .where((unit) => unit.propertyId == selectedTenant.propertyId)
                .toList(),
            selectedTenant.unitId,
          );

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MilaakSectionHeader(
              title: 'إنشاء عقد',
              subtitle: 'اختر المستأجر فقط؛ العقار والوحدة تأتي من ملفه.',
            ),
            const SizedBox(height: 16),
            const FieldTitle('المستأجر'),
            DropdownButtonFormField<TenantRecord>(
              value: selectedTenant,
              items: contractableTenants
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: Text('${item.name} - ${item.propertyName}'),
                    ),
                  )
                  .toList(),
              onChanged: (value) => setState(() {
                _tenant = value;
              }),
              validator: (value) {
                if (contractableTenants.isEmpty) {
                  return 'لا يوجد مستأجرون جاهزون لعقد جديد';
                }
                return value == null ? 'اختر مستأجراً' : null;
              },
              decoration: InputDecoration(
                hintText: contractableTenants.isEmpty
                    ? 'أضف مستأجراً أولاً'
                    : 'اختر المستأجر',
              ),
            ),
            const SizedBox(height: 12),
            _LinkedRentalCard(
              tenant: selectedTenant,
              property: selectedProperty,
              unit: selectedUnit,
            ),
            const SizedBox(height: 12),
            const FieldTitle('اسم المؤجر'),
            TextFormField(
              controller: _landlord,
              validator: (value) =>
                  value == null || value.trim().isEmpty ? 'مطلوب' : null,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _DateButton(
                    label: 'البداية',
                    value: _start,
                    onPressed: () => _pickDate(start: true),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _DateButton(
                    label: 'النهاية',
                    value: _end,
                    onPressed: () => _pickDate(start: false),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FieldTitle('قيمة الإيجار'),
                      TextFormField(
                        controller: _rent,
                        keyboardType: TextInputType.number,
                        validator: (value) =>
                            (double.tryParse(value ?? '') ?? 0) <= 0
                            ? 'مطلوب'
                            : null,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FieldTitle('التأمين'),
                      TextFormField(
                        controller: _deposit,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const FieldTitle('دورية الدفع'),
            DropdownButtonFormField<String>(
              value: _frequency,
              items: const ['شهري', 'ربع سنوي', 'نصف سنوي', 'سنوي']
                  .map(
                    (item) => DropdownMenuItem(value: item, child: Text(item)),
                  )
                  .toList(),
              onChanged: (value) =>
                  setState(() => _frequency = value ?? 'شهري'),
            ),
            const SizedBox(height: 12),
            const FieldTitle('بنود إضافية'),
            TextFormField(
              controller: _terms,
              minLines: 3,
              maxLines: 6,
              decoration: const InputDecoration(
                hintText: 'مثال: يتحمل المستأجر فواتير الخدمات الدورية...',
              ),
            ),
            const SizedBox(height: 18),
            FilledButton.icon(
              onPressed: _saving ? null : _save,
              icon: _saving
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.verified_rounded),
              label: const Text('اعتماد العقد'),
            ),
          ],
        ),
      ),
    );
  }
}

class _DateButton extends StatelessWidget {
  const _DateButton({
    required this.label,
    required this.value,
    required this.onPressed,
  });

  final String label;
  final DateTime value;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.event_rounded),
      label: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelSmall),
          Text(formatDate(value), overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}

class _LinkedRentalCard extends StatelessWidget {
  const _LinkedRentalCard({
    required this.tenant,
    required this.property,
    required this.unit,
  });

  final TenantRecord? tenant;
  final PropertyRecord? property;
  final UnitRecord? unit;

  @override
  Widget build(BuildContext context) {
    if (tenant == null) {
      return MilaakSoftCard(
        child: Row(
          children: [
            const MilaakIconBadge(
              icon: Icons.info_outline_rounded,
              color: MilaakColors.contractGold,
              size: 46,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'اختر المستأجر لعرض العقار والوحدة المرتبطين به.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: MilaakColors.textSoft,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      );
    }

    final unitStatus = unit == null
        ? 'غير موجودة في سجل الوحدات'
        : unitStatusName(unit!.status);
    final statusColor = unit == null
        ? MilaakColors.arrears
        : switch (unit!.status) {
            'vacant' => MilaakColors.collected,
            'reserved' => MilaakColors.contractGold,
            'leased' => MilaakColors.arrears,
            _ => MilaakColors.textSoft,
          };

    return MilaakSoftCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MilaakSectionHeader(
            title: 'الربط المعتمد للعقد',
            subtitle:
                'هذه البيانات مأخوذة من ملف المستأجر ولا تحتاج إعادة اختيار.',
          ),
          const SizedBox(height: 12),
          _LinkedLine(
            icon: Icons.apartment_rounded,
            label: 'العقار',
            value: property?.name ?? tenant!.propertyName,
          ),
          const SizedBox(height: 10),
          _LinkedLine(
            icon: Icons.meeting_room_rounded,
            label: 'الوحدة',
            value: tenant!.unitId,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.verified_outlined,
                size: 20,
                color: MilaakColors.textSoft,
              ),
              const SizedBox(width: 8),
              Text(
                'حالة الوحدة',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: MilaakColors.textSoft,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              MilaakStatusBadge(label: unitStatus, color: statusColor),
            ],
          ),
        ],
      ),
    );
  }
}

class _LinkedLine extends StatelessWidget {
  const _LinkedLine({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: MilaakColors.primary),
        const SizedBox(width: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: MilaakColors.textSoft,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
      ],
    );
  }
}

PropertyRecord? _propertyById(List<PropertyRecord> items, int? id) {
  if (id == null) return null;
  for (final item in items) {
    if (item.id == id) return item;
  }
  return null;
}

TenantRecord? _tenantById(List<TenantRecord> items, int? id) {
  if (id == null) return null;
  for (final item in items) {
    if (item.id == id) return item;
  }
  return null;
}

UnitRecord? _unitByNo(List<UnitRecord> items, String? unitNo) {
  final trimmed = unitNo?.trim();
  if (trimmed == null || trimmed.isEmpty) return null;
  for (final item in items) {
    if (item.unitNo == trimmed) return item;
  }
  return null;
}

String _friendlyContractError(Object error) {
  if (error is StateError) return error.message;
  final text = error.toString();
  const prefix = 'Bad state: ';
  if (text.startsWith(prefix)) return text.substring(prefix.length);
  return 'تعذر اعتماد العقد. راجع البيانات وحاول مرة أخرى.';
}
