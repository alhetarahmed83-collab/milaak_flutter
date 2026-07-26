import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:milaak_flutter/data/local/app_database.dart';
import 'package:milaak_flutter/data/repositories/rental_repositories.dart';

void main() {
  late AppDatabase db;
  late PropertiesRepository properties;
  late TenantsRepository tenants;
  late ContractsRepository contracts;
  late PaymentsRepository payments;
  late UtilityBillsRepository utilityBills;

  setUpAll(() async {
    await initializeDateFormatting('ar_SA');
  });

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    properties = PropertiesRepository(db);
    tenants = TenantsRepository(db);
    contracts = ContractsRepository(db);
    payments = PaymentsRepository(db);
    utilityBills = UtilityBillsRepository(db);
  });

  tearDown(() async {
    await db.close();
  });

  test('property and unit service policies are stored', () async {
    final propertyId = await properties.addProperty(
      name: 'عمارة خدمات',
      address: 'شارع الخدمات',
      type: 'residential',
      ownerName: 'عبدالله',
      units: 1,
      floors: 1,
      unitsPerFloor: 1,
      electricityServiceMode: 'owner_meter',
      waterServiceMode: 'tenant_meter',
      gasServiceMode: 'unavailable',
    );
    final property = await (db.select(
      db.properties,
    )..where((row) => row.id.equals(propertyId))).getSingle();

    expect(property.electricityServiceMode, 'owner_meter');
    expect(property.ownerName, 'عبدالله');
    expect(property.waterServiceMode, 'tenant_meter');
    expect(property.gasServiceMode, 'unavailable');

    final generatedUnit =
        await (db.select(db.units)
              ..where((row) => row.propertyId.equals(propertyId))
              ..where((row) => row.unitNo.equals('1-1')))
            .getSingle();

    expect(generatedUnit.electricityServiceMode, 'inherit');
    expect(generatedUnit.waterServiceMode, 'inherit');

    final unitId = await UnitsRepository(db).addUnit(
      property: property,
      unitNo: '2-1',
      floor: '2',
      type: 'apartment',
      expectedRent: 900,
      electricityServiceMode: 'tenant_meter',
      electricityMeterNo: 'E-200',
      waterServiceMode: 'owner_meter',
      waterMeterNo: 'W-200',
    );
    final customUnit = await (db.select(
      db.units,
    )..where((row) => row.id.equals(unitId))).getSingle();

    expect(customUnit.electricityServiceMode, 'tenant_meter');
    expect(customUnit.electricityMeterNo, 'E-200');
    expect(customUnit.waterServiceMode, 'owner_meter');
    expect(customUnit.waterMeterNo, 'W-200');
    expect(customUnit.gasServiceMode, 'inherit');
  });

  test(
    'tenant starts without deposit or accumulated debt, contract sets them',
    () async {
      final propertyId = await properties.addProperty(
        name: 'بيت سكني',
        address: 'الرياض',
        type: 'residential',
        units: 1,
        floors: 1,
        unitsPerFloor: 1,
      );
      final property = await (db.select(
        db.properties,
      )..where((row) => row.id.equals(propertyId))).getSingle();

      final tenantId = await tenants.addTenant(
        name: 'علي',
        phone: '0555555555',
        email: null,
        nationalId: null,
        address: null,
        notes: null,
        property: property,
        unitId: '1-1',
      );
      final tenantBefore = await (db.select(
        db.tenants,
      )..where((row) => row.id.equals(tenantId))).getSingle();

      expect(tenantBefore.status, 'pending');
      expect(tenantBefore.accumulatedDebt, 0);
      expect(tenantBefore.securityDeposit, 0);

      final contractId = await contracts.approveContract(
        CreateContractInput(
          property: property,
          tenant: tenantBefore,
          unitId: '1-1',
          landlordName: 'مكتب مِلاك',
          startDate: DateTime(2026),
          endDate: DateTime(2027),
          rentAmount: 1200,
          securityDepositAmount: 500,
          paymentFrequency: 'شهري',
        ),
      );

      final tenantAfter = await (db.select(
        db.tenants,
      )..where((row) => row.id.equals(tenantId))).getSingle();
      final unit =
          await (db.select(db.units)
                ..where((row) => row.propertyId.equals(propertyId))
                ..where((row) => row.unitNo.equals('1-1')))
              .getSingle();
      final schedules = await (db.select(
        db.rentSchedules,
      )..where((row) => row.contractId.equals(contractId))).get();

      expect(tenantAfter.status, 'active');
      expect(tenantAfter.accumulatedDebt, 1200);
      expect(tenantAfter.securityDeposit, 500);
      expect(unit.status, 'leased');
      expect(unit.tenantId, tenantId);
      expect(schedules.length, 12);
    },
  );

  test('contract rejects tenant from another property', () async {
    final firstPropertyId = await properties.addProperty(
      name: 'عمارة أ',
      address: 'شارع 1',
      type: 'residential',
      units: 1,
      floors: 1,
      unitsPerFloor: 1,
    );
    final secondPropertyId = await properties.addProperty(
      name: 'عمارة ب',
      address: 'شارع 2',
      type: 'residential',
      units: 1,
      floors: 1,
      unitsPerFloor: 1,
    );
    final firstProperty = await (db.select(
      db.properties,
    )..where((row) => row.id.equals(firstPropertyId))).getSingle();
    final secondProperty = await (db.select(
      db.properties,
    )..where((row) => row.id.equals(secondPropertyId))).getSingle();
    final tenantId = await tenants.addTenant(
      name: 'سالم',
      phone: '0550000000',
      email: null,
      nationalId: null,
      address: null,
      notes: null,
      property: firstProperty,
      unitId: '1-1',
    );
    final tenant = await (db.select(
      db.tenants,
    )..where((row) => row.id.equals(tenantId))).getSingle();

    expect(
      () => contracts.approveContract(
        CreateContractInput(
          property: secondProperty,
          tenant: tenant,
          unitId: '1-1',
          landlordName: 'مكتب مِلاك',
          startDate: DateTime(2026),
          endDate: DateTime(2027),
          rentAmount: 1000,
          securityDepositAmount: 300,
          paymentFrequency: 'شهري',
        ),
      ),
      throwsA(isA<StateError>()),
    );
  });

  test(
    'owner meter utility payment closes bill without reducing rent debt',
    () async {
      final propertyId = await properties.addProperty(
        name: 'عمارة الخدمات',
        address: 'شارع الماء',
        type: 'residential',
        units: 1,
        floors: 1,
        unitsPerFloor: 1,
      );
      final property = await (db.select(
        db.properties,
      )..where((row) => row.id.equals(propertyId))).getSingle();
      final tenantId = await tenants.addTenant(
        name: 'ماجد',
        phone: '0551111111',
        email: null,
        nationalId: null,
        address: null,
        notes: null,
        property: property,
        unitId: '1-1',
      );
      final tenantBeforeContract = await (db.select(
        db.tenants,
      )..where((row) => row.id.equals(tenantId))).getSingle();
      final contractId = await contracts.approveContract(
        CreateContractInput(
          property: property,
          tenant: tenantBeforeContract,
          unitId: '1-1',
          landlordName: 'مكتب مِلاك',
          startDate: DateTime(2026),
          endDate: DateTime(2027),
          rentAmount: 1000,
          securityDepositAmount: 0,
          paymentFrequency: 'شهري',
        ),
      );
      expect(contractId, greaterThan(0));

      final tenant = await (db.select(
        db.tenants,
      )..where((row) => row.id.equals(tenantId))).getSingle();
      final billId = await utilityBills.addUtilityBill(
        tenant: tenant,
        type: 'electricity',
        periodStart: DateTime(2026, 6),
        periodEnd: DateTime(2026, 6, 30),
        consumption: 20,
        rate: 5,
        amount: 250,
        meterOwnership: 'owner_meter',
        chargeToTenant: true,
      );

      final paymentId = await payments.addPayment(
        tenant: tenant,
        amount: 250,
        date: DateTime(2026, 6, 30),
        method: 'cash',
        status: 'paid',
        utilityBillIds: [billId],
      );
      final tenantAfter = await (db.select(
        db.tenants,
      )..where((row) => row.id.equals(tenantId))).getSingle();
      final billAfter = await (db.select(
        db.utilityBills,
      )..where((row) => row.id.equals(billId))).getSingle();

      expect(paymentId, greaterThan(0));
      expect(tenantAfter.accumulatedDebt, 1000);
      expect(billAfter.status, 'paid');
      expect(billAfter.paymentId, paymentId);
    },
  );

  test(
    'tenant meter external payment does not become chargeable debt',
    () async {
      final propertyId = await properties.addProperty(
        name: 'بيت عداد خاص',
        address: 'شارع الكهرباء',
        type: 'residential',
        units: 1,
        floors: 1,
        unitsPerFloor: 1,
      );
      final property = await (db.select(
        db.properties,
      )..where((row) => row.id.equals(propertyId))).getSingle();
      final tenantId = await tenants.addTenant(
        name: 'سامي',
        phone: '0552222222',
        email: null,
        nationalId: null,
        address: null,
        notes: null,
        property: property,
        unitId: '1-1',
      );
      final tenant = await (db.select(
        db.tenants,
      )..where((row) => row.id.equals(tenantId))).getSingle();

      final billId = await utilityBills.addUtilityBill(
        tenant: tenant,
        type: 'water',
        periodStart: DateTime(2026, 6),
        periodEnd: DateTime(2026, 6, 30),
        consumption: 10,
        rate: 3,
        amount: 30,
        meterOwnership: 'tenant_meter',
        paidExternally: true,
        proofPath: 'proof.jpg',
      );
      final bill = await (db.select(
        db.utilityBills,
      )..where((row) => row.id.equals(billId))).getSingle();
      final chargeable = await utilityBills.openChargeableBillsForTenant(
        tenantId,
      );

      expect(bill.status, 'paid_external');
      expect(bill.chargeToTenant, isFalse);
      expect(bill.proofPath, 'proof.jpg');
      expect(chargeable, isEmpty);
    },
  );

  test(
    'shared meter distributes total amount equally by property tenants',
    () async {
      final propertyId = await properties.addProperty(
        name: 'عمارة مشتركة',
        address: 'شارع مشترك',
        type: 'residential',
        units: 2,
        floors: 1,
        unitsPerFloor: 2,
      );
      final property = await (db.select(
        db.properties,
      )..where((row) => row.id.equals(propertyId))).getSingle();
      await tenants.addTenant(
        name: 'أحمد',
        phone: '0553333333',
        email: null,
        nationalId: null,
        address: null,
        notes: null,
        property: property,
        unitId: '1-1',
      );
      await tenants.addTenant(
        name: 'خالد',
        phone: '0554444444',
        email: null,
        nationalId: null,
        address: null,
        notes: null,
        property: property,
        unitId: '1-2',
      );
      final propertyTenants = await (db.select(
        db.tenants,
      )..where((row) => row.propertyId.equals(propertyId))).get();

      final ids = await utilityBills.addSharedUtilityBills(
        property: property,
        tenants: propertyTenants,
        type: 'water',
        periodStart: DateTime(2026, 6),
        periodEnd: DateTime(2026, 6, 30),
        totalAmount: 300,
        previousReading: 100,
        currentReading: 160,
        rate: 5,
        meterNo: 'W-1',
      );
      final bills = await (db.select(
        db.utilityBills,
      )..where((row) => row.propertyId.equals(propertyId))).get();

      expect(ids.length, 2);
      expect(bills.length, 2);
      for (final bill in bills) {
        expect(bill.meterOwnership, 'shared_meter');
        expect(bill.amount, 150);
        expect(bill.consumption, 30);
        expect(bill.chargeToTenant, isTrue);
        expect(bill.status, 'open');
      }
    },
  );
}
