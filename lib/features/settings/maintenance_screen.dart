import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../../core/formatters.dart';
import '../../core/labels.dart';
import '../../data/local/app_database.dart';
import '../../data/repositories/rental_repositories.dart';
import '../../shared/widgets/empty_state.dart';
import '../../shared/widgets/form_helpers.dart';
import '../../shared/widgets/milaak_ui.dart';
import '../../shared/widgets/screen_scaffold.dart';

String damageResponsibilityLabel(String responsibility) {
  return switch (responsibility) {
    'owner' => 'مالك',
    'shared' => 'مشترك',
    _ => 'مستأجر',
  };
}

class MaintenanceScreen extends ConsumerWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickets = ref.watch(maintenanceTicketsProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: const Text('الصيانة')),
      body: ScreenScaffold(
        title: 'بلاغات الصيانة',
        subtitle: 'متابعة بلاغات الوحدات وتكاليفها وحالتها.',
        action: IconButton.filled(
          tooltip: 'بلاغ جديد',
          onPressed: () => showMilaakSheet(context, const _MaintenanceForm()),
          icon: const Icon(Icons.add_task_rounded),
        ),
        child: tickets.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) =>
              Center(child: Text('تعذر جلب البلاغات: $error')),
          data: (items) => items.isEmpty
              ? const EmptyState(
                  icon: Icons.build_circle_outlined,
                  title: 'لا توجد بلاغات صيانة',
                  message: 'افتح بلاغ صيانة عند وجود طلب أو تكلفة على وحدة.',
                )
              : ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) =>
                      _TicketCard(ticket: items[index]),
                ),
        ),
      ),
    );
  }
}

class _TicketCard extends ConsumerWidget {
  const _TicketCard({required this.ticket});

  final MaintenanceTicketRecord ticket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = switch (ticket.status) {
      'closed' => MilaakColors.collected,
      'in_progress' => MilaakColors.contractGold,
      _ => MilaakColors.arrears,
    };
    final properties =
        ref.watch(propertiesProvider).value ?? <PropertyRecord>[];
    final matched = properties.where((p) => p.id == ticket.propertyId).toList();
    final PropertyRecord? property = matched.isNotEmpty ? matched.first : null;
    return MilaakSoftCard(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: ListTile(
        leading: MilaakIconBadge(
          icon: Icons.build_circle_outlined,
          color: color,
          size: 46,
        ),
        title: Text(
          ticket.title,
          style: const TextStyle(fontWeight: FontWeight.w900),
        ),
        subtitle: Text(
          '${ticket.propertyName}${ticket.unitId == null ? '' : ' - ${formatUnitShort(property?.type, ticket.unitId)}'}\n${ticket.description}\nالتكلفة: ${formatCurrency(ticket.cost)}\nمسؤولية: ${damageResponsibilityLabel(ticket.damageResponsibility)}${ticket.chargeFromDeposit ? ' - يخصم من التأمين' : ''}',
        ),
        isThreeLine: true,
        trailing: PopupMenuButton<String>(
          tooltip: 'الحالة',
          onSelected: (value) => ref
              .read(maintenanceRepositoryProvider)
              .updateStatus(ticket, value),
          itemBuilder: (context) => const [
            PopupMenuItem(value: 'open', child: Text('مفتوح')),
            PopupMenuItem(value: 'in_progress', child: Text('قيد المعالجة')),
            PopupMenuItem(value: 'closed', child: Text('مغلق')),
          ],
        ),
      ),
    );
  }
}

class _MaintenanceForm extends ConsumerStatefulWidget {
  const _MaintenanceForm();

  @override
  ConsumerState<_MaintenanceForm> createState() => _MaintenanceFormState();
}

class _MaintenanceFormState extends ConsumerState<_MaintenanceForm> {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _cost = TextEditingController(text: '0');
  PropertyRecord? _property;
  int? _unitId;
  String _priority = 'normal';
  String _damageResponsibility = 'tenant';
  bool _chargeFromDeposit = false;
  bool _saving = false;

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    _cost.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final properties = ref.read(propertiesProvider).value ?? <PropertyRecord>[];
    final tenants = ref.read(tenantsProvider).value ?? <TenantRecord>[];
    final units = ref.read(unitsProvider).value ?? <UnitRecord>[];
    final property = _propertyById(properties, _property?.id);
    final unit = _unitById(units, _unitId);
    final tenant = _tenantForUnit(tenants, unit);
    if (!_formKey.currentState!.validate() ||
        property == null ||
        unit == null) {
      return;
    }
    setState(() => _saving = true);
    await ref
        .read(maintenanceRepositoryProvider)
        .addTicket(
          property: property,
          unitId: unit.unitNo,
          tenant: tenant,
          title: _title.text.trim(),
          description: _description.text.trim(),
          priority: _priority,
          cost: double.tryParse(_cost.text) ?? 0,
          damageResponsibility:
              tenant == null && _damageResponsibility == 'tenant'
              ? 'owner'
              : _damageResponsibility,
          chargeFromDeposit: _chargeFromDeposit,
        );
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final properties =
        ref.watch(propertiesProvider).value ?? <PropertyRecord>[];
    final tenants = ref.watch(tenantsProvider).value ?? <TenantRecord>[];
    final units = ref.watch(unitsProvider).value ?? <UnitRecord>[];
    final selectedProperty = _propertyById(properties, _property?.id);
    final propertyUnits = selectedProperty == null
        ? <UnitRecord>[]
        : units
              .where((unit) => unit.propertyId == selectedProperty.id)
              .toList();
    final selectedUnit = _unitById(propertyUnits, _unitId);
    final selectedTenant = _tenantForUnit(tenants, selectedUnit);
    final unitIsVacant = selectedUnit != null && selectedTenant == null;

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MilaakSectionHeader(
              title: 'بلاغ صيانة جديد',
              subtitle: 'حدد العقار والوحدة والتكلفة والمسؤولية.',
            ),
            const SizedBox(height: 16),
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
                  _unitId = null;
                  _chargeFromDeposit = false;
                });
              },
              validator: (value) => value == null ? 'اختر عقاراً' : null,
            ),
            const SizedBox(height: 12),
            const FieldTitle('الوحدة'),
            DropdownButtonFormField<int>(
              value: selectedUnit?.id,
              items: propertyUnits
                  .map(
                    (unit) => DropdownMenuItem<int>(
                      value: unit.id,
                      child: Text(
                        '${formatUnitShort(selectedProperty?.type, unit.unitNo, unitType: unit.type)} - ${unitStatusName(unit.status)}',
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _unitId = value;
                  final unit = _unitById(propertyUnits, value);
                  final tenant = _tenantForUnit(tenants, unit);
                  if (tenant == null && _damageResponsibility == 'tenant') {
                    _damageResponsibility = 'owner';
                    _chargeFromDeposit = false;
                  }
                });
              },
              validator: (value) => value == null ? 'اختر وحدة' : null,
              decoration: InputDecoration(
                hintText: selectedProperty == null
                    ? 'اختر العقار أولاً'
                    : propertyUnits.isEmpty
                    ? 'لا توجد وحدات لهذا العقار'
                    : 'اختر الوحدة',
              ),
            ),
            if (selectedUnit != null) ...[
              const SizedBox(height: 10),
              _UnitOccupancyHint(unit: selectedUnit, tenant: selectedTenant),
            ],
            const SizedBox(height: 12),
            const FieldTitle('العنوان'),
            TextFormField(
              controller: _title,
              validator: (value) =>
                  value == null || value.trim().isEmpty ? 'مطلوب' : null,
            ),
            const SizedBox(height: 12),
            const FieldTitle('الوصف'),
            TextFormField(
              controller: _description,
              minLines: 2,
              maxLines: 4,
              validator: (value) =>
                  value == null || value.trim().isEmpty ? 'مطلوب' : null,
            ),
            const SizedBox(height: 12),
            const FieldTitle('الأولوية'),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'normal', label: Text('عادي')),
                ButtonSegment(value: 'high', label: Text('مهم')),
                ButtonSegment(value: 'urgent', label: Text('عاجل')),
              ],
              selected: {_priority},
              onSelectionChanged: (value) =>
                  setState(() => _priority = value.first),
            ),
            const SizedBox(height: 12),
            const FieldTitle('مسؤولية الضرر'),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'tenant', label: Text('المستأجر')),
                ButtonSegment(value: 'owner', label: Text('المالك')),
                ButtonSegment(value: 'shared', label: Text('مشترك')),
              ],
              selected: {_damageResponsibility},
              onSelectionChanged: (value) {
                final next = value.first;
                setState(() {
                  _damageResponsibility =
                      selectedTenant == null && next == 'tenant'
                      ? 'owner'
                      : next;
                });
              },
            ),
            const SizedBox(height: 12),
            CheckboxListTile(
              title: const Text('خصم من التأمين'),
              value: _chargeFromDeposit,
              onChanged: unitIsVacant
                  ? null
                  : (value) =>
                        setState(() => _chargeFromDeposit = value ?? false),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            const SizedBox(height: 12),
            const FieldTitle('التكلفة'),
            TextFormField(
              controller: _cost,
              keyboardType: TextInputType.number,
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
              label: const Text('حفظ البلاغ'),
            ),
          ],
        ),
      ),
    );
  }
}

class _UnitOccupancyHint extends StatelessWidget {
  const _UnitOccupancyHint({required this.unit, required this.tenant});

  final UnitRecord unit;
  final TenantRecord? tenant;

  @override
  Widget build(BuildContext context) {
    final occupied = tenant != null;
    final color = occupied ? MilaakColors.collected : MilaakColors.contractGold;

    return MilaakSoftCard(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      color: color.withValues(alpha: .08),
      borderColor: color.withValues(alpha: .22),
      child: Row(
        children: [
          MilaakIconBadge(
            icon: occupied
                ? Icons.person_pin_circle_rounded
                : Icons.meeting_room_outlined,
            color: color,
            size: 42,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  occupied ? 'المستأجر: ${tenant!.name}' : 'الوحدة فارغة',
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 2),
                Text(
                  'حالة الوحدة: ${unitStatusName(unit.status)}',
                  style: const TextStyle(
                    color: MilaakColors.textSoft,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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

UnitRecord? _unitById(List<UnitRecord> items, int? id) {
  if (id == null) return null;
  for (final item in items) {
    if (item.id == id) return item;
  }
  return null;
}

TenantRecord? _tenantForUnit(List<TenantRecord> tenants, UnitRecord? unit) {
  if (unit == null) return null;
  if (unit.tenantId != null) {
    for (final tenant in tenants) {
      if (tenant.id == unit.tenantId) return tenant;
    }
  }
  for (final tenant in tenants) {
    if (tenant.propertyId == unit.propertyId && tenant.unitId == unit.unitNo) {
      return tenant;
    }
  }
  return null;
}
