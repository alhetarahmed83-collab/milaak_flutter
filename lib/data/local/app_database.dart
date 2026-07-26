import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DataClassName('PropertyRecord')
class Properties extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get address => text()();
  TextColumn get type => text().withDefault(const Constant('residential'))();
  TextColumn get ownerName => text().nullable()();
  IntColumn get units => integer().withDefault(const Constant(1))();
  IntColumn get floors => integer().withDefault(const Constant(1))();
  IntColumn get unitsPerFloor => integer().withDefault(const Constant(1))();
  IntColumn get shops => integer().withDefault(const Constant(0))();
  IntColumn get occupiedUnits => integer().withDefault(const Constant(0))();
  RealColumn get monthlyIncome => real().withDefault(const Constant(0))();
  TextColumn get electricityServiceMode =>
      text().withDefault(const Constant('owner_meter'))();
  TextColumn get waterServiceMode =>
      text().withDefault(const Constant('owner_meter'))();
  TextColumn get gasServiceMode =>
      text().withDefault(const Constant('unavailable'))();
  TextColumn get imagePath => text().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();
}

@DataClassName('TenantRecord')
class Tenants extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get phone => text()();
  TextColumn get email => text().nullable()();
  TextColumn get nationalId => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('active'))();
  RealColumn get balance => real().withDefault(const Constant(0))();
  RealColumn get accumulatedDebt => real().withDefault(const Constant(0))();
  RealColumn get securityDeposit => real().withDefault(const Constant(0))();
  TextColumn get rentalType => text().withDefault(const Constant('advance'))();
  RealColumn get waterBill => real().withDefault(const Constant(0))();
  RealColumn get electricityBill => real().withDefault(const Constant(0))();
  IntColumn get propertyId => integer().references(Properties, #id)();
  TextColumn get propertyName => text()();
  TextColumn get unitId => text()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();
}

@DataClassName('ContractRecord')
class Contracts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tenantId => integer().references(Tenants, #id)();
  IntColumn get propertyId => integer().references(Properties, #id)();
  TextColumn get contractNo => text().withDefault(const Constant(''))();
  TextColumn get landlordName => text()();
  TextColumn get tenantName => text()();
  TextColumn get propertyName => text()();
  TextColumn get unitId => text().withDefault(const Constant(''))();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  RealColumn get rentAmount => real()();
  TextColumn get currency => text().withDefault(const Constant('YER'))();
  TextColumn get paymentFrequency =>
      text().withDefault(const Constant('شهري'))();
  RealColumn get securityDepositAmount =>
      real().withDefault(const Constant(0))();
  TextColumn get status => text().withDefault(const Constant('active'))();
  TextColumn get customTerms => text().nullable()();
  TextColumn get renewalStatus => text().withDefault(const Constant('none'))();
  TextColumn get content => text()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();
}

@DataClassName('PaymentRecord')
class Payments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tenantId => integer().references(Tenants, #id)();
  TextColumn get tenantName => text()();
  TextColumn get tenantPhone => text()();
  IntColumn get propertyId => integer().references(Properties, #id)();
  TextColumn get propertyName => text()();
  RealColumn get amount => real()();
  TextColumn get currency => text().withDefault(const Constant('YER'))();
  DateTimeColumn get date => dateTime()();
  TextColumn get method =>
      text().withDefault(const Constant('bank_transfer'))();
  TextColumn get status => text().withDefault(const Constant('paid'))();
  TextColumn get receiptNo => text()();
  IntColumn get dueScheduleId => integer().nullable()();
  TextColumn get messageStatus =>
      text().withDefault(const Constant('unsent'))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
}

@DataClassName('UtilityBillRecord')
class UtilityBills extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tenantId => integer().nullable().references(Tenants, #id)();
  TextColumn get tenantName => text().nullable()();
  IntColumn get propertyId => integer().references(Properties, #id)();
  TextColumn get propertyName => text()();
  TextColumn get unitId => text()();
  TextColumn get type => text()();
  DateTimeColumn get periodStart => dateTime()();
  DateTimeColumn get periodEnd => dateTime()();
  RealColumn get consumption => real().withDefault(const Constant(0))();
  RealColumn get rate => real().withDefault(const Constant(0))();
  RealColumn get amount => real().withDefault(const Constant(0))();
  TextColumn get meterOwnership =>
      text().withDefault(const Constant('owner_meter'))();
  TextColumn get meterNo => text().nullable()();
  RealColumn get previousReading => real().withDefault(const Constant(0))();
  RealColumn get currentReading => real().withDefault(const Constant(0))();
  BoolColumn get chargeToTenant =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get paidExternally =>
      boolean().withDefault(const Constant(false))();
  TextColumn get proofPath => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('open'))();
  IntColumn get paymentId => integer().nullable().references(Payments, #id)();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();
}

@DataClassName('UnitRecord')
class Units extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get propertyId => integer().references(Properties, #id)();
  TextColumn get propertyName => text()();
  TextColumn get unitNo => text()();
  TextColumn get floor => text().nullable()();
  TextColumn get type => text().withDefault(const Constant('apartment'))();
  TextColumn get status => text().withDefault(const Constant('vacant'))();
  RealColumn get expectedRent => real().withDefault(const Constant(0))();
  TextColumn get electricityServiceMode =>
      text().withDefault(const Constant('inherit'))();
  TextColumn get electricityMeterNo => text().nullable()();
  TextColumn get waterServiceMode =>
      text().withDefault(const Constant('inherit'))();
  TextColumn get waterMeterNo => text().nullable()();
  TextColumn get gasServiceMode =>
      text().withDefault(const Constant('inherit'))();
  TextColumn get gasMeterNo => text().nullable()();
  IntColumn get tenantId => integer().nullable().references(Tenants, #id)();
  TextColumn get tenantName => text().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();
}

@DataClassName('RentScheduleRecord')
class RentSchedules extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get contractId => integer().references(Contracts, #id)();
  IntColumn get tenantId => integer().references(Tenants, #id)();
  IntColumn get propertyId => integer().references(Properties, #id)();
  TextColumn get tenantName => text()();
  TextColumn get propertyName => text()();
  TextColumn get unitId => text()();
  DateTimeColumn get dueDate => dateTime()();
  RealColumn get amount => real()();
  RealColumn get paidAmount => real().withDefault(const Constant(0))();
  TextColumn get currency => text().withDefault(const Constant('YER'))();
  TextColumn get status => text().withDefault(const Constant('due'))();
  IntColumn get paymentId => integer().nullable().references(Payments, #id)();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();
}

@DataClassName('ExpenseRecord')
class Expenses extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get propertyId =>
      integer().nullable().references(Properties, #id)();
  TextColumn get propertyName => text().nullable()();
  TextColumn get category =>
      text().withDefault(const Constant('maintenance'))();
  RealColumn get amount => real()();
  DateTimeColumn get date => dateTime()();
  TextColumn get description => text()();
  TextColumn get vendor => text().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
}

@DataClassName('AttachmentRecord')
class Attachments extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get entityType => text()();
  IntColumn get entityId => integer()();
  TextColumn get label => text()();
  TextColumn get filePath => text()();
  TextColumn get fileType => text().withDefault(const Constant('file'))();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
}

@DataClassName('MaintenanceTicketRecord')
class MaintenanceTickets extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get propertyId => integer().references(Properties, #id)();
  TextColumn get propertyName => text()();
  TextColumn get unitId => text().nullable()();
  IntColumn get tenantId => integer().nullable().references(Tenants, #id)();
  TextColumn get tenantName => text().nullable()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get damageResponsibility =>
      text().withDefault(const Constant('tenant'))();
  BoolColumn get chargeFromDeposit =>
      boolean().withDefault(const Constant(false))();
  TextColumn get status => text().withDefault(const Constant('open'))();
  TextColumn get priority => text().withDefault(const Constant('normal'))();
  RealColumn get cost => real().withDefault(const Constant(0))();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();
}

@DataClassName('MessageTemplateRecord')
class MessageTemplates extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text()();
  TextColumn get title => text()();
  TextColumn get body => text()();
  TextColumn get channelDefault =>
      text().withDefault(const Constant('whatsapp'))();
  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();
}

@DataClassName('MessageLogRecord')
class MessageLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tenantId => integer().nullable().references(Tenants, #id)();
  TextColumn get tenantName => text()();
  TextColumn get tenantPhone => text()();
  TextColumn get type => text()();
  TextColumn get channel => text()();
  TextColumn get body => text()();
  TextColumn get status => text().withDefault(const Constant('opened'))();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
}

@DataClassName('SettingRecord')
class Settings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();
  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column> get primaryKey => {key};
}

@DataClassName('AuditLogRecord')
class AuditLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get action => text()();
  TextColumn get entityType => text()();
  IntColumn get entityId => integer().nullable()();
  TextColumn get description => text()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
}

@DriftDatabase(
  tables: [
    Properties,
    Tenants,
    Contracts,
    Payments,
    UtilityBills,
    Units,
    RentSchedules,
    Expenses,
    Attachments,
    MaintenanceTickets,
    MessageTemplates,
    MessageLogs,
    Settings,
    AuditLogs,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 9;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) async {
      await migrator.createAll();
      await _seedMessageTemplates();
    },
    onUpgrade: (migrator, from, to) async {
      if (from < 2) {
        await migrator.addColumn(tenants, tenants.nationalId);
        await migrator.addColumn(tenants, tenants.address);
        await migrator.addColumn(tenants, tenants.notes);
        await migrator.addColumn(contracts, contracts.contractNo);
        await migrator.addColumn(contracts, contracts.customTerms);
        await migrator.addColumn(contracts, contracts.renewalStatus);
        await migrator.addColumn(payments, payments.dueScheduleId);
        await migrator.addColumn(payments, payments.messageStatus);
        await migrator.createTable(units);
        await migrator.createTable(rentSchedules);
        await migrator.createTable(expenses);
        await migrator.createTable(attachments);
        await migrator.createTable(maintenanceTickets);
        await migrator.createTable(messageTemplates);
        await migrator.createTable(messageLogs);
        await _seedUnitsFromProperties();
        await _seedMessageTemplates();
      }
      if (from < 3) {
        await migrator.addColumn(payments, payments.currency);
      }
      if (from < 4) {
        await migrator.addColumn(properties, properties.floors);
        await migrator.addColumn(properties, properties.unitsPerFloor);
        await migrator.addColumn(properties, properties.shops);
      }
      if (from < 5) {
        await migrator.createTable(utilityBills);
      }
      if (from < 6) {
        await migrator.addColumn(contracts, contracts.unitId);
      }
      if (from >= 2 && from < 6) {
        await migrator.addColumn(
          maintenanceTickets,
          maintenanceTickets.damageResponsibility,
        );
        await migrator.addColumn(
          maintenanceTickets,
          maintenanceTickets.chargeFromDeposit,
        );
      }
      if (from >= 5 && from < 7) {
        await migrator.addColumn(utilityBills, utilityBills.meterOwnership);
        await migrator.addColumn(utilityBills, utilityBills.meterNo);
        await migrator.addColumn(utilityBills, utilityBills.previousReading);
        await migrator.addColumn(utilityBills, utilityBills.currentReading);
        await migrator.addColumn(utilityBills, utilityBills.chargeToTenant);
        await migrator.addColumn(utilityBills, utilityBills.paidExternally);
        await migrator.addColumn(utilityBills, utilityBills.proofPath);
      }
      if (from < 7) {
        await _seedMissingMessageTemplates();
      }
      if (from < 8) {
        await migrator.addColumn(properties, properties.electricityServiceMode);
        await migrator.addColumn(properties, properties.waterServiceMode);
        await migrator.addColumn(properties, properties.gasServiceMode);
      }
      if (from >= 2 && from < 8) {
        await migrator.addColumn(units, units.electricityServiceMode);
        await migrator.addColumn(units, units.electricityMeterNo);
        await migrator.addColumn(units, units.waterServiceMode);
        await migrator.addColumn(units, units.waterMeterNo);
        await migrator.addColumn(units, units.gasServiceMode);
        await migrator.addColumn(units, units.gasMeterNo);
      }
      if (from < 9) {
        await migrator.addColumn(properties, properties.ownerName);
      }
    },
  );

  Future<void> _seedUnitsFromProperties() async {
    final existingUnits = await (selectOnly(
      units,
    )..addColumns([units.id.count()])).getSingleOrNull();
    final count = existingUnits?.read(units.id.count()) ?? 0;
    if (count > 0) return;

    final propertyRows = await select(properties).get();
    for (final property in propertyRows) {
      final floors = property.floors;
      final unitsPerFloor = property.unitsPerFloor == 0
          ? property.units
          : property.unitsPerFloor;
      final shops = property.shops;

      for (var floor = 1; floor <= floors; floor++) {
        for (var index = 1; index <= unitsPerFloor; index++) {
          await into(units).insert(
            UnitsCompanion.insert(
              propertyId: property.id,
              propertyName: property.name,
              unitNo: '$floor-$index',
              floor: Value(floor.toString()),
            ),
          );
        }
      }

      for (var s = 1; s <= shops; s++) {
        await into(units).insert(
          UnitsCompanion.insert(
            propertyId: property.id,
            propertyName: property.name,
            unitNo: 'S$s',
            floor: Value('Ground'),
            type: Value('shop'),
          ),
        );
      }
    }
  }

  Future<void> _seedMessageTemplates() async {
    await _seedMissingMessageTemplates();
  }

  Future<void> _seedMissingMessageTemplates() async {
    final defaults = [
      MessageTemplatesCompanion.insert(
        type: 'payment_receipt',
        title: 'تأكيد سداد',
        body:
            'مرحباً {tenantName}، تم استلام مبلغ {amount} عن {propertyName} - {unitLabel} {unitId}. رقم السند: {receiptNo}. شكراً لكم، {officeName}.',
      ),
      MessageTemplatesCompanion.insert(
        type: 'rent_reminder',
        title: 'تذكير إيجار',
        body:
            'مرحباً {tenantName}، نذكركم بأن موعد سداد الإيجار {dueDate} بمبلغ {amount} للعقار {propertyName} - {unitLabel} {unitId}. {officeName}.',
      ),
      MessageTemplatesCompanion.insert(
        type: 'late_payment',
        title: 'تأخير سداد',
        body:
            'مرحباً {tenantName}، يوجد مبلغ متأخر قدره {amount} للعقار {propertyName} - {unitLabel} {unitId}. نأمل السداد في أقرب وقت. {officeName}.',
      ),
      MessageTemplatesCompanion.insert(
        type: 'contract_expiry',
        title: 'انتهاء عقد قريب',
        body:
            'مرحباً {tenantName}، عقدكم في {propertyName} - {unitLabel} {unitId} ينتهي بتاريخ {dueDate}. يمكنكم التواصل معنا لترتيب التجديد. {officeName}.',
      ),
      MessageTemplatesCompanion.insert(
        type: 'contract_renewal',
        title: 'تجديد عقد',
        body:
            'مرحباً {tenantName}، يمكن الآن تجديد عقد {propertyName} - {unitLabel} {unitId}. يسعدنا خدمتكم. {officeName}.',
      ),
      MessageTemplatesCompanion.insert(
        type: 'utility_payment_reminder',
        title: 'تذكير خدمة',
        body:
            'مرحباً {tenantName}، نذكركم بسداد فاتورة {serviceType} بمبلغ {amount} للفترة {period}. {officeName}.',
      ),
      MessageTemplatesCompanion.insert(
        type: 'utility_payment_receipt',
        title: 'تأكيد سداد خدمة',
        body:
            'مرحباً {tenantName}، تم تسجيل سداد فاتورة {serviceType} بمبلغ {amount}. رقم السند: {receiptNo}. شكراً لكم، {officeName}.',
      ),
      MessageTemplatesCompanion.insert(
        type: 'utility_proof_request',
        title: 'طلب إثبات دفع خدمة',
        body:
            'مرحباً {tenantName}، نرجو إرسال إثبات سداد فاتورة {serviceType} للفترة {period}. {officeName}.',
      ),
    ];

    for (final template in defaults) {
      final exists =
          await (select(messageTemplates)
                ..where((row) => row.type.equals(template.type.value)))
              .getSingleOrNull();
      if (exists != null) continue;
      await into(messageTemplates).insert(template);
    }
  }

  Future<Map<String, Object?>> backupSnapshot() async {
    Future<List<Map<String, Object?>>> rows(String table) async {
      final result = await customSelect('SELECT * FROM $table').get();
      return result.map((row) => row.data).toList();
    }

    return {
      'schemaVersion': schemaVersion,
      'createdAt': DateTime.now().toIso8601String(),
      'properties': await rows('properties'),
      'tenants': await rows('tenants'),
      'contracts': await rows('contracts'),
      'payments': await rows('payments'),
      'utilityBills': await rows('utility_bills'),
      'units': await rows('units'),
      'rentSchedules': await rows('rent_schedules'),
      'expenses': await rows('expenses'),
      'attachments': await rows('attachments'),
      'maintenanceTickets': await rows('maintenance_tickets'),
      'messageTemplates': await rows('message_templates'),
      'messageLogs': await rows('message_logs'),
      'settings': await rows('settings'),
      'auditLogs': await rows('audit_logs'),
    };
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File(p.join(directory.path, 'milaak.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
