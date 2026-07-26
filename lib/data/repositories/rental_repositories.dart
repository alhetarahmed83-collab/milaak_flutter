import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:drift/drift.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/formatters.dart';
import '../../core/labels.dart';
import '../local/app_database.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});

final propertiesRepositoryProvider = Provider<PropertiesRepository>(
  (ref) => PropertiesRepository(ref.watch(databaseProvider)),
);
final unitsRepositoryProvider = Provider<UnitsRepository>(
  (ref) => UnitsRepository(ref.watch(databaseProvider)),
);
final tenantsRepositoryProvider = Provider<TenantsRepository>(
  (ref) => TenantsRepository(ref.watch(databaseProvider)),
);
final contractsRepositoryProvider = Provider<ContractsRepository>(
  (ref) => ContractsRepository(ref.watch(databaseProvider)),
);
final paymentsRepositoryProvider = Provider<PaymentsRepository>(
  (ref) => PaymentsRepository(ref.watch(databaseProvider)),
);
final expensesRepositoryProvider = Provider<ExpensesRepository>(
  (ref) => ExpensesRepository(ref.watch(databaseProvider)),
);
final maintenanceRepositoryProvider = Provider<MaintenanceRepository>(
  (ref) => MaintenanceRepository(ref.watch(databaseProvider)),
);
final messagesRepositoryProvider = Provider<MessagesRepository>(
  (ref) => MessagesRepository(ref.watch(databaseProvider)),
);
final attachmentsRepositoryProvider = Provider<AttachmentsRepository>(
  (ref) => AttachmentsRepository(ref.watch(databaseProvider)),
);
final auditRepositoryProvider = Provider<AuditRepository>(
  (ref) => AuditRepository(ref.watch(databaseProvider)),
);
final reportsRepositoryProvider = Provider<ReportsRepository>(
  (ref) => ReportsRepository(ref.watch(databaseProvider)),
);
final settingsRepositoryProvider = Provider<SettingsRepository>(
  (ref) => SettingsRepository(ref.watch(databaseProvider)),
);
final backupRepositoryProvider = Provider<BackupRepository>(
  (ref) => BackupRepository(ref.watch(databaseProvider)),
);
final utilityBillsRepositoryProvider = Provider<UtilityBillsRepository>(
  (ref) => UtilityBillsRepository(ref.watch(databaseProvider)),
);

final propertiesProvider = StreamProvider(
  (ref) => ref.watch(propertiesRepositoryProvider).watchAll(),
);
final unitsProvider = StreamProvider(
  (ref) => ref.watch(unitsRepositoryProvider).watchAll(),
);
final tenantsProvider = StreamProvider(
  (ref) => ref.watch(tenantsRepositoryProvider).watchAll(),
);
final contractsProvider = StreamProvider(
  (ref) => ref.watch(contractsRepositoryProvider).watchAll(),
);
final paymentsProvider = StreamProvider(
  (ref) => ref.watch(paymentsRepositoryProvider).watchAll(),
);
final utilityBillsProvider = StreamProvider(
  (ref) => ref.watch(utilityBillsRepositoryProvider).watchOpen(),
);
final allUtilityBillsProvider = StreamProvider(
  (ref) => ref.watch(utilityBillsRepositoryProvider).watchAll(),
);
final chargeableUtilityBillsProvider = StreamProvider(
  (ref) => ref.watch(utilityBillsRepositoryProvider).watchOpenChargeable(),
);
final tenantUtilityBillsProvider =
    StreamProvider.family<List<UtilityBillRecord>, int>(
      (ref, tenantId) =>
          ref.watch(utilityBillsRepositoryProvider).watchOpenByTenant(tenantId),
    );
final tenantMaintenanceTicketsProvider =
    StreamProvider.family<List<MaintenanceTicketRecord>, int>(
      (ref, tenantId) =>
          ref.watch(maintenanceRepositoryProvider).watchByTenant(tenantId),
    );
final rentSchedulesProvider = StreamProvider(
  (ref) => ref.watch(contractsRepositoryProvider).watchSchedules(),
);
final expensesProvider = StreamProvider(
  (ref) => ref.watch(expensesRepositoryProvider).watchAll(),
);
final maintenanceTicketsProvider = StreamProvider(
  (ref) => ref.watch(maintenanceRepositoryProvider).watchAll(),
);
final messageTemplatesProvider = StreamProvider(
  (ref) => ref.watch(messagesRepositoryProvider).watchTemplates(),
);
final messageLogsProvider = StreamProvider(
  (ref) => ref.watch(messagesRepositoryProvider).watchLogs(),
);
final attachmentsProvider = StreamProvider(
  (ref) => ref.watch(attachmentsRepositoryProvider).watchAll(),
);
final auditLogsProvider = StreamProvider(
  (ref) => ref.watch(auditRepositoryProvider).watchAll(),
);
final officeNameProvider = StreamProvider(
  (ref) => ref.watch(settingsRepositoryProvider).watchOfficeName(),
);
final startupOfficeNameProvider = FutureProvider<String?>(
  (ref) => ref
      .watch(settingsRepositoryProvider)
      .readOfficeName()
      .timeout(
        const Duration(seconds: 8),
        onTimeout: () => 'مكتب مِلاك العقاري',
      ),
);
final officePhoneProvider = StreamProvider(
  (ref) => ref.watch(settingsRepositoryProvider).watchOfficePhone(),
);
final currencyProvider = StreamProvider(
  (ref) => ref.watch(settingsRepositoryProvider).watchCurrency(),
);
final themeModeProvider = StreamProvider(
  (ref) => ref.watch(settingsRepositoryProvider).watchThemeMode(),
);

class PropertiesRepository {
  PropertiesRepository(this._db);
  final AppDatabase _db;

  Stream<List<PropertyRecord>> watchAll() {
    return (_db.select(
      _db.properties,
    )..orderBy([(row) => OrderingTerm.desc(row.createdAt)])).watch();
  }

  Future<int> addProperty({
    required String name,
    required String address,
    required String type,
    String? ownerName,
    required int units,
    int floors = 1,
    int unitsPerFloor = 1,
    int shops = 0,
    String electricityServiceMode = 'owner_meter',
    String waterServiceMode = 'owner_meter',
    String gasServiceMode = 'unavailable',
  }) {
    return _db.transaction(() async {
      final propertyId = await _db
          .into(_db.properties)
          .insert(
            PropertiesCompanion.insert(
              name: name,
              address: address,
              type: Value(type),
              ownerName: Value(_nullable(ownerName)),
              units: Value(units),
              floors: Value(floors),
              unitsPerFloor: Value(unitsPerFloor),
              shops: Value(shops),
              electricityServiceMode: Value(electricityServiceMode),
              waterServiceMode: Value(waterServiceMode),
              gasServiceMode: Value(gasServiceMode),
            ),
          );

      // create units by floors and units per floor
      for (var floor = 1; floor <= floors; floor++) {
        for (var index = 1; index <= unitsPerFloor; index++) {
          await _db
              .into(_db.units)
              .insert(
                UnitsCompanion.insert(
                  propertyId: propertyId,
                  propertyName: name,
                  unitNo: '$floor-$index',
                  floor: Value(floor.toString()),
                ),
              );
        }
      }

      // create shops
      for (var s = 1; s <= shops; s++) {
        await _db
            .into(_db.units)
            .insert(
              UnitsCompanion.insert(
                propertyId: propertyId,
                propertyName: name,
                unitNo: 'S$s',
                floor: Value('Ground'),
                type: Value('shop'),
              ),
            );
      }

      await _audit(
        action: 'create_property',
        entityType: 'properties',
        entityId: propertyId,
        description: 'إضافة عقار $name بعدد $units وحدة',
      );
      return propertyId;
    });
  }

  Future<void> deleteProperty(int id) async {
    await _db.transaction(() async {
      await (_db.delete(
        _db.properties,
      )..where((row) => row.id.equals(id))).go();
      await _audit(
        action: 'delete_property',
        entityType: 'properties',
        entityId: id,
        description: 'حذف عقار من المحفظة',
      );
    });
  }

  Future<void> _audit({
    required String action,
    required String entityType,
    required int entityId,
    required String description,
  }) {
    return _db
        .into(_db.auditLogs)
        .insert(
          AuditLogsCompanion.insert(
            action: action,
            entityType: entityType,
            entityId: Value(entityId),
            description: description,
          ),
        );
  }
}

class UnitsRepository {
  UnitsRepository(this._db);
  final AppDatabase _db;

  Stream<List<UnitRecord>> watchAll() {
    return (_db.select(_db.units)..orderBy([
          (row) => OrderingTerm.asc(row.propertyName),
          (row) => OrderingTerm.asc(row.unitNo),
        ]))
        .watch();
  }

  Stream<List<UnitRecord>> watchByProperty(int propertyId) {
    return (_db.select(_db.units)
          ..where((row) => row.propertyId.equals(propertyId))
          ..orderBy([(row) => OrderingTerm.asc(row.unitNo)]))
        .watch();
  }

  Future<int> addUnit({
    required PropertyRecord property,
    required String unitNo,
    required String? floor,
    required String type,
    required double expectedRent,
    String electricityServiceMode = 'inherit',
    String? electricityMeterNo,
    String waterServiceMode = 'inherit',
    String? waterMeterNo,
    String gasServiceMode = 'inherit',
    String? gasMeterNo,
  }) {
    return _db.transaction(() async {
      final id = await _db
          .into(_db.units)
          .insert(
            UnitsCompanion.insert(
              propertyId: property.id,
              propertyName: property.name,
              unitNo: unitNo,
              floor: Value(_nullable(floor)),
              type: Value(type),
              expectedRent: Value(expectedRent),
              electricityServiceMode: Value(electricityServiceMode),
              electricityMeterNo: Value(_nullable(electricityMeterNo)),
              waterServiceMode: Value(waterServiceMode),
              waterMeterNo: Value(_nullable(waterMeterNo)),
              gasServiceMode: Value(gasServiceMode),
              gasMeterNo: Value(_nullable(gasMeterNo)),
            ),
          );
      await _db.customUpdate(
        'UPDATE properties SET units = units + 1, updated_at = ? WHERE id = ?',
        variables: [
          Variable<DateTime>(DateTime.now()),
          Variable<int>(property.id),
        ],
        updates: {_db.properties},
      );
      await _audit(
        'add_unit',
        'units',
        id,
        'إضافة ${unitSingularFromPropertyType(property.type)} $unitNo في ${property.name}',
      );
      return id;
    });
  }

  Future<void> updateStatus(UnitRecord unit, String status) async {
    await (_db.update(_db.units)..where((row) => row.id.equals(unit.id))).write(
      UnitsCompanion(status: Value(status), updatedAt: Value(DateTime.now())),
    );
    await _audit(
      'update_unit_status',
      'units',
      unit.id,
      'تحديث حالة ${unitSingularFromUnitType(unit.type)} ${unit.unitNo} إلى ${unitStatusName(status)}',
    );
  }

  Future<void> _audit(
    String action,
    String entityType,
    int entityId,
    String description,
  ) {
    return _db
        .into(_db.auditLogs)
        .insert(
          AuditLogsCompanion.insert(
            action: action,
            entityType: entityType,
            entityId: Value(entityId),
            description: description,
          ),
        );
  }
}

class TenantsRepository {
  TenantsRepository(this._db);
  final AppDatabase _db;

  Stream<List<TenantRecord>> watchAll() {
    return (_db.select(
      _db.tenants,
    )..orderBy([(row) => OrderingTerm.desc(row.createdAt)])).watch();
  }

  Stream<List<TenantRecord>> watchByProperty(int propertyId) {
    return (_db.select(_db.tenants)
          ..where((row) => row.propertyId.equals(propertyId))
          ..orderBy([(row) => OrderingTerm.desc(row.createdAt)]))
        .watch();
  }

  Future<int> addTenant({
    required String name,
    required String phone,
    required String? email,
    required String? nationalId,
    required String? address,
    required String? notes,
    required PropertyRecord property,
    required String unitId,
    double accumulatedDebt = 0,
    double securityDeposit = 0,
    String rentalType = 'advance',
  }) {
    return _db.transaction(() async {
      final tenantId = await _db
          .into(_db.tenants)
          .insert(
            TenantsCompanion.insert(
              name: name,
              phone: phone,
              email: Value(_nullable(email)),
              nationalId: Value(_nullable(nationalId)),
              address: Value(_nullable(address)),
              notes: Value(_nullable(notes)),
              status: const Value('pending'),
              propertyId: property.id,
              propertyName: property.name,
              unitId: unitId,
              accumulatedDebt: Value(accumulatedDebt),
              securityDeposit: Value(securityDeposit),
              rentalType: Value(rentalType),
            ),
          );

      await _db.customUpdate(
        'UPDATE units SET tenant_id = ?, tenant_name = ?, status = CASE WHEN status = ? THEN ? ELSE status END, updated_at = ? WHERE property_id = ? AND unit_no = ?',
        variables: [
          Variable<int>(tenantId),
          Variable<String>(name),
          const Variable<String>('vacant'),
          const Variable<String>('reserved'),
          Variable<DateTime>(DateTime.now()),
          Variable<int>(property.id),
          Variable<String>(unitId),
        ],
        updates: {_db.units},
      );

      await _audit(
        'create_tenant',
        'tenants',
        tenantId,
        'تسجيل المستأجر $name في ${property.name} - ${unitSingularFromPropertyType(property.type)} $unitId',
      );
      return tenantId;
    });
  }

  Future<void> _audit(
    String action,
    String entityType,
    int entityId,
    String description,
  ) {
    return _db
        .into(_db.auditLogs)
        .insert(
          AuditLogsCompanion.insert(
            action: action,
            entityType: entityType,
            entityId: Value(entityId),
            description: description,
          ),
        );
  }
}

class CreateContractInput {
  const CreateContractInput({
    required this.property,
    required this.tenant,
    required this.unitId,
    required this.landlordName,
    required this.startDate,
    required this.endDate,
    required this.rentAmount,
    required this.securityDepositAmount,
    required this.paymentFrequency,
    this.customTerms,
  });

  final PropertyRecord property;
  final TenantRecord tenant;
  final String unitId;
  final String landlordName;
  final DateTime startDate;
  final DateTime endDate;
  final double rentAmount;
  final double securityDepositAmount;
  final String paymentFrequency;
  final String? customTerms;
}

class ContractsRepository {
  ContractsRepository(this._db);
  final AppDatabase _db;

  Stream<List<ContractRecord>> watchAll() {
    return (_db.select(
      _db.contracts,
    )..orderBy([(row) => OrderingTerm.desc(row.createdAt)])).watch();
  }

  Stream<List<RentScheduleRecord>> watchSchedules() {
    return (_db.select(
      _db.rentSchedules,
    )..orderBy([(row) => OrderingTerm.asc(row.dueDate)])).watch();
  }

  Future<int> approveContract(CreateContractInput input) async {
    return _db.transaction(() async {
      final unitId = input.unitId.trim();
      await _validateContractInput(input, unitId);

      final contractNo = await _nextDocumentNo(_db, 'contracts', 'CON');
      final content = _buildLocalContract(input, contractNo, unitId);
      final contractId = await _db
          .into(_db.contracts)
          .insert(
            ContractsCompanion.insert(
              tenantId: input.tenant.id,
              propertyId: input.property.id,
              contractNo: Value(contractNo),
              landlordName: input.landlordName,
              tenantName: input.tenant.name,
              propertyName: input.property.name,
              unitId: Value(unitId),
              startDate: input.startDate,
              endDate: input.endDate,
              rentAmount: input.rentAmount,
              paymentFrequency: Value(input.paymentFrequency),
              securityDepositAmount: Value(input.securityDepositAmount),
              customTerms: Value(_nullable(input.customTerms)),
              content: content,
            ),
          );

      await _db.customUpdate(
        'UPDATE properties SET occupied_units = min(occupied_units + 1, units), monthly_income = monthly_income + ?, updated_at = ? WHERE id = ?',
        variables: [
          Variable<double>(input.rentAmount),
          Variable<DateTime>(DateTime.now()),
          Variable<int>(input.property.id),
        ],
        updates: {_db.properties},
      );
      await _db.customUpdate(
        'UPDATE tenants SET accumulated_debt = accumulated_debt + ?, security_deposit = ?, status = ?, updated_at = ? WHERE id = ?',
        variables: [
          Variable<double>(input.rentAmount),
          Variable<double>(input.securityDepositAmount),
          const Variable<String>('active'),
          Variable<DateTime>(DateTime.now()),
          Variable<int>(input.tenant.id),
        ],
        updates: {_db.tenants},
      );
      await _db.customUpdate(
        'UPDATE units SET status = ?, tenant_id = ?, tenant_name = ?, expected_rent = ?, updated_at = ? WHERE property_id = ? AND unit_no = ?',
        variables: [
          const Variable<String>('leased'),
          Variable<int>(input.tenant.id),
          Variable<String>(input.tenant.name),
          Variable<double>(input.rentAmount),
          Variable<DateTime>(DateTime.now()),
          Variable<int>(input.property.id),
          Variable<String>(unitId),
        ],
        updates: {_db.units},
      );

      await _createRentSchedules(
        contractId: contractId,
        contractNo: contractNo,
        input: input,
        unitId: unitId,
      );
      await _audit(
        'approve_contract',
        'contracts',
        contractId,
        'اعتماد عقد $contractNo للمستأجر ${input.tenant.name} بقيمة ${formatCurrency(input.rentAmount)}',
      );
      return contractId;
    });
  }

  Future<void> _validateContractInput(
    CreateContractInput input,
    String unitId,
  ) async {
    if (unitId.isEmpty) {
      throw StateError('اختر وحدة للعقد.');
    }
    if (input.tenant.propertyId != input.property.id) {
      throw StateError('المستأجر المحدد غير مرتبط بهذا العقار.');
    }
    if (!input.endDate.isAfter(input.startDate)) {
      throw StateError('تاريخ نهاية العقد يجب أن يكون بعد تاريخ البداية.');
    }
    if (input.rentAmount <= 0) {
      throw StateError('قيمة الإيجار يجب أن تكون أكبر من صفر.');
    }
    if (input.securityDepositAmount < 0) {
      throw StateError('مبلغ التأمين لا يمكن أن يكون سالباً.');
    }

    final activeTenantContracts =
        await (_db.select(_db.contracts)..where(
              (row) =>
                  row.tenantId.equals(input.tenant.id) &
                  row.status.equals('active'),
            ))
            .get();
    if (activeTenantContracts.isNotEmpty) {
      throw StateError('يوجد عقد نشط لهذا المستأجر بالفعل.');
    }

    final activeUnitContracts =
        await (_db.select(_db.contracts)..where(
              (row) =>
                  row.propertyId.equals(input.property.id) &
                  row.unitId.equals(unitId) &
                  row.status.equals('active'),
            ))
            .get();
    if (activeUnitContracts.isNotEmpty) {
      throw StateError('يوجد عقد نشط لهذه الوحدة بالفعل.');
    }

    final propertyUnits = await (_db.select(
      _db.units,
    )..where((row) => row.propertyId.equals(input.property.id))).get();
    final matchingUnits = propertyUnits
        .where((unit) => unit.unitNo == unitId)
        .toList();

    if (matchingUnits.isEmpty) {
      if (propertyUnits.isNotEmpty) {
        throw StateError('الوحدة المحددة غير موجودة في هذا العقار.');
      }

      await _db
          .into(_db.units)
          .insert(
            UnitsCompanion.insert(
              propertyId: input.property.id,
              propertyName: input.property.name,
              unitNo: unitId,
            ),
          );
      return;
    }

    final unit = matchingUnits.first;
    final reservedForTenant =
        unit.status == 'reserved' && unit.tenantId == input.tenant.id;
    if (unit.status != 'vacant' && !reservedForTenant) {
      throw StateError('الوحدة ليست شاغرة أو محجوزة لهذا المستأجر.');
    }
  }

  Future<void> _createRentSchedules({
    required int contractId,
    required String contractNo,
    required CreateContractInput input,
    required String unitId,
  }) async {
    final step = _frequencyStepMonths(input.paymentFrequency);
    var dueDate = input.startDate;
    while (dueDate.isBefore(input.endDate)) {
      await _db
          .into(_db.rentSchedules)
          .insert(
            RentSchedulesCompanion.insert(
              contractId: contractId,
              tenantId: input.tenant.id,
              propertyId: input.property.id,
              tenantName: input.tenant.name,
              propertyName: input.property.name,
              unitId: unitId,
              dueDate: dueDate,
              amount: input.rentAmount,
              notes: Value(contractNo),
            ),
          );
      dueDate = _addMonths(dueDate, step);
    }
  }

  String _buildLocalContract(
    CreateContractInput input,
    String contractNo,
    String unitId,
  ) {
    final terms = _nullable(input.customTerms);
    return '''
عقد إيجار رقم $contractNo

الطرف الأول: ${input.landlordName}
الطرف الثاني: ${input.tenant.name}
العقار: ${input.property.name}
الوحدة: $unitId
العنوان: ${input.property.address}

مدة العقد من ${formatDate(input.startDate)} إلى ${formatDate(input.endDate)}.
قيمة الإيجار: ${formatCurrency(input.rentAmount)} (${input.paymentFrequency}).
مبلغ التأمين: ${formatCurrency(input.securityDepositAmount)}.

يلتزم المستأجر بسداد الإيجار في موعده والمحافظة على الوحدة، ويلتزم المؤجر بتمكين المستأجر من الانتفاع بالعقار حسب الأنظمة والتعليمات.

${terms == null ? 'بنود إضافية: لا توجد.' : 'بنود إضافية: $terms'}

تم إنشاء هذه المسودة محلياً داخل تطبيق مِلاك.
''';
  }

  Future<void> _audit(
    String action,
    String entityType,
    int entityId,
    String description,
  ) {
    return _db
        .into(_db.auditLogs)
        .insert(
          AuditLogsCompanion.insert(
            action: action,
            entityType: entityType,
            entityId: Value(entityId),
            description: description,
          ),
        );
  }

  Future<void> terminateContract({
    required ContractRecord contract,
    required TenantRecord tenant,
    required double depositDeduction,
    required bool markUnitMaintenance,
  }) async {
    await _db.transaction(() async {
      final remainingDeposit = (tenant.securityDeposit - depositDeduction)
          .clamp(0, double.infinity)
          .toDouble();
      final extraDebt = depositDeduction > tenant.securityDeposit
          ? depositDeduction - tenant.securityDeposit
          : 0.0;

      await _db.customUpdate(
        'UPDATE contracts SET status = ?, updated_at = ? WHERE id = ?',
        variables: [
          const Variable<String>('terminated'),
          Variable<DateTime>(DateTime.now()),
          Variable<int>(contract.id),
        ],
        updates: {_db.contracts},
      );

      await _db.customUpdate(
        'UPDATE tenants SET status = ?, security_deposit = ?, accumulated_debt = accumulated_debt + ?, updated_at = ? WHERE id = ?',
        variables: [
          const Variable<String>('inactive'),
          Variable<double>(remainingDeposit),
          Variable<double>(extraDebt),
          Variable<DateTime>(DateTime.now()),
          Variable<int>(tenant.id),
        ],
        updates: {_db.tenants},
      );

      await _db.customUpdate(
        'UPDATE units SET status = ?, tenant_id = NULL, tenant_name = NULL, expected_rent = 0, updated_at = ? WHERE property_id = ? AND unit_no = ?',
        variables: [
          Variable<String>(markUnitMaintenance ? 'maintenance' : 'vacant'),
          Variable<DateTime>(DateTime.now()),
          Variable<int>(contract.propertyId),
          Variable<String>(contract.unitId),
        ],
        updates: {_db.units},
      );

      await _audit(
        'terminate_contract',
        'contracts',
        contract.id,
        'انهاء عقد ${contract.contractNo} للمستأجر ${tenant.name} مع خصم ${formatCurrency(depositDeduction)} من التأمين',
      );
    });
  }
}

class PaymentsRepository {
  PaymentsRepository(this._db);
  final AppDatabase _db;

  Stream<List<PaymentRecord>> watchAll() {
    return (_db.select(
      _db.payments,
    )..orderBy([(row) => OrderingTerm.desc(row.date)])).watch();
  }

  Future<PaymentRecord?> findPayment(int id) {
    return (_db.select(
      _db.payments,
    )..where((row) => row.id.equals(id))).getSingleOrNull();
  }

  Future<int> addPayment({
    required TenantRecord tenant,
    required double amount,
    required DateTime date,
    required String method,
    required String status,
    int? dueScheduleId,
    String? notes,
    String currency = 'YER',
    List<int>? utilityBillIds,
  }) async {
    return _db.transaction(() async {
      final receiptNo = await _nextDocumentNo(_db, 'payments', 'REC');
      final id = await _db
          .into(_db.payments)
          .insert(
            PaymentsCompanion.insert(
              tenantId: tenant.id,
              tenantName: tenant.name,
              tenantPhone: tenant.phone,
              propertyId: tenant.propertyId,
              propertyName: tenant.propertyName,
              amount: amount,
              currency: Value(currency),
              date: date,
              method: Value(method),
              status: Value(status),
              receiptNo: receiptNo,
              dueScheduleId: Value(dueScheduleId),
              notes: Value(_nullable(notes)),
            ),
          );

      if (status == 'paid') {
        var rentApplied = 0.0;
        if (dueScheduleId != null) {
          final schedule = await (_db.select(
            _db.rentSchedules,
          )..where((row) => row.id.equals(dueScheduleId))).getSingleOrNull();
          if (schedule != null) {
            final remaining = math.max<double>(
              schedule.amount - schedule.paidAmount,
              0,
            );
            rentApplied = math.min<double>(amount, remaining);
          }
        }

        if (rentApplied > 0) {
          await _db.customUpdate(
            'UPDATE tenants SET accumulated_debt = max(accumulated_debt - ?, 0), updated_at = ? WHERE id = ?',
            variables: [
              Variable<double>(rentApplied),
              Variable<DateTime>(DateTime.now()),
              Variable<int>(tenant.id),
            ],
            updates: {_db.tenants},
          );

          await _db.customUpdate(
            'UPDATE rent_schedules SET paid_amount = min(paid_amount + ?, amount), status = CASE WHEN paid_amount + ? >= amount THEN ? ELSE ? END, payment_id = ?, updated_at = ? WHERE id = ?',
            variables: [
              Variable<double>(rentApplied),
              Variable<double>(rentApplied),
              const Variable<String>('paid'),
              const Variable<String>('partial'),
              Variable<int>(id),
              Variable<DateTime>(DateTime.now()),
              Variable<int>(dueScheduleId!),
            ],
            updates: {_db.rentSchedules},
          );
        }

        if (utilityBillIds != null && utilityBillIds.isNotEmpty) {
          final placeholders = List.filled(
            utilityBillIds.length,
            '?',
          ).join(', ');
          final variables = <Variable<Object>>[
            const Variable<String>('paid'),
            Variable<int>(id),
            Variable<DateTime>(DateTime.now()),
            ...utilityBillIds.map((billId) => Variable<int>(billId)),
          ];

          await _db.customUpdate(
            'UPDATE utility_bills SET status = ?, payment_id = ?, updated_at = ? WHERE id IN ($placeholders)',
            variables: variables,
            updates: {_db.utilityBills},
          );
        }
      }

      await _audit(
        'record_payment',
        'payments',
        id,
        'تسجيل سند قبض $receiptNo للمستأجر ${tenant.name} بمبلغ ${formatCurrency(amount)}',
      );
      return id;
    });
  }

  Future<void> updateMessageStatus(int paymentId, String status) {
    return (_db.update(_db.payments)..where((row) => row.id.equals(paymentId)))
        .write(PaymentsCompanion(messageStatus: Value(status)));
  }

  Future<void> _audit(
    String action,
    String entityType,
    int entityId,
    String description,
  ) {
    return _db
        .into(_db.auditLogs)
        .insert(
          AuditLogsCompanion.insert(
            action: action,
            entityType: entityType,
            entityId: Value(entityId),
            description: description,
          ),
        );
  }
}

class UtilityBillsRepository {
  UtilityBillsRepository(this._db);
  final AppDatabase _db;

  Stream<List<UtilityBillRecord>> watchAll() {
    return (_db.select(
      _db.utilityBills,
    )..orderBy([(row) => OrderingTerm.desc(row.createdAt)])).watch();
  }

  Stream<List<UtilityBillRecord>> watchOpen() {
    return (_db.select(_db.utilityBills)
          ..where((row) => row.status.equals('open'))
          ..orderBy([(row) => OrderingTerm.asc(row.periodEnd)]))
        .watch();
  }

  Stream<List<UtilityBillRecord>> watchOpenChargeable() {
    return (_db.select(_db.utilityBills)
          ..where(
            (row) =>
                row.status.equals('open') & row.chargeToTenant.equals(true),
          )
          ..orderBy([(row) => OrderingTerm.asc(row.periodEnd)]))
        .watch();
  }

  Stream<List<UtilityBillRecord>> watchOpenByTenant(int tenantId) {
    return (_db.select(_db.utilityBills)
          ..where(
            (row) => row.tenantId.equals(tenantId) & row.status.equals('open'),
          )
          ..orderBy([(row) => OrderingTerm.asc(row.periodEnd)]))
        .watch();
  }

  Future<List<UtilityBillRecord>> openBillsForTenant(int tenantId) {
    return (_db.select(_db.utilityBills)
          ..where(
            (row) => row.tenantId.equals(tenantId) & row.status.equals('open'),
          )
          ..orderBy([(row) => OrderingTerm.asc(row.periodEnd)]))
        .get();
  }

  Future<List<UtilityBillRecord>> openChargeableBillsForTenant(int tenantId) {
    return (_db.select(_db.utilityBills)
          ..where(
            (row) =>
                row.tenantId.equals(tenantId) &
                row.status.equals('open') &
                row.chargeToTenant.equals(true),
          )
          ..orderBy([(row) => OrderingTerm.asc(row.periodEnd)]))
        .get();
  }

  Future<int> addUtilityBill({
    required TenantRecord tenant,
    required String type,
    required DateTime periodStart,
    required DateTime periodEnd,
    required double consumption,
    required double rate,
    required double amount,
    String meterOwnership = 'owner_meter',
    String? meterNo,
    double previousReading = 0,
    double currentReading = 0,
    bool? chargeToTenant,
    bool paidExternally = false,
    String? proofPath,
    String? notes,
  }) {
    final effectiveChargeToTenant =
        chargeToTenant ?? meterOwnership != 'tenant_meter';
    final effectiveStatus = paidExternally ? 'paid_external' : 'open';
    return _db
        .into(_db.utilityBills)
        .insert(
          UtilityBillsCompanion.insert(
            tenantId: Value(tenant.id),
            tenantName: Value(tenant.name),
            propertyId: tenant.propertyId,
            propertyName: tenant.propertyName,
            unitId: tenant.unitId,
            type: type,
            periodStart: periodStart,
            periodEnd: periodEnd,
            consumption: Value(consumption),
            rate: Value(rate),
            amount: Value(amount),
            meterOwnership: Value(meterOwnership),
            meterNo: Value(_nullable(meterNo)),
            previousReading: Value(previousReading),
            currentReading: Value(currentReading),
            chargeToTenant: Value(effectiveChargeToTenant),
            paidExternally: Value(paidExternally),
            proofPath: Value(_nullable(proofPath)),
            status: Value(effectiveStatus),
            notes: Value(_nullable(notes)),
          ),
        );
  }

  Future<List<int>> addSharedUtilityBills({
    required PropertyRecord property,
    required List<TenantRecord> tenants,
    required String type,
    required DateTime periodStart,
    required DateTime periodEnd,
    required double totalAmount,
    required double previousReading,
    required double currentReading,
    required double rate,
    String? meterNo,
    String? notes,
  }) async {
    final recipients = tenants
        .where((tenant) => tenant.propertyId == property.id)
        .toList();
    if (recipients.isEmpty) {
      throw StateError('لا يوجد مستأجرون مرتبطون بهذا العقار لتوزيع الفاتورة');
    }

    final consumption = math.max(currentReading - previousReading, 0);
    final splitAmount = totalAmount / recipients.length;
    final splitConsumption = recipients.isEmpty
        ? 0.0
        : consumption / recipients.length;

    return _db.transaction(() async {
      final ids = <int>[];
      for (final tenant in recipients) {
        final id = await addUtilityBill(
          tenant: tenant,
          type: type,
          periodStart: periodStart,
          periodEnd: periodEnd,
          consumption: splitConsumption,
          rate: rate,
          amount: splitAmount,
          meterOwnership: 'shared_meter',
          meterNo: meterNo,
          previousReading: previousReading,
          currentReading: currentReading,
          chargeToTenant: true,
          notes:
              '${_nullable(notes) ?? 'فاتورة عداد مشترك'} - توزيع متساوٍ على ${recipients.length} مستأجر',
        );
        ids.add(id);
      }
      return ids;
    });
  }

  Future<void> markBillsPaid(int paymentId, List<int> billIds) async {
    if (billIds.isEmpty) return;
    final placeholders = List.filled(billIds.length, '?').join(', ');
    final variables = <Variable<Object>>[
      const Variable<String>('paid'),
      Variable<int>(paymentId),
      Variable<DateTime>(DateTime.now()),
      ...billIds.map((id) => Variable<int>(id)),
    ];

    await _db.customUpdate(
      'UPDATE utility_bills SET status = ?, payment_id = ?, updated_at = ? WHERE id IN ($placeholders)',
      variables: variables,
      updates: {_db.utilityBills},
    );
  }

  Future<void> markPaidExternally(
    UtilityBillRecord bill, {
    String? proofPath,
  }) async {
    await (_db.update(
      _db.utilityBills,
    )..where((row) => row.id.equals(bill.id))).write(
      UtilityBillsCompanion(
        status: const Value('paid_external'),
        paidExternally: const Value(true),
        proofPath: Value(_nullable(proofPath) ?? bill.proofPath),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}

class ExpensesRepository {
  ExpensesRepository(this._db);
  final AppDatabase _db;

  Stream<List<ExpenseRecord>> watchAll() {
    return (_db.select(
      _db.expenses,
    )..orderBy([(row) => OrderingTerm.desc(row.date)])).watch();
  }

  Future<int> addExpense({
    required PropertyRecord? property,
    required String category,
    required double amount,
    required DateTime date,
    required String description,
    String? vendor,
  }) async {
    final id = await _db
        .into(_db.expenses)
        .insert(
          ExpensesCompanion.insert(
            propertyId: Value(property?.id),
            propertyName: Value(property?.name),
            category: Value(category),
            amount: amount,
            date: date,
            description: description,
            vendor: Value(_nullable(vendor)),
          ),
        );
    await _audit(
      'create_expense',
      'expenses',
      id,
      'تسجيل مصروف ${formatCurrency(amount)}: $description',
    );
    return id;
  }

  Future<void> _audit(
    String action,
    String entityType,
    int entityId,
    String description,
  ) {
    return _db
        .into(_db.auditLogs)
        .insert(
          AuditLogsCompanion.insert(
            action: action,
            entityType: entityType,
            entityId: Value(entityId),
            description: description,
          ),
        );
  }
}

class MaintenanceRepository {
  MaintenanceRepository(this._db);
  final AppDatabase _db;

  Stream<List<MaintenanceTicketRecord>> watchAll() {
    return (_db.select(
      _db.maintenanceTickets,
    )..orderBy([(row) => OrderingTerm.desc(row.createdAt)])).watch();
  }

  Stream<List<MaintenanceTicketRecord>> watchByTenant(int tenantId) {
    return (_db.select(_db.maintenanceTickets)
          ..where((row) => row.tenantId.equals(tenantId))
          ..orderBy([(row) => OrderingTerm.desc(row.createdAt)]))
        .watch();
  }

  Future<int> addTicket({
    required PropertyRecord property,
    required String? unitId,
    required TenantRecord? tenant,
    required String title,
    required String description,
    required String priority,
    required double cost,
    String damageResponsibility = 'tenant',
    bool chargeFromDeposit = false,
  }) async {
    final id = await _db
        .into(_db.maintenanceTickets)
        .insert(
          MaintenanceTicketsCompanion.insert(
            propertyId: property.id,
            propertyName: property.name,
            unitId: Value(_nullable(unitId)),
            tenantId: Value(tenant?.id),
            tenantName: Value(tenant?.name),
            title: title,
            description: description,
            damageResponsibility: Value(damageResponsibility),
            chargeFromDeposit: Value(chargeFromDeposit),
            priority: Value(priority),
            cost: Value(cost),
          ),
        );
    await _audit(
      'create_maintenance_ticket',
      'maintenance_tickets',
      id,
      'فتح بلاغ صيانة: $title',
    );
    return id;
  }

  Future<void> updateStatus(
    MaintenanceTicketRecord ticket,
    String status,
  ) async {
    await (_db.update(
      _db.maintenanceTickets,
    )..where((row) => row.id.equals(ticket.id))).write(
      MaintenanceTicketsCompanion(
        status: Value(status),
        updatedAt: Value(DateTime.now()),
      ),
    );
    await _audit(
      'update_maintenance_status',
      'maintenance_tickets',
      ticket.id,
      'تحديث بلاغ ${ticket.title} إلى ${ticketStatusName(status)}',
    );
  }

  Future<void> _audit(
    String action,
    String entityType,
    int entityId,
    String description,
  ) {
    return _db
        .into(_db.auditLogs)
        .insert(
          AuditLogsCompanion.insert(
            action: action,
            entityType: entityType,
            entityId: Value(entityId),
            description: description,
          ),
        );
  }
}

class MessagesRepository {
  MessagesRepository(this._db);
  final AppDatabase _db;

  Stream<List<MessageTemplateRecord>> watchTemplates() {
    return (_db.select(
      _db.messageTemplates,
    )..orderBy([(row) => OrderingTerm.asc(row.id)])).watch();
  }

  Stream<List<MessageLogRecord>> watchLogs() {
    return (_db.select(
      _db.messageLogs,
    )..orderBy([(row) => OrderingTerm.desc(row.createdAt)])).watch();
  }

  Future<MessageTemplateRecord?> templateByType(String type) {
    return (_db.select(
      _db.messageTemplates,
    )..where((row) => row.type.equals(type))).getSingleOrNull();
  }

  Future<void> updateTemplate(
    MessageTemplateRecord template,
    String body,
  ) async {
    await (_db.update(
      _db.messageTemplates,
    )..where((row) => row.id.equals(template.id))).write(
      MessageTemplatesCompanion(
        body: Value(body.trim()),
        updatedAt: Value(DateTime.now()),
      ),
    );
    await _audit(
      'update_message_template',
      'message_templates',
      template.id,
      'تعديل قالب رسالة ${template.title}',
    );
  }

  Future<int> logMessage({
    required TenantRecord? tenant,
    required String tenantName,
    required String tenantPhone,
    required String type,
    required String channel,
    required String body,
    required String status,
  }) async {
    final id = await _db
        .into(_db.messageLogs)
        .insert(
          MessageLogsCompanion.insert(
            tenantId: Value(tenant?.id),
            tenantName: tenantName,
            tenantPhone: tenantPhone,
            type: type,
            channel: channel,
            body: body,
            status: Value(status),
          ),
        );
    await _audit(
      'send_message',
      'message_logs',
      id,
      'إرسال ${messageTypeName(type)} إلى $tenantName عبر ${messageChannelName(channel)}',
    );
    return id;
  }

  Future<void> _audit(
    String action,
    String entityType,
    int entityId,
    String description,
  ) {
    return _db
        .into(_db.auditLogs)
        .insert(
          AuditLogsCompanion.insert(
            action: action,
            entityType: entityType,
            entityId: Value(entityId),
            description: description,
          ),
        );
  }
}

class AttachmentsRepository {
  AttachmentsRepository(this._db);
  final AppDatabase _db;

  Stream<List<AttachmentRecord>> watchAll() {
    return (_db.select(
      _db.attachments,
    )..orderBy([(row) => OrderingTerm.desc(row.createdAt)])).watch();
  }

  Future<int> addAttachment({
    required String entityType,
    required int entityId,
    required String label,
    required String filePath,
    required String fileType,
  }) async {
    final id = await _db
        .into(_db.attachments)
        .insert(
          AttachmentsCompanion.insert(
            entityType: entityType,
            entityId: entityId,
            label: label,
            filePath: filePath,
            fileType: Value(fileType),
          ),
        );
    await _db
        .into(_db.auditLogs)
        .insert(
          AuditLogsCompanion.insert(
            action: 'add_attachment',
            entityType: 'attachments',
            entityId: Value(id),
            description: 'إضافة مرفق $label',
          ),
        );
    return id;
  }
}

class AuditRepository {
  AuditRepository(this._db);
  final AppDatabase _db;

  Stream<List<AuditLogRecord>> watchAll() {
    return (_db.select(
      _db.auditLogs,
    )..orderBy([(row) => OrderingTerm.desc(row.createdAt)])).watch();
  }
}

class ReportsRepository {
  ReportsRepository(this._db);
  final AppDatabase _db;

  Future<Map<String, Object?>> snapshot() => _db.backupSnapshot();
}

class SettingsRepository {
  SettingsRepository(this._db);
  final AppDatabase _db;

  Future<String?> readOfficeName() async {
    final query = _db.select(_db.settings)
      ..where((row) => row.key.equals('office_name'));
    final row = await query.getSingleOrNull();
    return row?.value;
  }

  Stream<String?> watchOfficeName() {
    final query = _db.select(_db.settings)
      ..where((row) => row.key.equals('office_name'));
    return query.watchSingleOrNull().map((row) => row?.value);
  }

  Stream<String?> watchOfficePhone() {
    final query = _db.select(_db.settings)
      ..where((row) => row.key.equals('office_phone'));
    return query.watchSingleOrNull().map((row) => row?.value);
  }

  Stream<String> watchCurrency() {
    final query = _db.select(_db.settings)
      ..where((row) => row.key.equals('currency'));
    return query.watchSingleOrNull().map((row) => row?.value ?? 'YER');
  }

  Stream<String> watchThemeMode() {
    final query = _db.select(_db.settings)
      ..where((row) => row.key.equals('theme_mode'));
    return query.watchSingleOrNull().map((row) => row?.value ?? 'system');
  }

  Future<void> saveOfficeName(String name) async {
    await saveSetting(
      'office_name',
      name.trim().isEmpty ? 'مكتب مِلاك العقاري' : name.trim(),
    );
  }

  Future<void> saveCurrency(String currency) async {
    await saveSetting(
      'currency',
      currency.trim().isEmpty ? 'YER' : currency.trim(),
    );
  }

  Future<void> saveThemeMode(String themeMode) async {
    final value = switch (themeMode.trim()) {
      'light' => 'light',
      'dark' => 'dark',
      _ => 'system',
    };
    await saveSetting('theme_mode', value);
  }

  Future<void> saveSetting(String key, String value) async {
    await _db
        .into(_db.settings)
        .insertOnConflictUpdate(
          SettingsCompanion.insert(
            key: key,
            value: value,
            updatedAt: Value(DateTime.now()),
          ),
        );
  }
}

class BackupRepository {
  BackupRepository(this._db);
  final AppDatabase _db;

  Future<void> exportBackup() async {
    final snapshot = await _db.backupSnapshot();
    final directory = await getTemporaryDirectory();
    final file = File(
      '${directory.path}/milaak_backup_${DateTime.now().millisecondsSinceEpoch}.json',
    );
    await file.writeAsString(
      const JsonEncoder.withIndent('  ').convert(snapshot),
    );
    await Share.shareXFiles([
      XFile(file.path),
    ], text: 'نسخة احتياطية من تطبيق مِلاك');
  }

  Future<String?> pickBackupFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );
    return result?.files.single.path;
  }
}

String? _nullable(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) return null;
  return trimmed;
}

Future<String> _nextDocumentNo(
  AppDatabase db,
  String table,
  String prefix,
) async {
  final row = await db
      .customSelect('SELECT COUNT(*) AS count FROM $table')
      .getSingle();
  final count = (row.data['count'] as int? ?? 0) + 1;
  return '$prefix-${DateTime.now().year}-${count.toString().padLeft(4, '0')}';
}

int _frequencyStepMonths(String frequency) {
  return switch (frequency) {
    'ربع سنوي' => 3,
    'نصف سنوي' => 6,
    'سنوي' => 12,
    _ => 1,
  };
}

DateTime _addMonths(DateTime value, int months) {
  return DateTime(value.year, value.month + months, value.day);
}

String unitStatusName(String status) {
  return switch (status) {
    'leased' => 'مؤجرة',
    'maintenance' => 'صيانة',
    'reserved' => 'محجوزة',
    _ => 'شاغرة',
  };
}

String ticketStatusName(String status) {
  return switch (status) {
    'in_progress' => 'قيد المعالجة',
    'closed' => 'مغلق',
    _ => 'مفتوح',
  };
}

String expenseCategoryName(String category) {
  return switch (category) {
    'utilities' => 'خدمات',
    'management' => 'إدارة',
    'security' => 'حراسة',
    'cleaning' => 'نظافة',
    'other' => 'أخرى',
    _ => 'صيانة',
  };
}

String messageTypeName(String type) {
  return switch (type) {
    'payment_receipt' => 'تأكيد سداد',
    'rent_reminder' => 'تذكير إيجار',
    'late_payment' => 'تأخير سداد',
    'contract_expiry' => 'انتهاء عقد',
    'contract_renewal' => 'تجديد عقد',
    'utility_payment_reminder' => 'تذكير خدمة',
    'utility_payment_receipt' => 'تأكيد سداد خدمة',
    'utility_proof_request' => 'طلب إثبات دفع خدمة',
    _ => type,
  };
}

String messageChannelName(String channel) {
  return switch (channel) {
    'sms' => 'SMS',
    'share' => 'مشاركة',
    _ => 'WhatsApp',
  };
}
