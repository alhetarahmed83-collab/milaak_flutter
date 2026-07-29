import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../../core/formatters.dart';
import '../../core/labels.dart';
import '../../data/local/app_database.dart';
import '../../data/repositories/rental_repositories.dart';
import '../../services/pdf_service.dart';
import '../../shared/widgets/empty_state.dart';
import '../../shared/widgets/form_helpers.dart';
import '../../shared/widgets/milaak_ui.dart';
import '../../shared/widgets/screen_scaffold.dart';

class PropertiesScreen extends ConsumerStatefulWidget {
  const PropertiesScreen({super.key});

  @override
  ConsumerState<PropertiesScreen> createState() => _PropertiesScreenState();
}

class _PropertiesScreenState extends ConsumerState<PropertiesScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final properties = ref.watch(propertiesProvider);
    final units = ref.watch(unitsProvider).value ?? <UnitRecord>[];

    return ScreenScaffold(
      title: 'العقارات',
      subtitle: 'محفظة العقارات والوحدات وحالة الإشغال.',
      actions: [
        IconButton.outlined(
          tooltip: 'تصدير PDF',
          onPressed: () => PdfService().shareProperties(
            properties.valueOrNull ?? <PropertyRecord>[],
            context: context,
          ),
          icon: const Icon(Icons.picture_as_pdf_rounded),
        ),
      ],
      action: IconButton.filled(
        tooltip: 'إضافة عقار',
        onPressed: () => showMilaakSheet(context, const PropertyForm()),
        icon: const Icon(Icons.add_rounded),
      ),
      child: properties.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            Center(child: Text('تعذر جلب العقارات: $error')),
        data: (items) {
          final filtered = items
              .where((item) => '${item.name} ${item.address}'.contains(_query))
              .toList();
          return Column(
            children: [
              MilaakSoftCard(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search_rounded),
                    hintText: 'بحث في العقارات',
                  ),
                  onChanged: (value) => setState(() => _query = value.trim()),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: filtered.isEmpty
                    ? const EmptyState(
                        icon: Icons.apartment_rounded,
                        title: 'لا توجد عقارات',
                        message: 'أضف أول عقار لتبدأ إدارة الوحدات والإيجارات.',
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.only(
                          bottom: MilaakSpacing.floatingDockBottomInset + 16,
                        ),
                        itemCount: filtered.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final property = filtered[index];
                          final propertyUnits = units
                              .where((unit) => unit.propertyId == property.id)
                              .toList();
                          return _PropertyCard(
                            property: property,
                            units: propertyUnits,
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _PropertyCard extends ConsumerWidget {
  const _PropertyCard({required this.property, required this.units});

  final PropertyRecord property;
  final List<UnitRecord> units;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leased = units.where((unit) => unit.status == 'leased').length;
    final vacant = units.where((unit) => unit.status == 'vacant').length;
    final maintenance = units
        .where((unit) => unit.status == 'maintenance')
        .length;
    final total = property.units == 0 ? units.length : property.units;
    final occupancy = total == 0 ? 0.0 : leased / total;
    return MilaakSoftCard(
      padding: const EdgeInsets.all(12),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PropertyDetailsScreen(property: property),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MilaakPropertyCover(
            icon: switch (property.type) {
              'villa' => Icons.villa_rounded,
              'commercial_center' || 'commercial' => Icons.storefront_rounded,
              'office_building' => Icons.business_rounded,
              'warehouse' => Icons.warehouse_rounded,
              _ => Icons.apartment_rounded,
            },
          ),
          const SizedBox(height: 13),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      (property.ownerName ?? '').trim().isEmpty
                          ? property.address
                          : '${property.address} | المالك: ${property.ownerName}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: MilaakColors.textSoft,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                tooltip: 'حذف',
                onPressed: () async {
                  await ref
                      .read(propertiesRepositoryProvider)
                      .deleteProperty(property.id);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('تم حذف العقار')),
                    );
                  }
                },
                icon: const Icon(Icons.delete_outline_rounded),
              ),
            ],
          ),
          const SizedBox(height: 12),
          MilaakProgressBar(value: occupancy, color: MilaakColors.primary),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _ChipInfo(
                  label: 'مؤجرة',
                  value: '$leased',
                  color: MilaakColors.collected,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _ChipInfo(
                  label: 'شاغرة',
                  value: '$vacant',
                  color: MilaakColors.contractGold,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _ChipInfo(
                  label: 'صيانة',
                  value: '$maintenance',
                  color: MilaakColors.arrears,
                ),
              ),
            ],
          ),
          const SizedBox(height: 11),
          Row(
            children: [
              const Icon(
                Icons.payments_rounded,
                size: 20,
                color: MilaakColors.primary,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  'الدخل المتوقع: ${formatCurrency(property.monthlyIncome)}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PropertyDetailsScreen extends ConsumerWidget {
  const PropertyDetailsScreen({super.key, required this.property});

  final PropertyRecord property;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final units = (ref.watch(unitsProvider).value ?? <UnitRecord>[])
        .where((unit) => unit.propertyId == property.id)
        .toList();
    final tenants = (ref.watch(tenantsProvider).value ?? <TenantRecord>[])
        .where((tenant) => tenant.propertyId == property.id)
        .toList();
    final expenses = (ref.watch(expensesProvider).value ?? <ExpenseRecord>[])
        .where((expense) => expense.propertyId == property.id)
        .toList();
    final contracts = (ref.watch(contractsProvider).value ?? <ContractRecord>[])
        .where((contract) => contract.propertyId == property.id)
        .toList();
    final totalExpenses = expenses.fold<double>(
      0,
      (sum, item) => sum + item.amount,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: Text(property.name)),
      body: ScreenScaffold(
        title: 'تفاصيل العقار',
        subtitle: property.address,
        actions: [
          IconButton.outlined(
            tooltip: 'تقرير PDF',
            onPressed: () => PdfService().shareLines(
              context: context,
              title: 'تقرير عقار',
              filename: 'property_${property.id}.pdf',
              lines: [
                'العقار: ${property.name}',
                'العنوان: ${property.address}',
                'نوع العقار: ${propertyTypeName(property.type)}',
                if ((property.ownerName ?? '').trim().isNotEmpty)
                  'المالك: ${property.ownerName}',
                'عدد ${unitPluralFromPropertyType(property.type)}: ${units.length}',
                'عدد المستأجرين: ${tenants.length}',
                'الدخل المتوقع: ${formatCurrency(property.monthlyIncome)}',
                'المصروفات: ${formatCurrency(totalExpenses)}',
                '',
                '${unitPluralFromPropertyType(property.type)}:',
                if (units.isEmpty)
                  'لا توجد ${unitPluralFromPropertyType(property.type)}.',
                ...units.map(
                  (unit) =>
                      '- ${formatUnitShort(property.type, unit.unitNo, unitType: unit.type)} | ${unitStatusName(unit.status)} | ${formatCurrency(unit.expectedRent)}',
                ),
                '',
                'المستأجرون:',
                if (tenants.isEmpty) 'لا يوجد مستأجرون.',
                ...tenants.map(
                  (tenant) =>
                      '- ${tenant.name} | ${formatUnitShort(property.type, tenant.unitId)} | ${tenant.phone}',
                ),
              ],
            ),
            icon: const Icon(Icons.picture_as_pdf_rounded),
          ),
          IconButton.outlined(
            tooltip: 'إضافة وحدة',
            onPressed: () =>
                showMilaakSheet(context, _UnitForm(property: property)),
            icon: const Icon(Icons.add_home_work_outlined),
          ),
        ],
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: _ChipInfo(
                    label: 'الوحدات',
                    value: '${units.length}',
                    color: MilaakColors.deepNavy,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _ChipInfo(
                    label: 'المستأجرون',
                    value: '${tenants.length}',
                    color: MilaakColors.collected,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _ChipInfo(
                    label: 'المصروفات',
                    value: formatCurrency(totalExpenses),
                    color: MilaakColors.arrears,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _PropertyServicesCard(property: property),
            const SizedBox(height: 12),
            _SectionCard(
              title: unitPluralFromPropertyType(property.type),
              empty:
                  'لا توجد ${unitPluralFromPropertyType(property.type)}. أضف أول ${unitSingularFromPropertyType(property.type)} لهذا العقار.',
              children: units.map((unit) => _UnitTile(unit: unit)).toList(),
            ),
            const SizedBox(height: 12),
            _SectionCard(
              title: 'المستأجرون',
              empty: 'لا يوجد مستأجرون مرتبطون بهذا العقار.',
              children: tenants
                  .map(
                    (tenant) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.person_outline_rounded),
                      title: Text(
                        tenant.name,
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                      subtitle: Text(
                        '${formatUnitShort(property.type, tenant.unitId)} - ${tenant.phone}',
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 12),
            _SectionCard(
              title: 'العقود',
              empty: 'لا توجد عقود مرتبطة بهذا العقار.',
              children: contracts
                  .map(
                    (contract) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.description_outlined),
                      title: Text(
                        contract.contractNo.isEmpty
                            ? 'عقد ${contract.id}'
                            : contract.contractNo,
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                      subtitle: Text(
                        '${contract.tenantName} - ${formatDate(contract.endDate)}',
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _UnitTile extends ConsumerWidget {
  const _UnitTile({required this.unit});

  final UnitRecord unit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = switch (unit.status) {
      'leased' => MilaakColors.collected,
      'maintenance' => MilaakColors.arrears,
      'reserved' => MilaakColors.contractGold,
      _ => MilaakColors.deepNavy,
    };
    final properties =
        ref.watch(propertiesProvider).value ?? <PropertyRecord>[];
    final matched = properties.where((p) => p.id == unit.propertyId).toList();
    final PropertyRecord? property = matched.isNotEmpty ? matched.first : null;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: _IconBox(icon: Icons.meeting_room_outlined, color: color),
      title: Text(
        formatUnitShort(property?.type, unit.unitNo, unitType: unit.type),
        style: const TextStyle(fontWeight: FontWeight.w900),
      ),
      subtitle: Text(
        '${unitStatusName(unit.status)}${unit.tenantName == null ? '' : ' - ${unit.tenantName}'}',
      ),
      trailing: PopupMenuButton<String>(
        tooltip: 'تغيير الحالة',
        onSelected: (value) =>
            ref.read(unitsRepositoryProvider).updateStatus(unit, value),
        itemBuilder: (context) => const [
          PopupMenuItem(value: 'vacant', child: Text('شاغرة')),
          PopupMenuItem(value: 'reserved', child: Text('محجوزة')),
          PopupMenuItem(value: 'leased', child: Text('مؤجرة')),
          PopupMenuItem(value: 'maintenance', child: Text('صيانة')),
        ],
      ),
    );
  }
}

class PropertyForm extends ConsumerStatefulWidget {
  const PropertyForm({super.key});

  @override
  ConsumerState<PropertyForm> createState() => _PropertyFormState();
}

class _PropertyFormState extends ConsumerState<PropertyForm> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _address = TextEditingController();
  final _ownerName = TextEditingController();
  final _units = TextEditingController(text: '1');
  final _floors = TextEditingController(text: '1');
  final _unitsPerFloor = TextEditingController(text: '1');
  final _shops = TextEditingController(text: '0');
  String _type = 'residential_building';
  String _electricityServiceMode = 'owner_meter';
  String _waterServiceMode = 'owner_meter';
  String _gasServiceMode = 'unavailable';
  bool _saving = false;

  @override
  void dispose() {
    _name.dispose();
    _address.dispose();
    _ownerName.dispose();
    _units.dispose();
    _floors.dispose();
    _unitsPerFloor.dispose();
    _shops.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    await ref
        .read(propertiesRepositoryProvider)
        .addProperty(
          name: _name.text.trim(),
          address: _address.text.trim(),
          type: _type,
          ownerName: _ownerName.text.trim(),
          units: int.tryParse(_units.text) ?? 1,
          floors: int.tryParse(_floors.text) ?? 1,
          unitsPerFloor: int.tryParse(_unitsPerFloor.text) ?? 1,
          shops: int.tryParse(_shops.text) ?? 0,
          electricityServiceMode: _electricityServiceMode,
          waterServiceMode: _waterServiceMode,
          gasServiceMode: _gasServiceMode,
        );
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MilaakSectionHeader(
              title: 'إضافة عقار جديد',
              subtitle: 'أدخل بيانات العقار والوحدات الأساسية.',
            ),
            const SizedBox(height: 16),
            const FieldTitle('اسم العقار'),
            TextFormField(
              controller: _name,
              validator: (value) =>
                  value == null || value.trim().isEmpty ? 'مطلوب' : null,
            ),
            const SizedBox(height: 12),
            const FieldTitle('العنوان'),
            TextFormField(
              controller: _address,
              validator: (value) =>
                  value == null || value.trim().isEmpty ? 'مطلوب' : null,
            ),
            const SizedBox(height: 12),
            const FieldTitle('اسم المالك'),
            TextFormField(
              controller: _ownerName,
              decoration: const InputDecoration(hintText: 'اختياري'),
            ),
            const SizedBox(height: 12),
            const FieldTitle('نوع العقار'),
            DropdownButtonFormField<String>(
              value: _type,
              isExpanded: true,
              items:
                  const [
                        'villa',
                        'residential_building',
                        'commercial_center',
                        'office_building',
                        'mixed_use',
                        'warehouse',
                        'other',
                      ]
                      .map(
                        (type) => DropdownMenuItem(
                          value: type,
                          child: Text(propertyTypeName(type)),
                        ),
                      )
                      .toList(),
              onChanged: (value) => setState(() => _type = value ?? _type),
            ),
            const SizedBox(height: 12),
            const FieldTitle('عدد الوحدات'),
            TextFormField(
              controller: _units,
              keyboardType: TextInputType.number,
              validator: (value) => (int.tryParse(value ?? '') ?? 0) < 1
                  ? 'أدخل رقماً صحيحاً'
                  : null,
            ),
            const SizedBox(height: 12),
            const FieldTitle('عدد الأدوار'),
            TextFormField(
              controller: _floors,
              keyboardType: TextInputType.number,
              validator: (value) => (int.tryParse(value ?? '') ?? 0) < 1
                  ? 'أدخل رقماً صحيحاً'
                  : null,
            ),
            const SizedBox(height: 12),
            const FieldTitle('عدد الشقق لكل دور'),
            TextFormField(
              controller: _unitsPerFloor,
              keyboardType: TextInputType.number,
              validator: (value) => (int.tryParse(value ?? '') ?? 0) < 1
                  ? 'أدخل رقماً صحيحاً'
                  : null,
            ),
            const SizedBox(height: 12),
            const FieldTitle('عدد المحلات'),
            TextFormField(
              controller: _shops,
              keyboardType: TextInputType.number,
              validator: (value) => (int.tryParse(value ?? '') ?? 0) < 0
                  ? 'أدخل رقماً صحيحاً'
                  : null,
            ),
            const SizedBox(height: 14),
            const MilaakSectionHeader(
              title: 'إعدادات الخدمات',
              subtitle:
                  'تحدد القاعدة الافتراضية لفواتير الماء والكهرباء لهذا العقار.',
            ),
            const SizedBox(height: 12),
            _ServicePolicyField(
              title: 'الكهرباء',
              icon: Icons.bolt_rounded,
              value: _electricityServiceMode,
              allowInherit: false,
              onChanged: (value) =>
                  setState(() => _electricityServiceMode = value),
            ),
            const SizedBox(height: 10),
            _ServicePolicyField(
              title: 'الماء',
              icon: Icons.water_drop_rounded,
              value: _waterServiceMode,
              allowInherit: false,
              onChanged: (value) => setState(() => _waterServiceMode = value),
            ),
            const SizedBox(height: 10),
            _ServicePolicyField(
              title: 'الغاز',
              icon: Icons.local_fire_department_rounded,
              value: _gasServiceMode,
              allowInherit: false,
              onChanged: (value) => setState(() => _gasServiceMode = value),
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
                  : const Icon(Icons.save_rounded),
              label: const Text('حفظ العقار'),
            ),
          ],
        ),
      ),
    );
  }
}

class _UnitForm extends ConsumerStatefulWidget {
  const _UnitForm({required this.property});

  final PropertyRecord property;

  @override
  ConsumerState<_UnitForm> createState() => _UnitFormState();
}

class _UnitFormState extends ConsumerState<_UnitForm> {
  final _formKey = GlobalKey<FormState>();
  final _unitNo = TextEditingController();
  final _floor = TextEditingController();
  final _rent = TextEditingController(text: '0');
  final _electricityMeterNo = TextEditingController();
  final _waterMeterNo = TextEditingController();
  final _gasMeterNo = TextEditingController();
  String _type = 'apartment';
  String _electricityServiceMode = 'inherit';
  String _waterServiceMode = 'inherit';
  String _gasServiceMode = 'inherit';
  bool _saving = false;

  @override
  void dispose() {
    _unitNo.dispose();
    _floor.dispose();
    _rent.dispose();
    _electricityMeterNo.dispose();
    _waterMeterNo.dispose();
    _gasMeterNo.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    await ref
        .read(unitsRepositoryProvider)
        .addUnit(
          property: widget.property,
          unitNo: _unitNo.text.trim(),
          floor: _floor.text.trim(),
          type: _type,
          expectedRent: double.tryParse(_rent.text) ?? 0,
          electricityServiceMode: _electricityServiceMode,
          electricityMeterNo: _electricityMeterNo.text.trim(),
          waterServiceMode: _waterServiceMode,
          waterMeterNo: _waterMeterNo.text.trim(),
          gasServiceMode: _gasServiceMode,
          gasMeterNo: _gasMeterNo.text.trim(),
        );
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MilaakSectionHeader(
              title: 'إضافة وحدة',
              subtitle: 'أضف رقم الوحدة والدور والإيجار المتوقع.',
            ),
            const SizedBox(height: 16),
            const FieldTitle('رقم الوحدة'),
            TextFormField(
              controller: _unitNo,
              validator: (value) =>
                  value == null || value.trim().isEmpty ? 'مطلوب' : null,
            ),
            const SizedBox(height: 12),
            const FieldTitle('الدور'),
            TextFormField(controller: _floor),
            const SizedBox(height: 12),
            const FieldTitle('نوع الوحدة'),
            DropdownButtonFormField<String>(
              value: _type,
              items: const ['apartment', 'office', 'shop', 'villa', 'warehouse']
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: Text(_unitTypeName(item)),
                    ),
                  )
                  .toList(),
              onChanged: (value) =>
                  setState(() => _type = value ?? 'apartment'),
            ),
            const SizedBox(height: 12),
            const FieldTitle('الإيجار المتوقع'),
            TextFormField(
              controller: _rent,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 14),
            const MilaakSectionHeader(
              title: 'خدمات الوحدة',
              subtitle:
                  'اتركها حسب العقار أو خصص طريقة الدفع ورقم العداد لهذه الوحدة.',
            ),
            const SizedBox(height: 12),
            _UnitServicePolicyField(
              title: 'الكهرباء',
              icon: Icons.bolt_rounded,
              value: _electricityServiceMode,
              meterController: _electricityMeterNo,
              inheritedLabel: servicePolicyLabel(
                widget.property.electricityServiceMode,
              ),
              onChanged: (value) =>
                  setState(() => _electricityServiceMode = value),
            ),
            const SizedBox(height: 10),
            _UnitServicePolicyField(
              title: 'الماء',
              icon: Icons.water_drop_rounded,
              value: _waterServiceMode,
              meterController: _waterMeterNo,
              inheritedLabel: servicePolicyLabel(
                widget.property.waterServiceMode,
              ),
              onChanged: (value) => setState(() => _waterServiceMode = value),
            ),
            const SizedBox(height: 10),
            _UnitServicePolicyField(
              title: 'الغاز',
              icon: Icons.local_fire_department_rounded,
              value: _gasServiceMode,
              meterController: _gasMeterNo,
              inheritedLabel: servicePolicyLabel(
                widget.property.gasServiceMode,
              ),
              onChanged: (value) => setState(() => _gasServiceMode = value),
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
                  : const Icon(Icons.save_rounded),
              label: const Text('حفظ الوحدة'),
            ),
          ],
        ),
      ),
    );
  }
}

class _PropertyServicesCard extends StatelessWidget {
  const _PropertyServicesCard({required this.property});

  final PropertyRecord property;

  @override
  Widget build(BuildContext context) {
    return MilaakSoftCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الخدمات',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 10),
          _ServiceSummaryLine(
            icon: Icons.bolt_rounded,
            title: 'الكهرباء',
            value: servicePolicyLabel(property.electricityServiceMode),
          ),
          _ServiceSummaryLine(
            icon: Icons.water_drop_rounded,
            title: 'الماء',
            value: servicePolicyLabel(property.waterServiceMode),
          ),
          _ServiceSummaryLine(
            icon: Icons.local_fire_department_rounded,
            title: 'الغاز',
            value: servicePolicyLabel(property.gasServiceMode),
          ),
        ],
      ),
    );
  }
}

class _ServiceSummaryLine extends StatelessWidget {
  const _ServiceSummaryLine({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: MilaakColors.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: MilaakColors.textSoft,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ServicePolicyField extends StatelessWidget {
  const _ServicePolicyField({
    required this.title,
    required this.icon,
    required this.value,
    required this.onChanged,
    this.allowInherit = true,
  });

  final String title;
  final IconData icon;
  final String value;
  final ValueChanged<String> onChanged;
  final bool allowInherit;

  @override
  Widget build(BuildContext context) {
    final values = [
      if (allowInherit) 'inherit',
      'unavailable',
      'owner_meter',
      'tenant_meter',
      'shared_meter',
    ];

    return Row(
      children: [
        MilaakIconBadge(icon: icon, color: MilaakColors.primary, size: 44),
        const SizedBox(width: 10),
        Expanded(
          child: DropdownButtonFormField<String>(
            value: value,
            items: values
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Text(servicePolicyLabel(item)),
                  ),
                )
                .toList(),
            onChanged: (next) => onChanged(next ?? value),
            decoration: InputDecoration(labelText: title),
          ),
        ),
      ],
    );
  }
}

class _UnitServicePolicyField extends StatelessWidget {
  const _UnitServicePolicyField({
    required this.title,
    required this.icon,
    required this.value,
    required this.meterController,
    required this.inheritedLabel,
    required this.onChanged,
  });

  final String title;
  final IconData icon;
  final String value;
  final TextEditingController meterController;
  final String inheritedLabel;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final showMeter = value != 'inherit' && value != 'unavailable';
    return MilaakSoftCard(
      padding: const EdgeInsets.all(12),
      color: MilaakColors.softSurface,
      borderColor: MilaakColors.border,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ServicePolicyField(
            title: title,
            icon: icon,
            value: value,
            onChanged: onChanged,
          ),
          if (value == 'inherit') ...[
            const SizedBox(height: 8),
            Text(
              'سيستخدم إعداد العقار: $inheritedLabel',
              style: const TextStyle(
                color: MilaakColors.textSoft,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
          if (showMeter) ...[
            const SizedBox(height: 10),
            TextFormField(
              controller: meterController,
              decoration: const InputDecoration(hintText: 'رقم العداد اختياري'),
            ),
          ],
        ],
      ),
    );
  }
}

class _ChipInfo extends StatelessWidget {
  const _ChipInfo({
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .10),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: MilaakColors.textSoft,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 3),
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

class _IconBox extends StatelessWidget {
  const _IconBox({required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MilaakIconBadge(icon: icon, color: color, size: 44);
  }
}

String _unitTypeName(String type) {
  return switch (type) {
    'office' => 'مكتب',
    'shop' => 'محل',
    'villa' => 'فيلا',
    _ => 'شقة',
  };
}
