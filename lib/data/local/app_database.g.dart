// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PropertiesTable extends Properties
    with TableInfo<$PropertiesTable, PropertyRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PropertiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('residential'),
  );
  static const VerificationMeta _ownerNameMeta = const VerificationMeta(
    'ownerName',
  );
  @override
  late final GeneratedColumn<String> ownerName = GeneratedColumn<String>(
    'owner_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitsMeta = const VerificationMeta('units');
  @override
  late final GeneratedColumn<int> units = GeneratedColumn<int>(
    'units',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _floorsMeta = const VerificationMeta('floors');
  @override
  late final GeneratedColumn<int> floors = GeneratedColumn<int>(
    'floors',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _unitsPerFloorMeta = const VerificationMeta(
    'unitsPerFloor',
  );
  @override
  late final GeneratedColumn<int> unitsPerFloor = GeneratedColumn<int>(
    'units_per_floor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _shopsMeta = const VerificationMeta('shops');
  @override
  late final GeneratedColumn<int> shops = GeneratedColumn<int>(
    'shops',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _occupiedUnitsMeta = const VerificationMeta(
    'occupiedUnits',
  );
  @override
  late final GeneratedColumn<int> occupiedUnits = GeneratedColumn<int>(
    'occupied_units',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _monthlyIncomeMeta = const VerificationMeta(
    'monthlyIncome',
  );
  @override
  late final GeneratedColumn<double> monthlyIncome = GeneratedColumn<double>(
    'monthly_income',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _electricityServiceModeMeta =
      const VerificationMeta('electricityServiceMode');
  @override
  late final GeneratedColumn<String> electricityServiceMode =
      GeneratedColumn<String>(
        'electricity_service_mode',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('owner_meter'),
      );
  static const VerificationMeta _waterServiceModeMeta = const VerificationMeta(
    'waterServiceMode',
  );
  @override
  late final GeneratedColumn<String> waterServiceMode = GeneratedColumn<String>(
    'water_service_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('owner_meter'),
  );
  static const VerificationMeta _gasServiceModeMeta = const VerificationMeta(
    'gasServiceMode',
  );
  @override
  late final GeneratedColumn<String> gasServiceMode = GeneratedColumn<String>(
    'gas_service_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('unavailable'),
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    address,
    type,
    ownerName,
    units,
    floors,
    unitsPerFloor,
    shops,
    occupiedUnits,
    monthlyIncome,
    electricityServiceMode,
    waterServiceMode,
    gasServiceMode,
    imagePath,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'properties';
  @override
  VerificationContext validateIntegrity(
    Insertable<PropertyRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('owner_name')) {
      context.handle(
        _ownerNameMeta,
        ownerName.isAcceptableOrUnknown(data['owner_name']!, _ownerNameMeta),
      );
    }
    if (data.containsKey('units')) {
      context.handle(
        _unitsMeta,
        units.isAcceptableOrUnknown(data['units']!, _unitsMeta),
      );
    }
    if (data.containsKey('floors')) {
      context.handle(
        _floorsMeta,
        floors.isAcceptableOrUnknown(data['floors']!, _floorsMeta),
      );
    }
    if (data.containsKey('units_per_floor')) {
      context.handle(
        _unitsPerFloorMeta,
        unitsPerFloor.isAcceptableOrUnknown(
          data['units_per_floor']!,
          _unitsPerFloorMeta,
        ),
      );
    }
    if (data.containsKey('shops')) {
      context.handle(
        _shopsMeta,
        shops.isAcceptableOrUnknown(data['shops']!, _shopsMeta),
      );
    }
    if (data.containsKey('occupied_units')) {
      context.handle(
        _occupiedUnitsMeta,
        occupiedUnits.isAcceptableOrUnknown(
          data['occupied_units']!,
          _occupiedUnitsMeta,
        ),
      );
    }
    if (data.containsKey('monthly_income')) {
      context.handle(
        _monthlyIncomeMeta,
        monthlyIncome.isAcceptableOrUnknown(
          data['monthly_income']!,
          _monthlyIncomeMeta,
        ),
      );
    }
    if (data.containsKey('electricity_service_mode')) {
      context.handle(
        _electricityServiceModeMeta,
        electricityServiceMode.isAcceptableOrUnknown(
          data['electricity_service_mode']!,
          _electricityServiceModeMeta,
        ),
      );
    }
    if (data.containsKey('water_service_mode')) {
      context.handle(
        _waterServiceModeMeta,
        waterServiceMode.isAcceptableOrUnknown(
          data['water_service_mode']!,
          _waterServiceModeMeta,
        ),
      );
    }
    if (data.containsKey('gas_service_mode')) {
      context.handle(
        _gasServiceModeMeta,
        gasServiceMode.isAcceptableOrUnknown(
          data['gas_service_mode']!,
          _gasServiceModeMeta,
        ),
      );
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PropertyRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PropertyRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      ownerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_name'],
      ),
      units: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}units'],
      )!,
      floors: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}floors'],
      )!,
      unitsPerFloor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}units_per_floor'],
      )!,
      shops: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shops'],
      )!,
      occupiedUnits: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}occupied_units'],
      )!,
      monthlyIncome: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}monthly_income'],
      )!,
      electricityServiceMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}electricity_service_mode'],
      )!,
      waterServiceMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}water_service_mode'],
      )!,
      gasServiceMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gas_service_mode'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $PropertiesTable createAlias(String alias) {
    return $PropertiesTable(attachedDatabase, alias);
  }
}

class PropertyRecord extends DataClass implements Insertable<PropertyRecord> {
  final int id;
  final String name;
  final String address;
  final String type;
  final String? ownerName;
  final int units;
  final int floors;
  final int unitsPerFloor;
  final int shops;
  final int occupiedUnits;
  final double monthlyIncome;
  final String electricityServiceMode;
  final String waterServiceMode;
  final String gasServiceMode;
  final String? imagePath;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PropertyRecord({
    required this.id,
    required this.name,
    required this.address,
    required this.type,
    this.ownerName,
    required this.units,
    required this.floors,
    required this.unitsPerFloor,
    required this.shops,
    required this.occupiedUnits,
    required this.monthlyIncome,
    required this.electricityServiceMode,
    required this.waterServiceMode,
    required this.gasServiceMode,
    this.imagePath,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['address'] = Variable<String>(address);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || ownerName != null) {
      map['owner_name'] = Variable<String>(ownerName);
    }
    map['units'] = Variable<int>(units);
    map['floors'] = Variable<int>(floors);
    map['units_per_floor'] = Variable<int>(unitsPerFloor);
    map['shops'] = Variable<int>(shops);
    map['occupied_units'] = Variable<int>(occupiedUnits);
    map['monthly_income'] = Variable<double>(monthlyIncome);
    map['electricity_service_mode'] = Variable<String>(electricityServiceMode);
    map['water_service_mode'] = Variable<String>(waterServiceMode);
    map['gas_service_mode'] = Variable<String>(gasServiceMode);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PropertiesCompanion toCompanion(bool nullToAbsent) {
    return PropertiesCompanion(
      id: Value(id),
      name: Value(name),
      address: Value(address),
      type: Value(type),
      ownerName: ownerName == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerName),
      units: Value(units),
      floors: Value(floors),
      unitsPerFloor: Value(unitsPerFloor),
      shops: Value(shops),
      occupiedUnits: Value(occupiedUnits),
      monthlyIncome: Value(monthlyIncome),
      electricityServiceMode: Value(electricityServiceMode),
      waterServiceMode: Value(waterServiceMode),
      gasServiceMode: Value(gasServiceMode),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PropertyRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PropertyRecord(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String>(json['address']),
      type: serializer.fromJson<String>(json['type']),
      ownerName: serializer.fromJson<String?>(json['ownerName']),
      units: serializer.fromJson<int>(json['units']),
      floors: serializer.fromJson<int>(json['floors']),
      unitsPerFloor: serializer.fromJson<int>(json['unitsPerFloor']),
      shops: serializer.fromJson<int>(json['shops']),
      occupiedUnits: serializer.fromJson<int>(json['occupiedUnits']),
      monthlyIncome: serializer.fromJson<double>(json['monthlyIncome']),
      electricityServiceMode: serializer.fromJson<String>(
        json['electricityServiceMode'],
      ),
      waterServiceMode: serializer.fromJson<String>(json['waterServiceMode']),
      gasServiceMode: serializer.fromJson<String>(json['gasServiceMode']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String>(address),
      'type': serializer.toJson<String>(type),
      'ownerName': serializer.toJson<String?>(ownerName),
      'units': serializer.toJson<int>(units),
      'floors': serializer.toJson<int>(floors),
      'unitsPerFloor': serializer.toJson<int>(unitsPerFloor),
      'shops': serializer.toJson<int>(shops),
      'occupiedUnits': serializer.toJson<int>(occupiedUnits),
      'monthlyIncome': serializer.toJson<double>(monthlyIncome),
      'electricityServiceMode': serializer.toJson<String>(
        electricityServiceMode,
      ),
      'waterServiceMode': serializer.toJson<String>(waterServiceMode),
      'gasServiceMode': serializer.toJson<String>(gasServiceMode),
      'imagePath': serializer.toJson<String?>(imagePath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PropertyRecord copyWith({
    int? id,
    String? name,
    String? address,
    String? type,
    Value<String?> ownerName = const Value.absent(),
    int? units,
    int? floors,
    int? unitsPerFloor,
    int? shops,
    int? occupiedUnits,
    double? monthlyIncome,
    String? electricityServiceMode,
    String? waterServiceMode,
    String? gasServiceMode,
    Value<String?> imagePath = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => PropertyRecord(
    id: id ?? this.id,
    name: name ?? this.name,
    address: address ?? this.address,
    type: type ?? this.type,
    ownerName: ownerName.present ? ownerName.value : this.ownerName,
    units: units ?? this.units,
    floors: floors ?? this.floors,
    unitsPerFloor: unitsPerFloor ?? this.unitsPerFloor,
    shops: shops ?? this.shops,
    occupiedUnits: occupiedUnits ?? this.occupiedUnits,
    monthlyIncome: monthlyIncome ?? this.monthlyIncome,
    electricityServiceMode:
        electricityServiceMode ?? this.electricityServiceMode,
    waterServiceMode: waterServiceMode ?? this.waterServiceMode,
    gasServiceMode: gasServiceMode ?? this.gasServiceMode,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PropertyRecord copyWithCompanion(PropertiesCompanion data) {
    return PropertyRecord(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
      type: data.type.present ? data.type.value : this.type,
      ownerName: data.ownerName.present ? data.ownerName.value : this.ownerName,
      units: data.units.present ? data.units.value : this.units,
      floors: data.floors.present ? data.floors.value : this.floors,
      unitsPerFloor: data.unitsPerFloor.present
          ? data.unitsPerFloor.value
          : this.unitsPerFloor,
      shops: data.shops.present ? data.shops.value : this.shops,
      occupiedUnits: data.occupiedUnits.present
          ? data.occupiedUnits.value
          : this.occupiedUnits,
      monthlyIncome: data.monthlyIncome.present
          ? data.monthlyIncome.value
          : this.monthlyIncome,
      electricityServiceMode: data.electricityServiceMode.present
          ? data.electricityServiceMode.value
          : this.electricityServiceMode,
      waterServiceMode: data.waterServiceMode.present
          ? data.waterServiceMode.value
          : this.waterServiceMode,
      gasServiceMode: data.gasServiceMode.present
          ? data.gasServiceMode.value
          : this.gasServiceMode,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PropertyRecord(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('type: $type, ')
          ..write('ownerName: $ownerName, ')
          ..write('units: $units, ')
          ..write('floors: $floors, ')
          ..write('unitsPerFloor: $unitsPerFloor, ')
          ..write('shops: $shops, ')
          ..write('occupiedUnits: $occupiedUnits, ')
          ..write('monthlyIncome: $monthlyIncome, ')
          ..write('electricityServiceMode: $electricityServiceMode, ')
          ..write('waterServiceMode: $waterServiceMode, ')
          ..write('gasServiceMode: $gasServiceMode, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    address,
    type,
    ownerName,
    units,
    floors,
    unitsPerFloor,
    shops,
    occupiedUnits,
    monthlyIncome,
    electricityServiceMode,
    waterServiceMode,
    gasServiceMode,
    imagePath,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PropertyRecord &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address &&
          other.type == this.type &&
          other.ownerName == this.ownerName &&
          other.units == this.units &&
          other.floors == this.floors &&
          other.unitsPerFloor == this.unitsPerFloor &&
          other.shops == this.shops &&
          other.occupiedUnits == this.occupiedUnits &&
          other.monthlyIncome == this.monthlyIncome &&
          other.electricityServiceMode == this.electricityServiceMode &&
          other.waterServiceMode == this.waterServiceMode &&
          other.gasServiceMode == this.gasServiceMode &&
          other.imagePath == this.imagePath &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PropertiesCompanion extends UpdateCompanion<PropertyRecord> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> address;
  final Value<String> type;
  final Value<String?> ownerName;
  final Value<int> units;
  final Value<int> floors;
  final Value<int> unitsPerFloor;
  final Value<int> shops;
  final Value<int> occupiedUnits;
  final Value<double> monthlyIncome;
  final Value<String> electricityServiceMode;
  final Value<String> waterServiceMode;
  final Value<String> gasServiceMode;
  final Value<String?> imagePath;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const PropertiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.type = const Value.absent(),
    this.ownerName = const Value.absent(),
    this.units = const Value.absent(),
    this.floors = const Value.absent(),
    this.unitsPerFloor = const Value.absent(),
    this.shops = const Value.absent(),
    this.occupiedUnits = const Value.absent(),
    this.monthlyIncome = const Value.absent(),
    this.electricityServiceMode = const Value.absent(),
    this.waterServiceMode = const Value.absent(),
    this.gasServiceMode = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  PropertiesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String address,
    this.type = const Value.absent(),
    this.ownerName = const Value.absent(),
    this.units = const Value.absent(),
    this.floors = const Value.absent(),
    this.unitsPerFloor = const Value.absent(),
    this.shops = const Value.absent(),
    this.occupiedUnits = const Value.absent(),
    this.monthlyIncome = const Value.absent(),
    this.electricityServiceMode = const Value.absent(),
    this.waterServiceMode = const Value.absent(),
    this.gasServiceMode = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       address = Value(address);
  static Insertable<PropertyRecord> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<String>? type,
    Expression<String>? ownerName,
    Expression<int>? units,
    Expression<int>? floors,
    Expression<int>? unitsPerFloor,
    Expression<int>? shops,
    Expression<int>? occupiedUnits,
    Expression<double>? monthlyIncome,
    Expression<String>? electricityServiceMode,
    Expression<String>? waterServiceMode,
    Expression<String>? gasServiceMode,
    Expression<String>? imagePath,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (type != null) 'type': type,
      if (ownerName != null) 'owner_name': ownerName,
      if (units != null) 'units': units,
      if (floors != null) 'floors': floors,
      if (unitsPerFloor != null) 'units_per_floor': unitsPerFloor,
      if (shops != null) 'shops': shops,
      if (occupiedUnits != null) 'occupied_units': occupiedUnits,
      if (monthlyIncome != null) 'monthly_income': monthlyIncome,
      if (electricityServiceMode != null)
        'electricity_service_mode': electricityServiceMode,
      if (waterServiceMode != null) 'water_service_mode': waterServiceMode,
      if (gasServiceMode != null) 'gas_service_mode': gasServiceMode,
      if (imagePath != null) 'image_path': imagePath,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  PropertiesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? address,
    Value<String>? type,
    Value<String?>? ownerName,
    Value<int>? units,
    Value<int>? floors,
    Value<int>? unitsPerFloor,
    Value<int>? shops,
    Value<int>? occupiedUnits,
    Value<double>? monthlyIncome,
    Value<String>? electricityServiceMode,
    Value<String>? waterServiceMode,
    Value<String>? gasServiceMode,
    Value<String?>? imagePath,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return PropertiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      type: type ?? this.type,
      ownerName: ownerName ?? this.ownerName,
      units: units ?? this.units,
      floors: floors ?? this.floors,
      unitsPerFloor: unitsPerFloor ?? this.unitsPerFloor,
      shops: shops ?? this.shops,
      occupiedUnits: occupiedUnits ?? this.occupiedUnits,
      monthlyIncome: monthlyIncome ?? this.monthlyIncome,
      electricityServiceMode:
          electricityServiceMode ?? this.electricityServiceMode,
      waterServiceMode: waterServiceMode ?? this.waterServiceMode,
      gasServiceMode: gasServiceMode ?? this.gasServiceMode,
      imagePath: imagePath ?? this.imagePath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (ownerName.present) {
      map['owner_name'] = Variable<String>(ownerName.value);
    }
    if (units.present) {
      map['units'] = Variable<int>(units.value);
    }
    if (floors.present) {
      map['floors'] = Variable<int>(floors.value);
    }
    if (unitsPerFloor.present) {
      map['units_per_floor'] = Variable<int>(unitsPerFloor.value);
    }
    if (shops.present) {
      map['shops'] = Variable<int>(shops.value);
    }
    if (occupiedUnits.present) {
      map['occupied_units'] = Variable<int>(occupiedUnits.value);
    }
    if (monthlyIncome.present) {
      map['monthly_income'] = Variable<double>(monthlyIncome.value);
    }
    if (electricityServiceMode.present) {
      map['electricity_service_mode'] = Variable<String>(
        electricityServiceMode.value,
      );
    }
    if (waterServiceMode.present) {
      map['water_service_mode'] = Variable<String>(waterServiceMode.value);
    }
    if (gasServiceMode.present) {
      map['gas_service_mode'] = Variable<String>(gasServiceMode.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PropertiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('type: $type, ')
          ..write('ownerName: $ownerName, ')
          ..write('units: $units, ')
          ..write('floors: $floors, ')
          ..write('unitsPerFloor: $unitsPerFloor, ')
          ..write('shops: $shops, ')
          ..write('occupiedUnits: $occupiedUnits, ')
          ..write('monthlyIncome: $monthlyIncome, ')
          ..write('electricityServiceMode: $electricityServiceMode, ')
          ..write('waterServiceMode: $waterServiceMode, ')
          ..write('gasServiceMode: $gasServiceMode, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TenantsTable extends Tenants
    with TableInfo<$TenantsTable, TenantRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TenantsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nationalIdMeta = const VerificationMeta(
    'nationalId',
  );
  @override
  late final GeneratedColumn<String> nationalId = GeneratedColumn<String>(
    'national_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  static const VerificationMeta _balanceMeta = const VerificationMeta(
    'balance',
  );
  @override
  late final GeneratedColumn<double> balance = GeneratedColumn<double>(
    'balance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _accumulatedDebtMeta = const VerificationMeta(
    'accumulatedDebt',
  );
  @override
  late final GeneratedColumn<double> accumulatedDebt = GeneratedColumn<double>(
    'accumulated_debt',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _securityDepositMeta = const VerificationMeta(
    'securityDeposit',
  );
  @override
  late final GeneratedColumn<double> securityDeposit = GeneratedColumn<double>(
    'security_deposit',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _rentalTypeMeta = const VerificationMeta(
    'rentalType',
  );
  @override
  late final GeneratedColumn<String> rentalType = GeneratedColumn<String>(
    'rental_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('advance'),
  );
  static const VerificationMeta _waterBillMeta = const VerificationMeta(
    'waterBill',
  );
  @override
  late final GeneratedColumn<double> waterBill = GeneratedColumn<double>(
    'water_bill',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _electricityBillMeta = const VerificationMeta(
    'electricityBill',
  );
  @override
  late final GeneratedColumn<double> electricityBill = GeneratedColumn<double>(
    'electricity_bill',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _propertyIdMeta = const VerificationMeta(
    'propertyId',
  );
  @override
  late final GeneratedColumn<int> propertyId = GeneratedColumn<int>(
    'property_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES properties (id)',
    ),
  );
  static const VerificationMeta _propertyNameMeta = const VerificationMeta(
    'propertyName',
  );
  @override
  late final GeneratedColumn<String> propertyName = GeneratedColumn<String>(
    'property_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<String> unitId = GeneratedColumn<String>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    phone,
    email,
    nationalId,
    address,
    notes,
    status,
    balance,
    accumulatedDebt,
    securityDeposit,
    rentalType,
    waterBill,
    electricityBill,
    propertyId,
    propertyName,
    unitId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tenants';
  @override
  VerificationContext validateIntegrity(
    Insertable<TenantRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('national_id')) {
      context.handle(
        _nationalIdMeta,
        nationalId.isAcceptableOrUnknown(data['national_id']!, _nationalIdMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('balance')) {
      context.handle(
        _balanceMeta,
        balance.isAcceptableOrUnknown(data['balance']!, _balanceMeta),
      );
    }
    if (data.containsKey('accumulated_debt')) {
      context.handle(
        _accumulatedDebtMeta,
        accumulatedDebt.isAcceptableOrUnknown(
          data['accumulated_debt']!,
          _accumulatedDebtMeta,
        ),
      );
    }
    if (data.containsKey('security_deposit')) {
      context.handle(
        _securityDepositMeta,
        securityDeposit.isAcceptableOrUnknown(
          data['security_deposit']!,
          _securityDepositMeta,
        ),
      );
    }
    if (data.containsKey('rental_type')) {
      context.handle(
        _rentalTypeMeta,
        rentalType.isAcceptableOrUnknown(data['rental_type']!, _rentalTypeMeta),
      );
    }
    if (data.containsKey('water_bill')) {
      context.handle(
        _waterBillMeta,
        waterBill.isAcceptableOrUnknown(data['water_bill']!, _waterBillMeta),
      );
    }
    if (data.containsKey('electricity_bill')) {
      context.handle(
        _electricityBillMeta,
        electricityBill.isAcceptableOrUnknown(
          data['electricity_bill']!,
          _electricityBillMeta,
        ),
      );
    }
    if (data.containsKey('property_id')) {
      context.handle(
        _propertyIdMeta,
        propertyId.isAcceptableOrUnknown(data['property_id']!, _propertyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_propertyIdMeta);
    }
    if (data.containsKey('property_name')) {
      context.handle(
        _propertyNameMeta,
        propertyName.isAcceptableOrUnknown(
          data['property_name']!,
          _propertyNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_propertyNameMeta);
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_unitIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TenantRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TenantRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      nationalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}national_id'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      balance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}balance'],
      )!,
      accumulatedDebt: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}accumulated_debt'],
      )!,
      securityDeposit: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}security_deposit'],
      )!,
      rentalType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rental_type'],
      )!,
      waterBill: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}water_bill'],
      )!,
      electricityBill: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}electricity_bill'],
      )!,
      propertyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}property_id'],
      )!,
      propertyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}property_name'],
      )!,
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $TenantsTable createAlias(String alias) {
    return $TenantsTable(attachedDatabase, alias);
  }
}

class TenantRecord extends DataClass implements Insertable<TenantRecord> {
  final int id;
  final String name;
  final String phone;
  final String? email;
  final String? nationalId;
  final String? address;
  final String? notes;
  final String status;
  final double balance;
  final double accumulatedDebt;
  final double securityDeposit;
  final String rentalType;
  final double waterBill;
  final double electricityBill;
  final int propertyId;
  final String propertyName;
  final String unitId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const TenantRecord({
    required this.id,
    required this.name,
    required this.phone,
    this.email,
    this.nationalId,
    this.address,
    this.notes,
    required this.status,
    required this.balance,
    required this.accumulatedDebt,
    required this.securityDeposit,
    required this.rentalType,
    required this.waterBill,
    required this.electricityBill,
    required this.propertyId,
    required this.propertyName,
    required this.unitId,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['phone'] = Variable<String>(phone);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || nationalId != null) {
      map['national_id'] = Variable<String>(nationalId);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['status'] = Variable<String>(status);
    map['balance'] = Variable<double>(balance);
    map['accumulated_debt'] = Variable<double>(accumulatedDebt);
    map['security_deposit'] = Variable<double>(securityDeposit);
    map['rental_type'] = Variable<String>(rentalType);
    map['water_bill'] = Variable<double>(waterBill);
    map['electricity_bill'] = Variable<double>(electricityBill);
    map['property_id'] = Variable<int>(propertyId);
    map['property_name'] = Variable<String>(propertyName);
    map['unit_id'] = Variable<String>(unitId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TenantsCompanion toCompanion(bool nullToAbsent) {
    return TenantsCompanion(
      id: Value(id),
      name: Value(name),
      phone: Value(phone),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      nationalId: nationalId == null && nullToAbsent
          ? const Value.absent()
          : Value(nationalId),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      status: Value(status),
      balance: Value(balance),
      accumulatedDebt: Value(accumulatedDebt),
      securityDeposit: Value(securityDeposit),
      rentalType: Value(rentalType),
      waterBill: Value(waterBill),
      electricityBill: Value(electricityBill),
      propertyId: Value(propertyId),
      propertyName: Value(propertyName),
      unitId: Value(unitId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TenantRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TenantRecord(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      nationalId: serializer.fromJson<String?>(json['nationalId']),
      address: serializer.fromJson<String?>(json['address']),
      notes: serializer.fromJson<String?>(json['notes']),
      status: serializer.fromJson<String>(json['status']),
      balance: serializer.fromJson<double>(json['balance']),
      accumulatedDebt: serializer.fromJson<double>(json['accumulatedDebt']),
      securityDeposit: serializer.fromJson<double>(json['securityDeposit']),
      rentalType: serializer.fromJson<String>(json['rentalType']),
      waterBill: serializer.fromJson<double>(json['waterBill']),
      electricityBill: serializer.fromJson<double>(json['electricityBill']),
      propertyId: serializer.fromJson<int>(json['propertyId']),
      propertyName: serializer.fromJson<String>(json['propertyName']),
      unitId: serializer.fromJson<String>(json['unitId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String>(phone),
      'email': serializer.toJson<String?>(email),
      'nationalId': serializer.toJson<String?>(nationalId),
      'address': serializer.toJson<String?>(address),
      'notes': serializer.toJson<String?>(notes),
      'status': serializer.toJson<String>(status),
      'balance': serializer.toJson<double>(balance),
      'accumulatedDebt': serializer.toJson<double>(accumulatedDebt),
      'securityDeposit': serializer.toJson<double>(securityDeposit),
      'rentalType': serializer.toJson<String>(rentalType),
      'waterBill': serializer.toJson<double>(waterBill),
      'electricityBill': serializer.toJson<double>(electricityBill),
      'propertyId': serializer.toJson<int>(propertyId),
      'propertyName': serializer.toJson<String>(propertyName),
      'unitId': serializer.toJson<String>(unitId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TenantRecord copyWith({
    int? id,
    String? name,
    String? phone,
    Value<String?> email = const Value.absent(),
    Value<String?> nationalId = const Value.absent(),
    Value<String?> address = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    String? status,
    double? balance,
    double? accumulatedDebt,
    double? securityDeposit,
    String? rentalType,
    double? waterBill,
    double? electricityBill,
    int? propertyId,
    String? propertyName,
    String? unitId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => TenantRecord(
    id: id ?? this.id,
    name: name ?? this.name,
    phone: phone ?? this.phone,
    email: email.present ? email.value : this.email,
    nationalId: nationalId.present ? nationalId.value : this.nationalId,
    address: address.present ? address.value : this.address,
    notes: notes.present ? notes.value : this.notes,
    status: status ?? this.status,
    balance: balance ?? this.balance,
    accumulatedDebt: accumulatedDebt ?? this.accumulatedDebt,
    securityDeposit: securityDeposit ?? this.securityDeposit,
    rentalType: rentalType ?? this.rentalType,
    waterBill: waterBill ?? this.waterBill,
    electricityBill: electricityBill ?? this.electricityBill,
    propertyId: propertyId ?? this.propertyId,
    propertyName: propertyName ?? this.propertyName,
    unitId: unitId ?? this.unitId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  TenantRecord copyWithCompanion(TenantsCompanion data) {
    return TenantRecord(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      nationalId: data.nationalId.present
          ? data.nationalId.value
          : this.nationalId,
      address: data.address.present ? data.address.value : this.address,
      notes: data.notes.present ? data.notes.value : this.notes,
      status: data.status.present ? data.status.value : this.status,
      balance: data.balance.present ? data.balance.value : this.balance,
      accumulatedDebt: data.accumulatedDebt.present
          ? data.accumulatedDebt.value
          : this.accumulatedDebt,
      securityDeposit: data.securityDeposit.present
          ? data.securityDeposit.value
          : this.securityDeposit,
      rentalType: data.rentalType.present
          ? data.rentalType.value
          : this.rentalType,
      waterBill: data.waterBill.present ? data.waterBill.value : this.waterBill,
      electricityBill: data.electricityBill.present
          ? data.electricityBill.value
          : this.electricityBill,
      propertyId: data.propertyId.present
          ? data.propertyId.value
          : this.propertyId,
      propertyName: data.propertyName.present
          ? data.propertyName.value
          : this.propertyName,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TenantRecord(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('nationalId: $nationalId, ')
          ..write('address: $address, ')
          ..write('notes: $notes, ')
          ..write('status: $status, ')
          ..write('balance: $balance, ')
          ..write('accumulatedDebt: $accumulatedDebt, ')
          ..write('securityDeposit: $securityDeposit, ')
          ..write('rentalType: $rentalType, ')
          ..write('waterBill: $waterBill, ')
          ..write('electricityBill: $electricityBill, ')
          ..write('propertyId: $propertyId, ')
          ..write('propertyName: $propertyName, ')
          ..write('unitId: $unitId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    phone,
    email,
    nationalId,
    address,
    notes,
    status,
    balance,
    accumulatedDebt,
    securityDeposit,
    rentalType,
    waterBill,
    electricityBill,
    propertyId,
    propertyName,
    unitId,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TenantRecord &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.nationalId == this.nationalId &&
          other.address == this.address &&
          other.notes == this.notes &&
          other.status == this.status &&
          other.balance == this.balance &&
          other.accumulatedDebt == this.accumulatedDebt &&
          other.securityDeposit == this.securityDeposit &&
          other.rentalType == this.rentalType &&
          other.waterBill == this.waterBill &&
          other.electricityBill == this.electricityBill &&
          other.propertyId == this.propertyId &&
          other.propertyName == this.propertyName &&
          other.unitId == this.unitId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TenantsCompanion extends UpdateCompanion<TenantRecord> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> phone;
  final Value<String?> email;
  final Value<String?> nationalId;
  final Value<String?> address;
  final Value<String?> notes;
  final Value<String> status;
  final Value<double> balance;
  final Value<double> accumulatedDebt;
  final Value<double> securityDeposit;
  final Value<String> rentalType;
  final Value<double> waterBill;
  final Value<double> electricityBill;
  final Value<int> propertyId;
  final Value<String> propertyName;
  final Value<String> unitId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const TenantsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.nationalId = const Value.absent(),
    this.address = const Value.absent(),
    this.notes = const Value.absent(),
    this.status = const Value.absent(),
    this.balance = const Value.absent(),
    this.accumulatedDebt = const Value.absent(),
    this.securityDeposit = const Value.absent(),
    this.rentalType = const Value.absent(),
    this.waterBill = const Value.absent(),
    this.electricityBill = const Value.absent(),
    this.propertyId = const Value.absent(),
    this.propertyName = const Value.absent(),
    this.unitId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TenantsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String phone,
    this.email = const Value.absent(),
    this.nationalId = const Value.absent(),
    this.address = const Value.absent(),
    this.notes = const Value.absent(),
    this.status = const Value.absent(),
    this.balance = const Value.absent(),
    this.accumulatedDebt = const Value.absent(),
    this.securityDeposit = const Value.absent(),
    this.rentalType = const Value.absent(),
    this.waterBill = const Value.absent(),
    this.electricityBill = const Value.absent(),
    required int propertyId,
    required String propertyName,
    required String unitId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       phone = Value(phone),
       propertyId = Value(propertyId),
       propertyName = Value(propertyName),
       unitId = Value(unitId);
  static Insertable<TenantRecord> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? nationalId,
    Expression<String>? address,
    Expression<String>? notes,
    Expression<String>? status,
    Expression<double>? balance,
    Expression<double>? accumulatedDebt,
    Expression<double>? securityDeposit,
    Expression<String>? rentalType,
    Expression<double>? waterBill,
    Expression<double>? electricityBill,
    Expression<int>? propertyId,
    Expression<String>? propertyName,
    Expression<String>? unitId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (nationalId != null) 'national_id': nationalId,
      if (address != null) 'address': address,
      if (notes != null) 'notes': notes,
      if (status != null) 'status': status,
      if (balance != null) 'balance': balance,
      if (accumulatedDebt != null) 'accumulated_debt': accumulatedDebt,
      if (securityDeposit != null) 'security_deposit': securityDeposit,
      if (rentalType != null) 'rental_type': rentalType,
      if (waterBill != null) 'water_bill': waterBill,
      if (electricityBill != null) 'electricity_bill': electricityBill,
      if (propertyId != null) 'property_id': propertyId,
      if (propertyName != null) 'property_name': propertyName,
      if (unitId != null) 'unit_id': unitId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TenantsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? phone,
    Value<String?>? email,
    Value<String?>? nationalId,
    Value<String?>? address,
    Value<String?>? notes,
    Value<String>? status,
    Value<double>? balance,
    Value<double>? accumulatedDebt,
    Value<double>? securityDeposit,
    Value<String>? rentalType,
    Value<double>? waterBill,
    Value<double>? electricityBill,
    Value<int>? propertyId,
    Value<String>? propertyName,
    Value<String>? unitId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return TenantsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      nationalId: nationalId ?? this.nationalId,
      address: address ?? this.address,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      balance: balance ?? this.balance,
      accumulatedDebt: accumulatedDebt ?? this.accumulatedDebt,
      securityDeposit: securityDeposit ?? this.securityDeposit,
      rentalType: rentalType ?? this.rentalType,
      waterBill: waterBill ?? this.waterBill,
      electricityBill: electricityBill ?? this.electricityBill,
      propertyId: propertyId ?? this.propertyId,
      propertyName: propertyName ?? this.propertyName,
      unitId: unitId ?? this.unitId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (nationalId.present) {
      map['national_id'] = Variable<String>(nationalId.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (balance.present) {
      map['balance'] = Variable<double>(balance.value);
    }
    if (accumulatedDebt.present) {
      map['accumulated_debt'] = Variable<double>(accumulatedDebt.value);
    }
    if (securityDeposit.present) {
      map['security_deposit'] = Variable<double>(securityDeposit.value);
    }
    if (rentalType.present) {
      map['rental_type'] = Variable<String>(rentalType.value);
    }
    if (waterBill.present) {
      map['water_bill'] = Variable<double>(waterBill.value);
    }
    if (electricityBill.present) {
      map['electricity_bill'] = Variable<double>(electricityBill.value);
    }
    if (propertyId.present) {
      map['property_id'] = Variable<int>(propertyId.value);
    }
    if (propertyName.present) {
      map['property_name'] = Variable<String>(propertyName.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<String>(unitId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TenantsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('nationalId: $nationalId, ')
          ..write('address: $address, ')
          ..write('notes: $notes, ')
          ..write('status: $status, ')
          ..write('balance: $balance, ')
          ..write('accumulatedDebt: $accumulatedDebt, ')
          ..write('securityDeposit: $securityDeposit, ')
          ..write('rentalType: $rentalType, ')
          ..write('waterBill: $waterBill, ')
          ..write('electricityBill: $electricityBill, ')
          ..write('propertyId: $propertyId, ')
          ..write('propertyName: $propertyName, ')
          ..write('unitId: $unitId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ContractsTable extends Contracts
    with TableInfo<$ContractsTable, ContractRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContractsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _tenantIdMeta = const VerificationMeta(
    'tenantId',
  );
  @override
  late final GeneratedColumn<int> tenantId = GeneratedColumn<int>(
    'tenant_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tenants (id)',
    ),
  );
  static const VerificationMeta _propertyIdMeta = const VerificationMeta(
    'propertyId',
  );
  @override
  late final GeneratedColumn<int> propertyId = GeneratedColumn<int>(
    'property_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES properties (id)',
    ),
  );
  static const VerificationMeta _contractNoMeta = const VerificationMeta(
    'contractNo',
  );
  @override
  late final GeneratedColumn<String> contractNo = GeneratedColumn<String>(
    'contract_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _landlordNameMeta = const VerificationMeta(
    'landlordName',
  );
  @override
  late final GeneratedColumn<String> landlordName = GeneratedColumn<String>(
    'landlord_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tenantNameMeta = const VerificationMeta(
    'tenantName',
  );
  @override
  late final GeneratedColumn<String> tenantName = GeneratedColumn<String>(
    'tenant_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _propertyNameMeta = const VerificationMeta(
    'propertyName',
  );
  @override
  late final GeneratedColumn<String> propertyName = GeneratedColumn<String>(
    'property_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<String> unitId = GeneratedColumn<String>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rentAmountMeta = const VerificationMeta(
    'rentAmount',
  );
  @override
  late final GeneratedColumn<double> rentAmount = GeneratedColumn<double>(
    'rent_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('YER'),
  );
  static const VerificationMeta _paymentFrequencyMeta = const VerificationMeta(
    'paymentFrequency',
  );
  @override
  late final GeneratedColumn<String> paymentFrequency = GeneratedColumn<String>(
    'payment_frequency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('شهري'),
  );
  static const VerificationMeta _securityDepositAmountMeta =
      const VerificationMeta('securityDepositAmount');
  @override
  late final GeneratedColumn<double> securityDepositAmount =
      GeneratedColumn<double>(
        'security_deposit_amount',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  static const VerificationMeta _customTermsMeta = const VerificationMeta(
    'customTerms',
  );
  @override
  late final GeneratedColumn<String> customTerms = GeneratedColumn<String>(
    'custom_terms',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _renewalStatusMeta = const VerificationMeta(
    'renewalStatus',
  );
  @override
  late final GeneratedColumn<String> renewalStatus = GeneratedColumn<String>(
    'renewal_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('none'),
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    tenantId,
    propertyId,
    contractNo,
    landlordName,
    tenantName,
    propertyName,
    unitId,
    startDate,
    endDate,
    rentAmount,
    currency,
    paymentFrequency,
    securityDepositAmount,
    status,
    customTerms,
    renewalStatus,
    content,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'contracts';
  @override
  VerificationContext validateIntegrity(
    Insertable<ContractRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tenant_id')) {
      context.handle(
        _tenantIdMeta,
        tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tenantIdMeta);
    }
    if (data.containsKey('property_id')) {
      context.handle(
        _propertyIdMeta,
        propertyId.isAcceptableOrUnknown(data['property_id']!, _propertyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_propertyIdMeta);
    }
    if (data.containsKey('contract_no')) {
      context.handle(
        _contractNoMeta,
        contractNo.isAcceptableOrUnknown(data['contract_no']!, _contractNoMeta),
      );
    }
    if (data.containsKey('landlord_name')) {
      context.handle(
        _landlordNameMeta,
        landlordName.isAcceptableOrUnknown(
          data['landlord_name']!,
          _landlordNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_landlordNameMeta);
    }
    if (data.containsKey('tenant_name')) {
      context.handle(
        _tenantNameMeta,
        tenantName.isAcceptableOrUnknown(data['tenant_name']!, _tenantNameMeta),
      );
    } else if (isInserting) {
      context.missing(_tenantNameMeta);
    }
    if (data.containsKey('property_name')) {
      context.handle(
        _propertyNameMeta,
        propertyName.isAcceptableOrUnknown(
          data['property_name']!,
          _propertyNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_propertyNameMeta);
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('rent_amount')) {
      context.handle(
        _rentAmountMeta,
        rentAmount.isAcceptableOrUnknown(data['rent_amount']!, _rentAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_rentAmountMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    }
    if (data.containsKey('payment_frequency')) {
      context.handle(
        _paymentFrequencyMeta,
        paymentFrequency.isAcceptableOrUnknown(
          data['payment_frequency']!,
          _paymentFrequencyMeta,
        ),
      );
    }
    if (data.containsKey('security_deposit_amount')) {
      context.handle(
        _securityDepositAmountMeta,
        securityDepositAmount.isAcceptableOrUnknown(
          data['security_deposit_amount']!,
          _securityDepositAmountMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('custom_terms')) {
      context.handle(
        _customTermsMeta,
        customTerms.isAcceptableOrUnknown(
          data['custom_terms']!,
          _customTermsMeta,
        ),
      );
    }
    if (data.containsKey('renewal_status')) {
      context.handle(
        _renewalStatusMeta,
        renewalStatus.isAcceptableOrUnknown(
          data['renewal_status']!,
          _renewalStatusMeta,
        ),
      );
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ContractRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContractRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tenantId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tenant_id'],
      )!,
      propertyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}property_id'],
      )!,
      contractNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contract_no'],
      )!,
      landlordName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}landlord_name'],
      )!,
      tenantName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_name'],
      )!,
      propertyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}property_name'],
      )!,
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_id'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      )!,
      rentAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rent_amount'],
      )!,
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      )!,
      paymentFrequency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_frequency'],
      )!,
      securityDepositAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}security_deposit_amount'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      customTerms: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}custom_terms'],
      ),
      renewalStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}renewal_status'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ContractsTable createAlias(String alias) {
    return $ContractsTable(attachedDatabase, alias);
  }
}

class ContractRecord extends DataClass implements Insertable<ContractRecord> {
  final int id;
  final int tenantId;
  final int propertyId;
  final String contractNo;
  final String landlordName;
  final String tenantName;
  final String propertyName;
  final String unitId;
  final DateTime startDate;
  final DateTime endDate;
  final double rentAmount;
  final String currency;
  final String paymentFrequency;
  final double securityDepositAmount;
  final String status;
  final String? customTerms;
  final String renewalStatus;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ContractRecord({
    required this.id,
    required this.tenantId,
    required this.propertyId,
    required this.contractNo,
    required this.landlordName,
    required this.tenantName,
    required this.propertyName,
    required this.unitId,
    required this.startDate,
    required this.endDate,
    required this.rentAmount,
    required this.currency,
    required this.paymentFrequency,
    required this.securityDepositAmount,
    required this.status,
    this.customTerms,
    required this.renewalStatus,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tenant_id'] = Variable<int>(tenantId);
    map['property_id'] = Variable<int>(propertyId);
    map['contract_no'] = Variable<String>(contractNo);
    map['landlord_name'] = Variable<String>(landlordName);
    map['tenant_name'] = Variable<String>(tenantName);
    map['property_name'] = Variable<String>(propertyName);
    map['unit_id'] = Variable<String>(unitId);
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    map['rent_amount'] = Variable<double>(rentAmount);
    map['currency'] = Variable<String>(currency);
    map['payment_frequency'] = Variable<String>(paymentFrequency);
    map['security_deposit_amount'] = Variable<double>(securityDepositAmount);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || customTerms != null) {
      map['custom_terms'] = Variable<String>(customTerms);
    }
    map['renewal_status'] = Variable<String>(renewalStatus);
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ContractsCompanion toCompanion(bool nullToAbsent) {
    return ContractsCompanion(
      id: Value(id),
      tenantId: Value(tenantId),
      propertyId: Value(propertyId),
      contractNo: Value(contractNo),
      landlordName: Value(landlordName),
      tenantName: Value(tenantName),
      propertyName: Value(propertyName),
      unitId: Value(unitId),
      startDate: Value(startDate),
      endDate: Value(endDate),
      rentAmount: Value(rentAmount),
      currency: Value(currency),
      paymentFrequency: Value(paymentFrequency),
      securityDepositAmount: Value(securityDepositAmount),
      status: Value(status),
      customTerms: customTerms == null && nullToAbsent
          ? const Value.absent()
          : Value(customTerms),
      renewalStatus: Value(renewalStatus),
      content: Value(content),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ContractRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContractRecord(
      id: serializer.fromJson<int>(json['id']),
      tenantId: serializer.fromJson<int>(json['tenantId']),
      propertyId: serializer.fromJson<int>(json['propertyId']),
      contractNo: serializer.fromJson<String>(json['contractNo']),
      landlordName: serializer.fromJson<String>(json['landlordName']),
      tenantName: serializer.fromJson<String>(json['tenantName']),
      propertyName: serializer.fromJson<String>(json['propertyName']),
      unitId: serializer.fromJson<String>(json['unitId']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      rentAmount: serializer.fromJson<double>(json['rentAmount']),
      currency: serializer.fromJson<String>(json['currency']),
      paymentFrequency: serializer.fromJson<String>(json['paymentFrequency']),
      securityDepositAmount: serializer.fromJson<double>(
        json['securityDepositAmount'],
      ),
      status: serializer.fromJson<String>(json['status']),
      customTerms: serializer.fromJson<String?>(json['customTerms']),
      renewalStatus: serializer.fromJson<String>(json['renewalStatus']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tenantId': serializer.toJson<int>(tenantId),
      'propertyId': serializer.toJson<int>(propertyId),
      'contractNo': serializer.toJson<String>(contractNo),
      'landlordName': serializer.toJson<String>(landlordName),
      'tenantName': serializer.toJson<String>(tenantName),
      'propertyName': serializer.toJson<String>(propertyName),
      'unitId': serializer.toJson<String>(unitId),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'rentAmount': serializer.toJson<double>(rentAmount),
      'currency': serializer.toJson<String>(currency),
      'paymentFrequency': serializer.toJson<String>(paymentFrequency),
      'securityDepositAmount': serializer.toJson<double>(securityDepositAmount),
      'status': serializer.toJson<String>(status),
      'customTerms': serializer.toJson<String?>(customTerms),
      'renewalStatus': serializer.toJson<String>(renewalStatus),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ContractRecord copyWith({
    int? id,
    int? tenantId,
    int? propertyId,
    String? contractNo,
    String? landlordName,
    String? tenantName,
    String? propertyName,
    String? unitId,
    DateTime? startDate,
    DateTime? endDate,
    double? rentAmount,
    String? currency,
    String? paymentFrequency,
    double? securityDepositAmount,
    String? status,
    Value<String?> customTerms = const Value.absent(),
    String? renewalStatus,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => ContractRecord(
    id: id ?? this.id,
    tenantId: tenantId ?? this.tenantId,
    propertyId: propertyId ?? this.propertyId,
    contractNo: contractNo ?? this.contractNo,
    landlordName: landlordName ?? this.landlordName,
    tenantName: tenantName ?? this.tenantName,
    propertyName: propertyName ?? this.propertyName,
    unitId: unitId ?? this.unitId,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    rentAmount: rentAmount ?? this.rentAmount,
    currency: currency ?? this.currency,
    paymentFrequency: paymentFrequency ?? this.paymentFrequency,
    securityDepositAmount: securityDepositAmount ?? this.securityDepositAmount,
    status: status ?? this.status,
    customTerms: customTerms.present ? customTerms.value : this.customTerms,
    renewalStatus: renewalStatus ?? this.renewalStatus,
    content: content ?? this.content,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ContractRecord copyWithCompanion(ContractsCompanion data) {
    return ContractRecord(
      id: data.id.present ? data.id.value : this.id,
      tenantId: data.tenantId.present ? data.tenantId.value : this.tenantId,
      propertyId: data.propertyId.present
          ? data.propertyId.value
          : this.propertyId,
      contractNo: data.contractNo.present
          ? data.contractNo.value
          : this.contractNo,
      landlordName: data.landlordName.present
          ? data.landlordName.value
          : this.landlordName,
      tenantName: data.tenantName.present
          ? data.tenantName.value
          : this.tenantName,
      propertyName: data.propertyName.present
          ? data.propertyName.value
          : this.propertyName,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      rentAmount: data.rentAmount.present
          ? data.rentAmount.value
          : this.rentAmount,
      currency: data.currency.present ? data.currency.value : this.currency,
      paymentFrequency: data.paymentFrequency.present
          ? data.paymentFrequency.value
          : this.paymentFrequency,
      securityDepositAmount: data.securityDepositAmount.present
          ? data.securityDepositAmount.value
          : this.securityDepositAmount,
      status: data.status.present ? data.status.value : this.status,
      customTerms: data.customTerms.present
          ? data.customTerms.value
          : this.customTerms,
      renewalStatus: data.renewalStatus.present
          ? data.renewalStatus.value
          : this.renewalStatus,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ContractRecord(')
          ..write('id: $id, ')
          ..write('tenantId: $tenantId, ')
          ..write('propertyId: $propertyId, ')
          ..write('contractNo: $contractNo, ')
          ..write('landlordName: $landlordName, ')
          ..write('tenantName: $tenantName, ')
          ..write('propertyName: $propertyName, ')
          ..write('unitId: $unitId, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('rentAmount: $rentAmount, ')
          ..write('currency: $currency, ')
          ..write('paymentFrequency: $paymentFrequency, ')
          ..write('securityDepositAmount: $securityDepositAmount, ')
          ..write('status: $status, ')
          ..write('customTerms: $customTerms, ')
          ..write('renewalStatus: $renewalStatus, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    tenantId,
    propertyId,
    contractNo,
    landlordName,
    tenantName,
    propertyName,
    unitId,
    startDate,
    endDate,
    rentAmount,
    currency,
    paymentFrequency,
    securityDepositAmount,
    status,
    customTerms,
    renewalStatus,
    content,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContractRecord &&
          other.id == this.id &&
          other.tenantId == this.tenantId &&
          other.propertyId == this.propertyId &&
          other.contractNo == this.contractNo &&
          other.landlordName == this.landlordName &&
          other.tenantName == this.tenantName &&
          other.propertyName == this.propertyName &&
          other.unitId == this.unitId &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.rentAmount == this.rentAmount &&
          other.currency == this.currency &&
          other.paymentFrequency == this.paymentFrequency &&
          other.securityDepositAmount == this.securityDepositAmount &&
          other.status == this.status &&
          other.customTerms == this.customTerms &&
          other.renewalStatus == this.renewalStatus &&
          other.content == this.content &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ContractsCompanion extends UpdateCompanion<ContractRecord> {
  final Value<int> id;
  final Value<int> tenantId;
  final Value<int> propertyId;
  final Value<String> contractNo;
  final Value<String> landlordName;
  final Value<String> tenantName;
  final Value<String> propertyName;
  final Value<String> unitId;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<double> rentAmount;
  final Value<String> currency;
  final Value<String> paymentFrequency;
  final Value<double> securityDepositAmount;
  final Value<String> status;
  final Value<String?> customTerms;
  final Value<String> renewalStatus;
  final Value<String> content;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ContractsCompanion({
    this.id = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.propertyId = const Value.absent(),
    this.contractNo = const Value.absent(),
    this.landlordName = const Value.absent(),
    this.tenantName = const Value.absent(),
    this.propertyName = const Value.absent(),
    this.unitId = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.rentAmount = const Value.absent(),
    this.currency = const Value.absent(),
    this.paymentFrequency = const Value.absent(),
    this.securityDepositAmount = const Value.absent(),
    this.status = const Value.absent(),
    this.customTerms = const Value.absent(),
    this.renewalStatus = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ContractsCompanion.insert({
    this.id = const Value.absent(),
    required int tenantId,
    required int propertyId,
    this.contractNo = const Value.absent(),
    required String landlordName,
    required String tenantName,
    required String propertyName,
    this.unitId = const Value.absent(),
    required DateTime startDate,
    required DateTime endDate,
    required double rentAmount,
    this.currency = const Value.absent(),
    this.paymentFrequency = const Value.absent(),
    this.securityDepositAmount = const Value.absent(),
    this.status = const Value.absent(),
    this.customTerms = const Value.absent(),
    this.renewalStatus = const Value.absent(),
    required String content,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : tenantId = Value(tenantId),
       propertyId = Value(propertyId),
       landlordName = Value(landlordName),
       tenantName = Value(tenantName),
       propertyName = Value(propertyName),
       startDate = Value(startDate),
       endDate = Value(endDate),
       rentAmount = Value(rentAmount),
       content = Value(content);
  static Insertable<ContractRecord> custom({
    Expression<int>? id,
    Expression<int>? tenantId,
    Expression<int>? propertyId,
    Expression<String>? contractNo,
    Expression<String>? landlordName,
    Expression<String>? tenantName,
    Expression<String>? propertyName,
    Expression<String>? unitId,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<double>? rentAmount,
    Expression<String>? currency,
    Expression<String>? paymentFrequency,
    Expression<double>? securityDepositAmount,
    Expression<String>? status,
    Expression<String>? customTerms,
    Expression<String>? renewalStatus,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tenantId != null) 'tenant_id': tenantId,
      if (propertyId != null) 'property_id': propertyId,
      if (contractNo != null) 'contract_no': contractNo,
      if (landlordName != null) 'landlord_name': landlordName,
      if (tenantName != null) 'tenant_name': tenantName,
      if (propertyName != null) 'property_name': propertyName,
      if (unitId != null) 'unit_id': unitId,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (rentAmount != null) 'rent_amount': rentAmount,
      if (currency != null) 'currency': currency,
      if (paymentFrequency != null) 'payment_frequency': paymentFrequency,
      if (securityDepositAmount != null)
        'security_deposit_amount': securityDepositAmount,
      if (status != null) 'status': status,
      if (customTerms != null) 'custom_terms': customTerms,
      if (renewalStatus != null) 'renewal_status': renewalStatus,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ContractsCompanion copyWith({
    Value<int>? id,
    Value<int>? tenantId,
    Value<int>? propertyId,
    Value<String>? contractNo,
    Value<String>? landlordName,
    Value<String>? tenantName,
    Value<String>? propertyName,
    Value<String>? unitId,
    Value<DateTime>? startDate,
    Value<DateTime>? endDate,
    Value<double>? rentAmount,
    Value<String>? currency,
    Value<String>? paymentFrequency,
    Value<double>? securityDepositAmount,
    Value<String>? status,
    Value<String?>? customTerms,
    Value<String>? renewalStatus,
    Value<String>? content,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return ContractsCompanion(
      id: id ?? this.id,
      tenantId: tenantId ?? this.tenantId,
      propertyId: propertyId ?? this.propertyId,
      contractNo: contractNo ?? this.contractNo,
      landlordName: landlordName ?? this.landlordName,
      tenantName: tenantName ?? this.tenantName,
      propertyName: propertyName ?? this.propertyName,
      unitId: unitId ?? this.unitId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      rentAmount: rentAmount ?? this.rentAmount,
      currency: currency ?? this.currency,
      paymentFrequency: paymentFrequency ?? this.paymentFrequency,
      securityDepositAmount:
          securityDepositAmount ?? this.securityDepositAmount,
      status: status ?? this.status,
      customTerms: customTerms ?? this.customTerms,
      renewalStatus: renewalStatus ?? this.renewalStatus,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    if (propertyId.present) {
      map['property_id'] = Variable<int>(propertyId.value);
    }
    if (contractNo.present) {
      map['contract_no'] = Variable<String>(contractNo.value);
    }
    if (landlordName.present) {
      map['landlord_name'] = Variable<String>(landlordName.value);
    }
    if (tenantName.present) {
      map['tenant_name'] = Variable<String>(tenantName.value);
    }
    if (propertyName.present) {
      map['property_name'] = Variable<String>(propertyName.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<String>(unitId.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (rentAmount.present) {
      map['rent_amount'] = Variable<double>(rentAmount.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (paymentFrequency.present) {
      map['payment_frequency'] = Variable<String>(paymentFrequency.value);
    }
    if (securityDepositAmount.present) {
      map['security_deposit_amount'] = Variable<double>(
        securityDepositAmount.value,
      );
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (customTerms.present) {
      map['custom_terms'] = Variable<String>(customTerms.value);
    }
    if (renewalStatus.present) {
      map['renewal_status'] = Variable<String>(renewalStatus.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContractsCompanion(')
          ..write('id: $id, ')
          ..write('tenantId: $tenantId, ')
          ..write('propertyId: $propertyId, ')
          ..write('contractNo: $contractNo, ')
          ..write('landlordName: $landlordName, ')
          ..write('tenantName: $tenantName, ')
          ..write('propertyName: $propertyName, ')
          ..write('unitId: $unitId, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('rentAmount: $rentAmount, ')
          ..write('currency: $currency, ')
          ..write('paymentFrequency: $paymentFrequency, ')
          ..write('securityDepositAmount: $securityDepositAmount, ')
          ..write('status: $status, ')
          ..write('customTerms: $customTerms, ')
          ..write('renewalStatus: $renewalStatus, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $PaymentsTable extends Payments
    with TableInfo<$PaymentsTable, PaymentRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _tenantIdMeta = const VerificationMeta(
    'tenantId',
  );
  @override
  late final GeneratedColumn<int> tenantId = GeneratedColumn<int>(
    'tenant_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tenants (id)',
    ),
  );
  static const VerificationMeta _tenantNameMeta = const VerificationMeta(
    'tenantName',
  );
  @override
  late final GeneratedColumn<String> tenantName = GeneratedColumn<String>(
    'tenant_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tenantPhoneMeta = const VerificationMeta(
    'tenantPhone',
  );
  @override
  late final GeneratedColumn<String> tenantPhone = GeneratedColumn<String>(
    'tenant_phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _propertyIdMeta = const VerificationMeta(
    'propertyId',
  );
  @override
  late final GeneratedColumn<int> propertyId = GeneratedColumn<int>(
    'property_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES properties (id)',
    ),
  );
  static const VerificationMeta _propertyNameMeta = const VerificationMeta(
    'propertyName',
  );
  @override
  late final GeneratedColumn<String> propertyName = GeneratedColumn<String>(
    'property_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('YER'),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _methodMeta = const VerificationMeta('method');
  @override
  late final GeneratedColumn<String> method = GeneratedColumn<String>(
    'method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('bank_transfer'),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('paid'),
  );
  static const VerificationMeta _receiptNoMeta = const VerificationMeta(
    'receiptNo',
  );
  @override
  late final GeneratedColumn<String> receiptNo = GeneratedColumn<String>(
    'receipt_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dueScheduleIdMeta = const VerificationMeta(
    'dueScheduleId',
  );
  @override
  late final GeneratedColumn<int> dueScheduleId = GeneratedColumn<int>(
    'due_schedule_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _messageStatusMeta = const VerificationMeta(
    'messageStatus',
  );
  @override
  late final GeneratedColumn<String> messageStatus = GeneratedColumn<String>(
    'message_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('unsent'),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    tenantId,
    tenantName,
    tenantPhone,
    propertyId,
    propertyName,
    amount,
    currency,
    date,
    method,
    status,
    receiptNo,
    dueScheduleId,
    messageStatus,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payments';
  @override
  VerificationContext validateIntegrity(
    Insertable<PaymentRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tenant_id')) {
      context.handle(
        _tenantIdMeta,
        tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tenantIdMeta);
    }
    if (data.containsKey('tenant_name')) {
      context.handle(
        _tenantNameMeta,
        tenantName.isAcceptableOrUnknown(data['tenant_name']!, _tenantNameMeta),
      );
    } else if (isInserting) {
      context.missing(_tenantNameMeta);
    }
    if (data.containsKey('tenant_phone')) {
      context.handle(
        _tenantPhoneMeta,
        tenantPhone.isAcceptableOrUnknown(
          data['tenant_phone']!,
          _tenantPhoneMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tenantPhoneMeta);
    }
    if (data.containsKey('property_id')) {
      context.handle(
        _propertyIdMeta,
        propertyId.isAcceptableOrUnknown(data['property_id']!, _propertyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_propertyIdMeta);
    }
    if (data.containsKey('property_name')) {
      context.handle(
        _propertyNameMeta,
        propertyName.isAcceptableOrUnknown(
          data['property_name']!,
          _propertyNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_propertyNameMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('method')) {
      context.handle(
        _methodMeta,
        method.isAcceptableOrUnknown(data['method']!, _methodMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('receipt_no')) {
      context.handle(
        _receiptNoMeta,
        receiptNo.isAcceptableOrUnknown(data['receipt_no']!, _receiptNoMeta),
      );
    } else if (isInserting) {
      context.missing(_receiptNoMeta);
    }
    if (data.containsKey('due_schedule_id')) {
      context.handle(
        _dueScheduleIdMeta,
        dueScheduleId.isAcceptableOrUnknown(
          data['due_schedule_id']!,
          _dueScheduleIdMeta,
        ),
      );
    }
    if (data.containsKey('message_status')) {
      context.handle(
        _messageStatusMeta,
        messageStatus.isAcceptableOrUnknown(
          data['message_status']!,
          _messageStatusMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PaymentRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PaymentRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tenantId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tenant_id'],
      )!,
      tenantName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_name'],
      )!,
      tenantPhone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_phone'],
      )!,
      propertyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}property_id'],
      )!,
      propertyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}property_name'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      method: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}method'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      receiptNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}receipt_no'],
      )!,
      dueScheduleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}due_schedule_id'],
      ),
      messageStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message_status'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PaymentsTable createAlias(String alias) {
    return $PaymentsTable(attachedDatabase, alias);
  }
}

class PaymentRecord extends DataClass implements Insertable<PaymentRecord> {
  final int id;
  final int tenantId;
  final String tenantName;
  final String tenantPhone;
  final int propertyId;
  final String propertyName;
  final double amount;
  final String currency;
  final DateTime date;
  final String method;
  final String status;
  final String receiptNo;
  final int? dueScheduleId;
  final String messageStatus;
  final String? notes;
  final DateTime createdAt;
  const PaymentRecord({
    required this.id,
    required this.tenantId,
    required this.tenantName,
    required this.tenantPhone,
    required this.propertyId,
    required this.propertyName,
    required this.amount,
    required this.currency,
    required this.date,
    required this.method,
    required this.status,
    required this.receiptNo,
    this.dueScheduleId,
    required this.messageStatus,
    this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tenant_id'] = Variable<int>(tenantId);
    map['tenant_name'] = Variable<String>(tenantName);
    map['tenant_phone'] = Variable<String>(tenantPhone);
    map['property_id'] = Variable<int>(propertyId);
    map['property_name'] = Variable<String>(propertyName);
    map['amount'] = Variable<double>(amount);
    map['currency'] = Variable<String>(currency);
    map['date'] = Variable<DateTime>(date);
    map['method'] = Variable<String>(method);
    map['status'] = Variable<String>(status);
    map['receipt_no'] = Variable<String>(receiptNo);
    if (!nullToAbsent || dueScheduleId != null) {
      map['due_schedule_id'] = Variable<int>(dueScheduleId);
    }
    map['message_status'] = Variable<String>(messageStatus);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PaymentsCompanion toCompanion(bool nullToAbsent) {
    return PaymentsCompanion(
      id: Value(id),
      tenantId: Value(tenantId),
      tenantName: Value(tenantName),
      tenantPhone: Value(tenantPhone),
      propertyId: Value(propertyId),
      propertyName: Value(propertyName),
      amount: Value(amount),
      currency: Value(currency),
      date: Value(date),
      method: Value(method),
      status: Value(status),
      receiptNo: Value(receiptNo),
      dueScheduleId: dueScheduleId == null && nullToAbsent
          ? const Value.absent()
          : Value(dueScheduleId),
      messageStatus: Value(messageStatus),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory PaymentRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PaymentRecord(
      id: serializer.fromJson<int>(json['id']),
      tenantId: serializer.fromJson<int>(json['tenantId']),
      tenantName: serializer.fromJson<String>(json['tenantName']),
      tenantPhone: serializer.fromJson<String>(json['tenantPhone']),
      propertyId: serializer.fromJson<int>(json['propertyId']),
      propertyName: serializer.fromJson<String>(json['propertyName']),
      amount: serializer.fromJson<double>(json['amount']),
      currency: serializer.fromJson<String>(json['currency']),
      date: serializer.fromJson<DateTime>(json['date']),
      method: serializer.fromJson<String>(json['method']),
      status: serializer.fromJson<String>(json['status']),
      receiptNo: serializer.fromJson<String>(json['receiptNo']),
      dueScheduleId: serializer.fromJson<int?>(json['dueScheduleId']),
      messageStatus: serializer.fromJson<String>(json['messageStatus']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tenantId': serializer.toJson<int>(tenantId),
      'tenantName': serializer.toJson<String>(tenantName),
      'tenantPhone': serializer.toJson<String>(tenantPhone),
      'propertyId': serializer.toJson<int>(propertyId),
      'propertyName': serializer.toJson<String>(propertyName),
      'amount': serializer.toJson<double>(amount),
      'currency': serializer.toJson<String>(currency),
      'date': serializer.toJson<DateTime>(date),
      'method': serializer.toJson<String>(method),
      'status': serializer.toJson<String>(status),
      'receiptNo': serializer.toJson<String>(receiptNo),
      'dueScheduleId': serializer.toJson<int?>(dueScheduleId),
      'messageStatus': serializer.toJson<String>(messageStatus),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PaymentRecord copyWith({
    int? id,
    int? tenantId,
    String? tenantName,
    String? tenantPhone,
    int? propertyId,
    String? propertyName,
    double? amount,
    String? currency,
    DateTime? date,
    String? method,
    String? status,
    String? receiptNo,
    Value<int?> dueScheduleId = const Value.absent(),
    String? messageStatus,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
  }) => PaymentRecord(
    id: id ?? this.id,
    tenantId: tenantId ?? this.tenantId,
    tenantName: tenantName ?? this.tenantName,
    tenantPhone: tenantPhone ?? this.tenantPhone,
    propertyId: propertyId ?? this.propertyId,
    propertyName: propertyName ?? this.propertyName,
    amount: amount ?? this.amount,
    currency: currency ?? this.currency,
    date: date ?? this.date,
    method: method ?? this.method,
    status: status ?? this.status,
    receiptNo: receiptNo ?? this.receiptNo,
    dueScheduleId: dueScheduleId.present
        ? dueScheduleId.value
        : this.dueScheduleId,
    messageStatus: messageStatus ?? this.messageStatus,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  PaymentRecord copyWithCompanion(PaymentsCompanion data) {
    return PaymentRecord(
      id: data.id.present ? data.id.value : this.id,
      tenantId: data.tenantId.present ? data.tenantId.value : this.tenantId,
      tenantName: data.tenantName.present
          ? data.tenantName.value
          : this.tenantName,
      tenantPhone: data.tenantPhone.present
          ? data.tenantPhone.value
          : this.tenantPhone,
      propertyId: data.propertyId.present
          ? data.propertyId.value
          : this.propertyId,
      propertyName: data.propertyName.present
          ? data.propertyName.value
          : this.propertyName,
      amount: data.amount.present ? data.amount.value : this.amount,
      currency: data.currency.present ? data.currency.value : this.currency,
      date: data.date.present ? data.date.value : this.date,
      method: data.method.present ? data.method.value : this.method,
      status: data.status.present ? data.status.value : this.status,
      receiptNo: data.receiptNo.present ? data.receiptNo.value : this.receiptNo,
      dueScheduleId: data.dueScheduleId.present
          ? data.dueScheduleId.value
          : this.dueScheduleId,
      messageStatus: data.messageStatus.present
          ? data.messageStatus.value
          : this.messageStatus,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PaymentRecord(')
          ..write('id: $id, ')
          ..write('tenantId: $tenantId, ')
          ..write('tenantName: $tenantName, ')
          ..write('tenantPhone: $tenantPhone, ')
          ..write('propertyId: $propertyId, ')
          ..write('propertyName: $propertyName, ')
          ..write('amount: $amount, ')
          ..write('currency: $currency, ')
          ..write('date: $date, ')
          ..write('method: $method, ')
          ..write('status: $status, ')
          ..write('receiptNo: $receiptNo, ')
          ..write('dueScheduleId: $dueScheduleId, ')
          ..write('messageStatus: $messageStatus, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    tenantId,
    tenantName,
    tenantPhone,
    propertyId,
    propertyName,
    amount,
    currency,
    date,
    method,
    status,
    receiptNo,
    dueScheduleId,
    messageStatus,
    notes,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentRecord &&
          other.id == this.id &&
          other.tenantId == this.tenantId &&
          other.tenantName == this.tenantName &&
          other.tenantPhone == this.tenantPhone &&
          other.propertyId == this.propertyId &&
          other.propertyName == this.propertyName &&
          other.amount == this.amount &&
          other.currency == this.currency &&
          other.date == this.date &&
          other.method == this.method &&
          other.status == this.status &&
          other.receiptNo == this.receiptNo &&
          other.dueScheduleId == this.dueScheduleId &&
          other.messageStatus == this.messageStatus &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class PaymentsCompanion extends UpdateCompanion<PaymentRecord> {
  final Value<int> id;
  final Value<int> tenantId;
  final Value<String> tenantName;
  final Value<String> tenantPhone;
  final Value<int> propertyId;
  final Value<String> propertyName;
  final Value<double> amount;
  final Value<String> currency;
  final Value<DateTime> date;
  final Value<String> method;
  final Value<String> status;
  final Value<String> receiptNo;
  final Value<int?> dueScheduleId;
  final Value<String> messageStatus;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  const PaymentsCompanion({
    this.id = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.tenantName = const Value.absent(),
    this.tenantPhone = const Value.absent(),
    this.propertyId = const Value.absent(),
    this.propertyName = const Value.absent(),
    this.amount = const Value.absent(),
    this.currency = const Value.absent(),
    this.date = const Value.absent(),
    this.method = const Value.absent(),
    this.status = const Value.absent(),
    this.receiptNo = const Value.absent(),
    this.dueScheduleId = const Value.absent(),
    this.messageStatus = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PaymentsCompanion.insert({
    this.id = const Value.absent(),
    required int tenantId,
    required String tenantName,
    required String tenantPhone,
    required int propertyId,
    required String propertyName,
    required double amount,
    this.currency = const Value.absent(),
    required DateTime date,
    this.method = const Value.absent(),
    this.status = const Value.absent(),
    required String receiptNo,
    this.dueScheduleId = const Value.absent(),
    this.messageStatus = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : tenantId = Value(tenantId),
       tenantName = Value(tenantName),
       tenantPhone = Value(tenantPhone),
       propertyId = Value(propertyId),
       propertyName = Value(propertyName),
       amount = Value(amount),
       date = Value(date),
       receiptNo = Value(receiptNo);
  static Insertable<PaymentRecord> custom({
    Expression<int>? id,
    Expression<int>? tenantId,
    Expression<String>? tenantName,
    Expression<String>? tenantPhone,
    Expression<int>? propertyId,
    Expression<String>? propertyName,
    Expression<double>? amount,
    Expression<String>? currency,
    Expression<DateTime>? date,
    Expression<String>? method,
    Expression<String>? status,
    Expression<String>? receiptNo,
    Expression<int>? dueScheduleId,
    Expression<String>? messageStatus,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tenantId != null) 'tenant_id': tenantId,
      if (tenantName != null) 'tenant_name': tenantName,
      if (tenantPhone != null) 'tenant_phone': tenantPhone,
      if (propertyId != null) 'property_id': propertyId,
      if (propertyName != null) 'property_name': propertyName,
      if (amount != null) 'amount': amount,
      if (currency != null) 'currency': currency,
      if (date != null) 'date': date,
      if (method != null) 'method': method,
      if (status != null) 'status': status,
      if (receiptNo != null) 'receipt_no': receiptNo,
      if (dueScheduleId != null) 'due_schedule_id': dueScheduleId,
      if (messageStatus != null) 'message_status': messageStatus,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PaymentsCompanion copyWith({
    Value<int>? id,
    Value<int>? tenantId,
    Value<String>? tenantName,
    Value<String>? tenantPhone,
    Value<int>? propertyId,
    Value<String>? propertyName,
    Value<double>? amount,
    Value<String>? currency,
    Value<DateTime>? date,
    Value<String>? method,
    Value<String>? status,
    Value<String>? receiptNo,
    Value<int?>? dueScheduleId,
    Value<String>? messageStatus,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
  }) {
    return PaymentsCompanion(
      id: id ?? this.id,
      tenantId: tenantId ?? this.tenantId,
      tenantName: tenantName ?? this.tenantName,
      tenantPhone: tenantPhone ?? this.tenantPhone,
      propertyId: propertyId ?? this.propertyId,
      propertyName: propertyName ?? this.propertyName,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      date: date ?? this.date,
      method: method ?? this.method,
      status: status ?? this.status,
      receiptNo: receiptNo ?? this.receiptNo,
      dueScheduleId: dueScheduleId ?? this.dueScheduleId,
      messageStatus: messageStatus ?? this.messageStatus,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    if (tenantName.present) {
      map['tenant_name'] = Variable<String>(tenantName.value);
    }
    if (tenantPhone.present) {
      map['tenant_phone'] = Variable<String>(tenantPhone.value);
    }
    if (propertyId.present) {
      map['property_id'] = Variable<int>(propertyId.value);
    }
    if (propertyName.present) {
      map['property_name'] = Variable<String>(propertyName.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (method.present) {
      map['method'] = Variable<String>(method.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (receiptNo.present) {
      map['receipt_no'] = Variable<String>(receiptNo.value);
    }
    if (dueScheduleId.present) {
      map['due_schedule_id'] = Variable<int>(dueScheduleId.value);
    }
    if (messageStatus.present) {
      map['message_status'] = Variable<String>(messageStatus.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentsCompanion(')
          ..write('id: $id, ')
          ..write('tenantId: $tenantId, ')
          ..write('tenantName: $tenantName, ')
          ..write('tenantPhone: $tenantPhone, ')
          ..write('propertyId: $propertyId, ')
          ..write('propertyName: $propertyName, ')
          ..write('amount: $amount, ')
          ..write('currency: $currency, ')
          ..write('date: $date, ')
          ..write('method: $method, ')
          ..write('status: $status, ')
          ..write('receiptNo: $receiptNo, ')
          ..write('dueScheduleId: $dueScheduleId, ')
          ..write('messageStatus: $messageStatus, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $UtilityBillsTable extends UtilityBills
    with TableInfo<$UtilityBillsTable, UtilityBillRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UtilityBillsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _tenantIdMeta = const VerificationMeta(
    'tenantId',
  );
  @override
  late final GeneratedColumn<int> tenantId = GeneratedColumn<int>(
    'tenant_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tenants (id)',
    ),
  );
  static const VerificationMeta _tenantNameMeta = const VerificationMeta(
    'tenantName',
  );
  @override
  late final GeneratedColumn<String> tenantName = GeneratedColumn<String>(
    'tenant_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _propertyIdMeta = const VerificationMeta(
    'propertyId',
  );
  @override
  late final GeneratedColumn<int> propertyId = GeneratedColumn<int>(
    'property_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES properties (id)',
    ),
  );
  static const VerificationMeta _propertyNameMeta = const VerificationMeta(
    'propertyName',
  );
  @override
  late final GeneratedColumn<String> propertyName = GeneratedColumn<String>(
    'property_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<String> unitId = GeneratedColumn<String>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _periodStartMeta = const VerificationMeta(
    'periodStart',
  );
  @override
  late final GeneratedColumn<DateTime> periodStart = GeneratedColumn<DateTime>(
    'period_start',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _periodEndMeta = const VerificationMeta(
    'periodEnd',
  );
  @override
  late final GeneratedColumn<DateTime> periodEnd = GeneratedColumn<DateTime>(
    'period_end',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _consumptionMeta = const VerificationMeta(
    'consumption',
  );
  @override
  late final GeneratedColumn<double> consumption = GeneratedColumn<double>(
    'consumption',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _rateMeta = const VerificationMeta('rate');
  @override
  late final GeneratedColumn<double> rate = GeneratedColumn<double>(
    'rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _meterOwnershipMeta = const VerificationMeta(
    'meterOwnership',
  );
  @override
  late final GeneratedColumn<String> meterOwnership = GeneratedColumn<String>(
    'meter_ownership',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('owner_meter'),
  );
  static const VerificationMeta _meterNoMeta = const VerificationMeta(
    'meterNo',
  );
  @override
  late final GeneratedColumn<String> meterNo = GeneratedColumn<String>(
    'meter_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _previousReadingMeta = const VerificationMeta(
    'previousReading',
  );
  @override
  late final GeneratedColumn<double> previousReading = GeneratedColumn<double>(
    'previous_reading',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _currentReadingMeta = const VerificationMeta(
    'currentReading',
  );
  @override
  late final GeneratedColumn<double> currentReading = GeneratedColumn<double>(
    'current_reading',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _chargeToTenantMeta = const VerificationMeta(
    'chargeToTenant',
  );
  @override
  late final GeneratedColumn<bool> chargeToTenant = GeneratedColumn<bool>(
    'charge_to_tenant',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("charge_to_tenant" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _paidExternallyMeta = const VerificationMeta(
    'paidExternally',
  );
  @override
  late final GeneratedColumn<bool> paidExternally = GeneratedColumn<bool>(
    'paid_externally',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("paid_externally" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _proofPathMeta = const VerificationMeta(
    'proofPath',
  );
  @override
  late final GeneratedColumn<String> proofPath = GeneratedColumn<String>(
    'proof_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('open'),
  );
  static const VerificationMeta _paymentIdMeta = const VerificationMeta(
    'paymentId',
  );
  @override
  late final GeneratedColumn<int> paymentId = GeneratedColumn<int>(
    'payment_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES payments (id)',
    ),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    tenantId,
    tenantName,
    propertyId,
    propertyName,
    unitId,
    type,
    periodStart,
    periodEnd,
    consumption,
    rate,
    amount,
    meterOwnership,
    meterNo,
    previousReading,
    currentReading,
    chargeToTenant,
    paidExternally,
    proofPath,
    status,
    paymentId,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'utility_bills';
  @override
  VerificationContext validateIntegrity(
    Insertable<UtilityBillRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tenant_id')) {
      context.handle(
        _tenantIdMeta,
        tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta),
      );
    }
    if (data.containsKey('tenant_name')) {
      context.handle(
        _tenantNameMeta,
        tenantName.isAcceptableOrUnknown(data['tenant_name']!, _tenantNameMeta),
      );
    }
    if (data.containsKey('property_id')) {
      context.handle(
        _propertyIdMeta,
        propertyId.isAcceptableOrUnknown(data['property_id']!, _propertyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_propertyIdMeta);
    }
    if (data.containsKey('property_name')) {
      context.handle(
        _propertyNameMeta,
        propertyName.isAcceptableOrUnknown(
          data['property_name']!,
          _propertyNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_propertyNameMeta);
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_unitIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('period_start')) {
      context.handle(
        _periodStartMeta,
        periodStart.isAcceptableOrUnknown(
          data['period_start']!,
          _periodStartMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_periodStartMeta);
    }
    if (data.containsKey('period_end')) {
      context.handle(
        _periodEndMeta,
        periodEnd.isAcceptableOrUnknown(data['period_end']!, _periodEndMeta),
      );
    } else if (isInserting) {
      context.missing(_periodEndMeta);
    }
    if (data.containsKey('consumption')) {
      context.handle(
        _consumptionMeta,
        consumption.isAcceptableOrUnknown(
          data['consumption']!,
          _consumptionMeta,
        ),
      );
    }
    if (data.containsKey('rate')) {
      context.handle(
        _rateMeta,
        rate.isAcceptableOrUnknown(data['rate']!, _rateMeta),
      );
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    }
    if (data.containsKey('meter_ownership')) {
      context.handle(
        _meterOwnershipMeta,
        meterOwnership.isAcceptableOrUnknown(
          data['meter_ownership']!,
          _meterOwnershipMeta,
        ),
      );
    }
    if (data.containsKey('meter_no')) {
      context.handle(
        _meterNoMeta,
        meterNo.isAcceptableOrUnknown(data['meter_no']!, _meterNoMeta),
      );
    }
    if (data.containsKey('previous_reading')) {
      context.handle(
        _previousReadingMeta,
        previousReading.isAcceptableOrUnknown(
          data['previous_reading']!,
          _previousReadingMeta,
        ),
      );
    }
    if (data.containsKey('current_reading')) {
      context.handle(
        _currentReadingMeta,
        currentReading.isAcceptableOrUnknown(
          data['current_reading']!,
          _currentReadingMeta,
        ),
      );
    }
    if (data.containsKey('charge_to_tenant')) {
      context.handle(
        _chargeToTenantMeta,
        chargeToTenant.isAcceptableOrUnknown(
          data['charge_to_tenant']!,
          _chargeToTenantMeta,
        ),
      );
    }
    if (data.containsKey('paid_externally')) {
      context.handle(
        _paidExternallyMeta,
        paidExternally.isAcceptableOrUnknown(
          data['paid_externally']!,
          _paidExternallyMeta,
        ),
      );
    }
    if (data.containsKey('proof_path')) {
      context.handle(
        _proofPathMeta,
        proofPath.isAcceptableOrUnknown(data['proof_path']!, _proofPathMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('payment_id')) {
      context.handle(
        _paymentIdMeta,
        paymentId.isAcceptableOrUnknown(data['payment_id']!, _paymentIdMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UtilityBillRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UtilityBillRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tenantId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tenant_id'],
      ),
      tenantName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_name'],
      ),
      propertyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}property_id'],
      )!,
      propertyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}property_name'],
      )!,
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      periodStart: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}period_start'],
      )!,
      periodEnd: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}period_end'],
      )!,
      consumption: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}consumption'],
      )!,
      rate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rate'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      meterOwnership: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meter_ownership'],
      )!,
      meterNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meter_no'],
      ),
      previousReading: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}previous_reading'],
      )!,
      currentReading: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}current_reading'],
      )!,
      chargeToTenant: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}charge_to_tenant'],
      )!,
      paidExternally: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}paid_externally'],
      )!,
      proofPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}proof_path'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      paymentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}payment_id'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UtilityBillsTable createAlias(String alias) {
    return $UtilityBillsTable(attachedDatabase, alias);
  }
}

class UtilityBillRecord extends DataClass
    implements Insertable<UtilityBillRecord> {
  final int id;
  final int? tenantId;
  final String? tenantName;
  final int propertyId;
  final String propertyName;
  final String unitId;
  final String type;
  final DateTime periodStart;
  final DateTime periodEnd;
  final double consumption;
  final double rate;
  final double amount;
  final String meterOwnership;
  final String? meterNo;
  final double previousReading;
  final double currentReading;
  final bool chargeToTenant;
  final bool paidExternally;
  final String? proofPath;
  final String status;
  final int? paymentId;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const UtilityBillRecord({
    required this.id,
    this.tenantId,
    this.tenantName,
    required this.propertyId,
    required this.propertyName,
    required this.unitId,
    required this.type,
    required this.periodStart,
    required this.periodEnd,
    required this.consumption,
    required this.rate,
    required this.amount,
    required this.meterOwnership,
    this.meterNo,
    required this.previousReading,
    required this.currentReading,
    required this.chargeToTenant,
    required this.paidExternally,
    this.proofPath,
    required this.status,
    this.paymentId,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<int>(tenantId);
    }
    if (!nullToAbsent || tenantName != null) {
      map['tenant_name'] = Variable<String>(tenantName);
    }
    map['property_id'] = Variable<int>(propertyId);
    map['property_name'] = Variable<String>(propertyName);
    map['unit_id'] = Variable<String>(unitId);
    map['type'] = Variable<String>(type);
    map['period_start'] = Variable<DateTime>(periodStart);
    map['period_end'] = Variable<DateTime>(periodEnd);
    map['consumption'] = Variable<double>(consumption);
    map['rate'] = Variable<double>(rate);
    map['amount'] = Variable<double>(amount);
    map['meter_ownership'] = Variable<String>(meterOwnership);
    if (!nullToAbsent || meterNo != null) {
      map['meter_no'] = Variable<String>(meterNo);
    }
    map['previous_reading'] = Variable<double>(previousReading);
    map['current_reading'] = Variable<double>(currentReading);
    map['charge_to_tenant'] = Variable<bool>(chargeToTenant);
    map['paid_externally'] = Variable<bool>(paidExternally);
    if (!nullToAbsent || proofPath != null) {
      map['proof_path'] = Variable<String>(proofPath);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || paymentId != null) {
      map['payment_id'] = Variable<int>(paymentId);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UtilityBillsCompanion toCompanion(bool nullToAbsent) {
    return UtilityBillsCompanion(
      id: Value(id),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      tenantName: tenantName == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantName),
      propertyId: Value(propertyId),
      propertyName: Value(propertyName),
      unitId: Value(unitId),
      type: Value(type),
      periodStart: Value(periodStart),
      periodEnd: Value(periodEnd),
      consumption: Value(consumption),
      rate: Value(rate),
      amount: Value(amount),
      meterOwnership: Value(meterOwnership),
      meterNo: meterNo == null && nullToAbsent
          ? const Value.absent()
          : Value(meterNo),
      previousReading: Value(previousReading),
      currentReading: Value(currentReading),
      chargeToTenant: Value(chargeToTenant),
      paidExternally: Value(paidExternally),
      proofPath: proofPath == null && nullToAbsent
          ? const Value.absent()
          : Value(proofPath),
      status: Value(status),
      paymentId: paymentId == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentId),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory UtilityBillRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UtilityBillRecord(
      id: serializer.fromJson<int>(json['id']),
      tenantId: serializer.fromJson<int?>(json['tenantId']),
      tenantName: serializer.fromJson<String?>(json['tenantName']),
      propertyId: serializer.fromJson<int>(json['propertyId']),
      propertyName: serializer.fromJson<String>(json['propertyName']),
      unitId: serializer.fromJson<String>(json['unitId']),
      type: serializer.fromJson<String>(json['type']),
      periodStart: serializer.fromJson<DateTime>(json['periodStart']),
      periodEnd: serializer.fromJson<DateTime>(json['periodEnd']),
      consumption: serializer.fromJson<double>(json['consumption']),
      rate: serializer.fromJson<double>(json['rate']),
      amount: serializer.fromJson<double>(json['amount']),
      meterOwnership: serializer.fromJson<String>(json['meterOwnership']),
      meterNo: serializer.fromJson<String?>(json['meterNo']),
      previousReading: serializer.fromJson<double>(json['previousReading']),
      currentReading: serializer.fromJson<double>(json['currentReading']),
      chargeToTenant: serializer.fromJson<bool>(json['chargeToTenant']),
      paidExternally: serializer.fromJson<bool>(json['paidExternally']),
      proofPath: serializer.fromJson<String?>(json['proofPath']),
      status: serializer.fromJson<String>(json['status']),
      paymentId: serializer.fromJson<int?>(json['paymentId']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tenantId': serializer.toJson<int?>(tenantId),
      'tenantName': serializer.toJson<String?>(tenantName),
      'propertyId': serializer.toJson<int>(propertyId),
      'propertyName': serializer.toJson<String>(propertyName),
      'unitId': serializer.toJson<String>(unitId),
      'type': serializer.toJson<String>(type),
      'periodStart': serializer.toJson<DateTime>(periodStart),
      'periodEnd': serializer.toJson<DateTime>(periodEnd),
      'consumption': serializer.toJson<double>(consumption),
      'rate': serializer.toJson<double>(rate),
      'amount': serializer.toJson<double>(amount),
      'meterOwnership': serializer.toJson<String>(meterOwnership),
      'meterNo': serializer.toJson<String?>(meterNo),
      'previousReading': serializer.toJson<double>(previousReading),
      'currentReading': serializer.toJson<double>(currentReading),
      'chargeToTenant': serializer.toJson<bool>(chargeToTenant),
      'paidExternally': serializer.toJson<bool>(paidExternally),
      'proofPath': serializer.toJson<String?>(proofPath),
      'status': serializer.toJson<String>(status),
      'paymentId': serializer.toJson<int?>(paymentId),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UtilityBillRecord copyWith({
    int? id,
    Value<int?> tenantId = const Value.absent(),
    Value<String?> tenantName = const Value.absent(),
    int? propertyId,
    String? propertyName,
    String? unitId,
    String? type,
    DateTime? periodStart,
    DateTime? periodEnd,
    double? consumption,
    double? rate,
    double? amount,
    String? meterOwnership,
    Value<String?> meterNo = const Value.absent(),
    double? previousReading,
    double? currentReading,
    bool? chargeToTenant,
    bool? paidExternally,
    Value<String?> proofPath = const Value.absent(),
    String? status,
    Value<int?> paymentId = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => UtilityBillRecord(
    id: id ?? this.id,
    tenantId: tenantId.present ? tenantId.value : this.tenantId,
    tenantName: tenantName.present ? tenantName.value : this.tenantName,
    propertyId: propertyId ?? this.propertyId,
    propertyName: propertyName ?? this.propertyName,
    unitId: unitId ?? this.unitId,
    type: type ?? this.type,
    periodStart: periodStart ?? this.periodStart,
    periodEnd: periodEnd ?? this.periodEnd,
    consumption: consumption ?? this.consumption,
    rate: rate ?? this.rate,
    amount: amount ?? this.amount,
    meterOwnership: meterOwnership ?? this.meterOwnership,
    meterNo: meterNo.present ? meterNo.value : this.meterNo,
    previousReading: previousReading ?? this.previousReading,
    currentReading: currentReading ?? this.currentReading,
    chargeToTenant: chargeToTenant ?? this.chargeToTenant,
    paidExternally: paidExternally ?? this.paidExternally,
    proofPath: proofPath.present ? proofPath.value : this.proofPath,
    status: status ?? this.status,
    paymentId: paymentId.present ? paymentId.value : this.paymentId,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  UtilityBillRecord copyWithCompanion(UtilityBillsCompanion data) {
    return UtilityBillRecord(
      id: data.id.present ? data.id.value : this.id,
      tenantId: data.tenantId.present ? data.tenantId.value : this.tenantId,
      tenantName: data.tenantName.present
          ? data.tenantName.value
          : this.tenantName,
      propertyId: data.propertyId.present
          ? data.propertyId.value
          : this.propertyId,
      propertyName: data.propertyName.present
          ? data.propertyName.value
          : this.propertyName,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      type: data.type.present ? data.type.value : this.type,
      periodStart: data.periodStart.present
          ? data.periodStart.value
          : this.periodStart,
      periodEnd: data.periodEnd.present ? data.periodEnd.value : this.periodEnd,
      consumption: data.consumption.present
          ? data.consumption.value
          : this.consumption,
      rate: data.rate.present ? data.rate.value : this.rate,
      amount: data.amount.present ? data.amount.value : this.amount,
      meterOwnership: data.meterOwnership.present
          ? data.meterOwnership.value
          : this.meterOwnership,
      meterNo: data.meterNo.present ? data.meterNo.value : this.meterNo,
      previousReading: data.previousReading.present
          ? data.previousReading.value
          : this.previousReading,
      currentReading: data.currentReading.present
          ? data.currentReading.value
          : this.currentReading,
      chargeToTenant: data.chargeToTenant.present
          ? data.chargeToTenant.value
          : this.chargeToTenant,
      paidExternally: data.paidExternally.present
          ? data.paidExternally.value
          : this.paidExternally,
      proofPath: data.proofPath.present ? data.proofPath.value : this.proofPath,
      status: data.status.present ? data.status.value : this.status,
      paymentId: data.paymentId.present ? data.paymentId.value : this.paymentId,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UtilityBillRecord(')
          ..write('id: $id, ')
          ..write('tenantId: $tenantId, ')
          ..write('tenantName: $tenantName, ')
          ..write('propertyId: $propertyId, ')
          ..write('propertyName: $propertyName, ')
          ..write('unitId: $unitId, ')
          ..write('type: $type, ')
          ..write('periodStart: $periodStart, ')
          ..write('periodEnd: $periodEnd, ')
          ..write('consumption: $consumption, ')
          ..write('rate: $rate, ')
          ..write('amount: $amount, ')
          ..write('meterOwnership: $meterOwnership, ')
          ..write('meterNo: $meterNo, ')
          ..write('previousReading: $previousReading, ')
          ..write('currentReading: $currentReading, ')
          ..write('chargeToTenant: $chargeToTenant, ')
          ..write('paidExternally: $paidExternally, ')
          ..write('proofPath: $proofPath, ')
          ..write('status: $status, ')
          ..write('paymentId: $paymentId, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    tenantId,
    tenantName,
    propertyId,
    propertyName,
    unitId,
    type,
    periodStart,
    periodEnd,
    consumption,
    rate,
    amount,
    meterOwnership,
    meterNo,
    previousReading,
    currentReading,
    chargeToTenant,
    paidExternally,
    proofPath,
    status,
    paymentId,
    notes,
    createdAt,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UtilityBillRecord &&
          other.id == this.id &&
          other.tenantId == this.tenantId &&
          other.tenantName == this.tenantName &&
          other.propertyId == this.propertyId &&
          other.propertyName == this.propertyName &&
          other.unitId == this.unitId &&
          other.type == this.type &&
          other.periodStart == this.periodStart &&
          other.periodEnd == this.periodEnd &&
          other.consumption == this.consumption &&
          other.rate == this.rate &&
          other.amount == this.amount &&
          other.meterOwnership == this.meterOwnership &&
          other.meterNo == this.meterNo &&
          other.previousReading == this.previousReading &&
          other.currentReading == this.currentReading &&
          other.chargeToTenant == this.chargeToTenant &&
          other.paidExternally == this.paidExternally &&
          other.proofPath == this.proofPath &&
          other.status == this.status &&
          other.paymentId == this.paymentId &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UtilityBillsCompanion extends UpdateCompanion<UtilityBillRecord> {
  final Value<int> id;
  final Value<int?> tenantId;
  final Value<String?> tenantName;
  final Value<int> propertyId;
  final Value<String> propertyName;
  final Value<String> unitId;
  final Value<String> type;
  final Value<DateTime> periodStart;
  final Value<DateTime> periodEnd;
  final Value<double> consumption;
  final Value<double> rate;
  final Value<double> amount;
  final Value<String> meterOwnership;
  final Value<String?> meterNo;
  final Value<double> previousReading;
  final Value<double> currentReading;
  final Value<bool> chargeToTenant;
  final Value<bool> paidExternally;
  final Value<String?> proofPath;
  final Value<String> status;
  final Value<int?> paymentId;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const UtilityBillsCompanion({
    this.id = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.tenantName = const Value.absent(),
    this.propertyId = const Value.absent(),
    this.propertyName = const Value.absent(),
    this.unitId = const Value.absent(),
    this.type = const Value.absent(),
    this.periodStart = const Value.absent(),
    this.periodEnd = const Value.absent(),
    this.consumption = const Value.absent(),
    this.rate = const Value.absent(),
    this.amount = const Value.absent(),
    this.meterOwnership = const Value.absent(),
    this.meterNo = const Value.absent(),
    this.previousReading = const Value.absent(),
    this.currentReading = const Value.absent(),
    this.chargeToTenant = const Value.absent(),
    this.paidExternally = const Value.absent(),
    this.proofPath = const Value.absent(),
    this.status = const Value.absent(),
    this.paymentId = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UtilityBillsCompanion.insert({
    this.id = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.tenantName = const Value.absent(),
    required int propertyId,
    required String propertyName,
    required String unitId,
    required String type,
    required DateTime periodStart,
    required DateTime periodEnd,
    this.consumption = const Value.absent(),
    this.rate = const Value.absent(),
    this.amount = const Value.absent(),
    this.meterOwnership = const Value.absent(),
    this.meterNo = const Value.absent(),
    this.previousReading = const Value.absent(),
    this.currentReading = const Value.absent(),
    this.chargeToTenant = const Value.absent(),
    this.paidExternally = const Value.absent(),
    this.proofPath = const Value.absent(),
    this.status = const Value.absent(),
    this.paymentId = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : propertyId = Value(propertyId),
       propertyName = Value(propertyName),
       unitId = Value(unitId),
       type = Value(type),
       periodStart = Value(periodStart),
       periodEnd = Value(periodEnd);
  static Insertable<UtilityBillRecord> custom({
    Expression<int>? id,
    Expression<int>? tenantId,
    Expression<String>? tenantName,
    Expression<int>? propertyId,
    Expression<String>? propertyName,
    Expression<String>? unitId,
    Expression<String>? type,
    Expression<DateTime>? periodStart,
    Expression<DateTime>? periodEnd,
    Expression<double>? consumption,
    Expression<double>? rate,
    Expression<double>? amount,
    Expression<String>? meterOwnership,
    Expression<String>? meterNo,
    Expression<double>? previousReading,
    Expression<double>? currentReading,
    Expression<bool>? chargeToTenant,
    Expression<bool>? paidExternally,
    Expression<String>? proofPath,
    Expression<String>? status,
    Expression<int>? paymentId,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tenantId != null) 'tenant_id': tenantId,
      if (tenantName != null) 'tenant_name': tenantName,
      if (propertyId != null) 'property_id': propertyId,
      if (propertyName != null) 'property_name': propertyName,
      if (unitId != null) 'unit_id': unitId,
      if (type != null) 'type': type,
      if (periodStart != null) 'period_start': periodStart,
      if (periodEnd != null) 'period_end': periodEnd,
      if (consumption != null) 'consumption': consumption,
      if (rate != null) 'rate': rate,
      if (amount != null) 'amount': amount,
      if (meterOwnership != null) 'meter_ownership': meterOwnership,
      if (meterNo != null) 'meter_no': meterNo,
      if (previousReading != null) 'previous_reading': previousReading,
      if (currentReading != null) 'current_reading': currentReading,
      if (chargeToTenant != null) 'charge_to_tenant': chargeToTenant,
      if (paidExternally != null) 'paid_externally': paidExternally,
      if (proofPath != null) 'proof_path': proofPath,
      if (status != null) 'status': status,
      if (paymentId != null) 'payment_id': paymentId,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UtilityBillsCompanion copyWith({
    Value<int>? id,
    Value<int?>? tenantId,
    Value<String?>? tenantName,
    Value<int>? propertyId,
    Value<String>? propertyName,
    Value<String>? unitId,
    Value<String>? type,
    Value<DateTime>? periodStart,
    Value<DateTime>? periodEnd,
    Value<double>? consumption,
    Value<double>? rate,
    Value<double>? amount,
    Value<String>? meterOwnership,
    Value<String?>? meterNo,
    Value<double>? previousReading,
    Value<double>? currentReading,
    Value<bool>? chargeToTenant,
    Value<bool>? paidExternally,
    Value<String?>? proofPath,
    Value<String>? status,
    Value<int?>? paymentId,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return UtilityBillsCompanion(
      id: id ?? this.id,
      tenantId: tenantId ?? this.tenantId,
      tenantName: tenantName ?? this.tenantName,
      propertyId: propertyId ?? this.propertyId,
      propertyName: propertyName ?? this.propertyName,
      unitId: unitId ?? this.unitId,
      type: type ?? this.type,
      periodStart: periodStart ?? this.periodStart,
      periodEnd: periodEnd ?? this.periodEnd,
      consumption: consumption ?? this.consumption,
      rate: rate ?? this.rate,
      amount: amount ?? this.amount,
      meterOwnership: meterOwnership ?? this.meterOwnership,
      meterNo: meterNo ?? this.meterNo,
      previousReading: previousReading ?? this.previousReading,
      currentReading: currentReading ?? this.currentReading,
      chargeToTenant: chargeToTenant ?? this.chargeToTenant,
      paidExternally: paidExternally ?? this.paidExternally,
      proofPath: proofPath ?? this.proofPath,
      status: status ?? this.status,
      paymentId: paymentId ?? this.paymentId,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    if (tenantName.present) {
      map['tenant_name'] = Variable<String>(tenantName.value);
    }
    if (propertyId.present) {
      map['property_id'] = Variable<int>(propertyId.value);
    }
    if (propertyName.present) {
      map['property_name'] = Variable<String>(propertyName.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<String>(unitId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (periodStart.present) {
      map['period_start'] = Variable<DateTime>(periodStart.value);
    }
    if (periodEnd.present) {
      map['period_end'] = Variable<DateTime>(periodEnd.value);
    }
    if (consumption.present) {
      map['consumption'] = Variable<double>(consumption.value);
    }
    if (rate.present) {
      map['rate'] = Variable<double>(rate.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (meterOwnership.present) {
      map['meter_ownership'] = Variable<String>(meterOwnership.value);
    }
    if (meterNo.present) {
      map['meter_no'] = Variable<String>(meterNo.value);
    }
    if (previousReading.present) {
      map['previous_reading'] = Variable<double>(previousReading.value);
    }
    if (currentReading.present) {
      map['current_reading'] = Variable<double>(currentReading.value);
    }
    if (chargeToTenant.present) {
      map['charge_to_tenant'] = Variable<bool>(chargeToTenant.value);
    }
    if (paidExternally.present) {
      map['paid_externally'] = Variable<bool>(paidExternally.value);
    }
    if (proofPath.present) {
      map['proof_path'] = Variable<String>(proofPath.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (paymentId.present) {
      map['payment_id'] = Variable<int>(paymentId.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UtilityBillsCompanion(')
          ..write('id: $id, ')
          ..write('tenantId: $tenantId, ')
          ..write('tenantName: $tenantName, ')
          ..write('propertyId: $propertyId, ')
          ..write('propertyName: $propertyName, ')
          ..write('unitId: $unitId, ')
          ..write('type: $type, ')
          ..write('periodStart: $periodStart, ')
          ..write('periodEnd: $periodEnd, ')
          ..write('consumption: $consumption, ')
          ..write('rate: $rate, ')
          ..write('amount: $amount, ')
          ..write('meterOwnership: $meterOwnership, ')
          ..write('meterNo: $meterNo, ')
          ..write('previousReading: $previousReading, ')
          ..write('currentReading: $currentReading, ')
          ..write('chargeToTenant: $chargeToTenant, ')
          ..write('paidExternally: $paidExternally, ')
          ..write('proofPath: $proofPath, ')
          ..write('status: $status, ')
          ..write('paymentId: $paymentId, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $UnitsTable extends Units with TableInfo<$UnitsTable, UnitRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _propertyIdMeta = const VerificationMeta(
    'propertyId',
  );
  @override
  late final GeneratedColumn<int> propertyId = GeneratedColumn<int>(
    'property_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES properties (id)',
    ),
  );
  static const VerificationMeta _propertyNameMeta = const VerificationMeta(
    'propertyName',
  );
  @override
  late final GeneratedColumn<String> propertyName = GeneratedColumn<String>(
    'property_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitNoMeta = const VerificationMeta('unitNo');
  @override
  late final GeneratedColumn<String> unitNo = GeneratedColumn<String>(
    'unit_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _floorMeta = const VerificationMeta('floor');
  @override
  late final GeneratedColumn<String> floor = GeneratedColumn<String>(
    'floor',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('apartment'),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('vacant'),
  );
  static const VerificationMeta _expectedRentMeta = const VerificationMeta(
    'expectedRent',
  );
  @override
  late final GeneratedColumn<double> expectedRent = GeneratedColumn<double>(
    'expected_rent',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _electricityServiceModeMeta =
      const VerificationMeta('electricityServiceMode');
  @override
  late final GeneratedColumn<String> electricityServiceMode =
      GeneratedColumn<String>(
        'electricity_service_mode',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('inherit'),
      );
  static const VerificationMeta _electricityMeterNoMeta =
      const VerificationMeta('electricityMeterNo');
  @override
  late final GeneratedColumn<String> electricityMeterNo =
      GeneratedColumn<String>(
        'electricity_meter_no',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _waterServiceModeMeta = const VerificationMeta(
    'waterServiceMode',
  );
  @override
  late final GeneratedColumn<String> waterServiceMode = GeneratedColumn<String>(
    'water_service_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('inherit'),
  );
  static const VerificationMeta _waterMeterNoMeta = const VerificationMeta(
    'waterMeterNo',
  );
  @override
  late final GeneratedColumn<String> waterMeterNo = GeneratedColumn<String>(
    'water_meter_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gasServiceModeMeta = const VerificationMeta(
    'gasServiceMode',
  );
  @override
  late final GeneratedColumn<String> gasServiceMode = GeneratedColumn<String>(
    'gas_service_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('inherit'),
  );
  static const VerificationMeta _gasMeterNoMeta = const VerificationMeta(
    'gasMeterNo',
  );
  @override
  late final GeneratedColumn<String> gasMeterNo = GeneratedColumn<String>(
    'gas_meter_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tenantIdMeta = const VerificationMeta(
    'tenantId',
  );
  @override
  late final GeneratedColumn<int> tenantId = GeneratedColumn<int>(
    'tenant_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tenants (id)',
    ),
  );
  static const VerificationMeta _tenantNameMeta = const VerificationMeta(
    'tenantName',
  );
  @override
  late final GeneratedColumn<String> tenantName = GeneratedColumn<String>(
    'tenant_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    propertyId,
    propertyName,
    unitNo,
    floor,
    type,
    status,
    expectedRent,
    electricityServiceMode,
    electricityMeterNo,
    waterServiceMode,
    waterMeterNo,
    gasServiceMode,
    gasMeterNo,
    tenantId,
    tenantName,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'units';
  @override
  VerificationContext validateIntegrity(
    Insertable<UnitRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('property_id')) {
      context.handle(
        _propertyIdMeta,
        propertyId.isAcceptableOrUnknown(data['property_id']!, _propertyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_propertyIdMeta);
    }
    if (data.containsKey('property_name')) {
      context.handle(
        _propertyNameMeta,
        propertyName.isAcceptableOrUnknown(
          data['property_name']!,
          _propertyNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_propertyNameMeta);
    }
    if (data.containsKey('unit_no')) {
      context.handle(
        _unitNoMeta,
        unitNo.isAcceptableOrUnknown(data['unit_no']!, _unitNoMeta),
      );
    } else if (isInserting) {
      context.missing(_unitNoMeta);
    }
    if (data.containsKey('floor')) {
      context.handle(
        _floorMeta,
        floor.isAcceptableOrUnknown(data['floor']!, _floorMeta),
      );
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('expected_rent')) {
      context.handle(
        _expectedRentMeta,
        expectedRent.isAcceptableOrUnknown(
          data['expected_rent']!,
          _expectedRentMeta,
        ),
      );
    }
    if (data.containsKey('electricity_service_mode')) {
      context.handle(
        _electricityServiceModeMeta,
        electricityServiceMode.isAcceptableOrUnknown(
          data['electricity_service_mode']!,
          _electricityServiceModeMeta,
        ),
      );
    }
    if (data.containsKey('electricity_meter_no')) {
      context.handle(
        _electricityMeterNoMeta,
        electricityMeterNo.isAcceptableOrUnknown(
          data['electricity_meter_no']!,
          _electricityMeterNoMeta,
        ),
      );
    }
    if (data.containsKey('water_service_mode')) {
      context.handle(
        _waterServiceModeMeta,
        waterServiceMode.isAcceptableOrUnknown(
          data['water_service_mode']!,
          _waterServiceModeMeta,
        ),
      );
    }
    if (data.containsKey('water_meter_no')) {
      context.handle(
        _waterMeterNoMeta,
        waterMeterNo.isAcceptableOrUnknown(
          data['water_meter_no']!,
          _waterMeterNoMeta,
        ),
      );
    }
    if (data.containsKey('gas_service_mode')) {
      context.handle(
        _gasServiceModeMeta,
        gasServiceMode.isAcceptableOrUnknown(
          data['gas_service_mode']!,
          _gasServiceModeMeta,
        ),
      );
    }
    if (data.containsKey('gas_meter_no')) {
      context.handle(
        _gasMeterNoMeta,
        gasMeterNo.isAcceptableOrUnknown(
          data['gas_meter_no']!,
          _gasMeterNoMeta,
        ),
      );
    }
    if (data.containsKey('tenant_id')) {
      context.handle(
        _tenantIdMeta,
        tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta),
      );
    }
    if (data.containsKey('tenant_name')) {
      context.handle(
        _tenantNameMeta,
        tenantName.isAcceptableOrUnknown(data['tenant_name']!, _tenantNameMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UnitRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnitRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      propertyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}property_id'],
      )!,
      propertyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}property_name'],
      )!,
      unitNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_no'],
      )!,
      floor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}floor'],
      ),
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      expectedRent: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}expected_rent'],
      )!,
      electricityServiceMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}electricity_service_mode'],
      )!,
      electricityMeterNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}electricity_meter_no'],
      ),
      waterServiceMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}water_service_mode'],
      )!,
      waterMeterNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}water_meter_no'],
      ),
      gasServiceMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gas_service_mode'],
      )!,
      gasMeterNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gas_meter_no'],
      ),
      tenantId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tenant_id'],
      ),
      tenantName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_name'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UnitsTable createAlias(String alias) {
    return $UnitsTable(attachedDatabase, alias);
  }
}

class UnitRecord extends DataClass implements Insertable<UnitRecord> {
  final int id;
  final int propertyId;
  final String propertyName;
  final String unitNo;
  final String? floor;
  final String type;
  final String status;
  final double expectedRent;
  final String electricityServiceMode;
  final String? electricityMeterNo;
  final String waterServiceMode;
  final String? waterMeterNo;
  final String gasServiceMode;
  final String? gasMeterNo;
  final int? tenantId;
  final String? tenantName;
  final DateTime createdAt;
  final DateTime updatedAt;
  const UnitRecord({
    required this.id,
    required this.propertyId,
    required this.propertyName,
    required this.unitNo,
    this.floor,
    required this.type,
    required this.status,
    required this.expectedRent,
    required this.electricityServiceMode,
    this.electricityMeterNo,
    required this.waterServiceMode,
    this.waterMeterNo,
    required this.gasServiceMode,
    this.gasMeterNo,
    this.tenantId,
    this.tenantName,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['property_id'] = Variable<int>(propertyId);
    map['property_name'] = Variable<String>(propertyName);
    map['unit_no'] = Variable<String>(unitNo);
    if (!nullToAbsent || floor != null) {
      map['floor'] = Variable<String>(floor);
    }
    map['type'] = Variable<String>(type);
    map['status'] = Variable<String>(status);
    map['expected_rent'] = Variable<double>(expectedRent);
    map['electricity_service_mode'] = Variable<String>(electricityServiceMode);
    if (!nullToAbsent || electricityMeterNo != null) {
      map['electricity_meter_no'] = Variable<String>(electricityMeterNo);
    }
    map['water_service_mode'] = Variable<String>(waterServiceMode);
    if (!nullToAbsent || waterMeterNo != null) {
      map['water_meter_no'] = Variable<String>(waterMeterNo);
    }
    map['gas_service_mode'] = Variable<String>(gasServiceMode);
    if (!nullToAbsent || gasMeterNo != null) {
      map['gas_meter_no'] = Variable<String>(gasMeterNo);
    }
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<int>(tenantId);
    }
    if (!nullToAbsent || tenantName != null) {
      map['tenant_name'] = Variable<String>(tenantName);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UnitsCompanion toCompanion(bool nullToAbsent) {
    return UnitsCompanion(
      id: Value(id),
      propertyId: Value(propertyId),
      propertyName: Value(propertyName),
      unitNo: Value(unitNo),
      floor: floor == null && nullToAbsent
          ? const Value.absent()
          : Value(floor),
      type: Value(type),
      status: Value(status),
      expectedRent: Value(expectedRent),
      electricityServiceMode: Value(electricityServiceMode),
      electricityMeterNo: electricityMeterNo == null && nullToAbsent
          ? const Value.absent()
          : Value(electricityMeterNo),
      waterServiceMode: Value(waterServiceMode),
      waterMeterNo: waterMeterNo == null && nullToAbsent
          ? const Value.absent()
          : Value(waterMeterNo),
      gasServiceMode: Value(gasServiceMode),
      gasMeterNo: gasMeterNo == null && nullToAbsent
          ? const Value.absent()
          : Value(gasMeterNo),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      tenantName: tenantName == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantName),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory UnitRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UnitRecord(
      id: serializer.fromJson<int>(json['id']),
      propertyId: serializer.fromJson<int>(json['propertyId']),
      propertyName: serializer.fromJson<String>(json['propertyName']),
      unitNo: serializer.fromJson<String>(json['unitNo']),
      floor: serializer.fromJson<String?>(json['floor']),
      type: serializer.fromJson<String>(json['type']),
      status: serializer.fromJson<String>(json['status']),
      expectedRent: serializer.fromJson<double>(json['expectedRent']),
      electricityServiceMode: serializer.fromJson<String>(
        json['electricityServiceMode'],
      ),
      electricityMeterNo: serializer.fromJson<String?>(
        json['electricityMeterNo'],
      ),
      waterServiceMode: serializer.fromJson<String>(json['waterServiceMode']),
      waterMeterNo: serializer.fromJson<String?>(json['waterMeterNo']),
      gasServiceMode: serializer.fromJson<String>(json['gasServiceMode']),
      gasMeterNo: serializer.fromJson<String?>(json['gasMeterNo']),
      tenantId: serializer.fromJson<int?>(json['tenantId']),
      tenantName: serializer.fromJson<String?>(json['tenantName']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'propertyId': serializer.toJson<int>(propertyId),
      'propertyName': serializer.toJson<String>(propertyName),
      'unitNo': serializer.toJson<String>(unitNo),
      'floor': serializer.toJson<String?>(floor),
      'type': serializer.toJson<String>(type),
      'status': serializer.toJson<String>(status),
      'expectedRent': serializer.toJson<double>(expectedRent),
      'electricityServiceMode': serializer.toJson<String>(
        electricityServiceMode,
      ),
      'electricityMeterNo': serializer.toJson<String?>(electricityMeterNo),
      'waterServiceMode': serializer.toJson<String>(waterServiceMode),
      'waterMeterNo': serializer.toJson<String?>(waterMeterNo),
      'gasServiceMode': serializer.toJson<String>(gasServiceMode),
      'gasMeterNo': serializer.toJson<String?>(gasMeterNo),
      'tenantId': serializer.toJson<int?>(tenantId),
      'tenantName': serializer.toJson<String?>(tenantName),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UnitRecord copyWith({
    int? id,
    int? propertyId,
    String? propertyName,
    String? unitNo,
    Value<String?> floor = const Value.absent(),
    String? type,
    String? status,
    double? expectedRent,
    String? electricityServiceMode,
    Value<String?> electricityMeterNo = const Value.absent(),
    String? waterServiceMode,
    Value<String?> waterMeterNo = const Value.absent(),
    String? gasServiceMode,
    Value<String?> gasMeterNo = const Value.absent(),
    Value<int?> tenantId = const Value.absent(),
    Value<String?> tenantName = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => UnitRecord(
    id: id ?? this.id,
    propertyId: propertyId ?? this.propertyId,
    propertyName: propertyName ?? this.propertyName,
    unitNo: unitNo ?? this.unitNo,
    floor: floor.present ? floor.value : this.floor,
    type: type ?? this.type,
    status: status ?? this.status,
    expectedRent: expectedRent ?? this.expectedRent,
    electricityServiceMode:
        electricityServiceMode ?? this.electricityServiceMode,
    electricityMeterNo: electricityMeterNo.present
        ? electricityMeterNo.value
        : this.electricityMeterNo,
    waterServiceMode: waterServiceMode ?? this.waterServiceMode,
    waterMeterNo: waterMeterNo.present ? waterMeterNo.value : this.waterMeterNo,
    gasServiceMode: gasServiceMode ?? this.gasServiceMode,
    gasMeterNo: gasMeterNo.present ? gasMeterNo.value : this.gasMeterNo,
    tenantId: tenantId.present ? tenantId.value : this.tenantId,
    tenantName: tenantName.present ? tenantName.value : this.tenantName,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  UnitRecord copyWithCompanion(UnitsCompanion data) {
    return UnitRecord(
      id: data.id.present ? data.id.value : this.id,
      propertyId: data.propertyId.present
          ? data.propertyId.value
          : this.propertyId,
      propertyName: data.propertyName.present
          ? data.propertyName.value
          : this.propertyName,
      unitNo: data.unitNo.present ? data.unitNo.value : this.unitNo,
      floor: data.floor.present ? data.floor.value : this.floor,
      type: data.type.present ? data.type.value : this.type,
      status: data.status.present ? data.status.value : this.status,
      expectedRent: data.expectedRent.present
          ? data.expectedRent.value
          : this.expectedRent,
      electricityServiceMode: data.electricityServiceMode.present
          ? data.electricityServiceMode.value
          : this.electricityServiceMode,
      electricityMeterNo: data.electricityMeterNo.present
          ? data.electricityMeterNo.value
          : this.electricityMeterNo,
      waterServiceMode: data.waterServiceMode.present
          ? data.waterServiceMode.value
          : this.waterServiceMode,
      waterMeterNo: data.waterMeterNo.present
          ? data.waterMeterNo.value
          : this.waterMeterNo,
      gasServiceMode: data.gasServiceMode.present
          ? data.gasServiceMode.value
          : this.gasServiceMode,
      gasMeterNo: data.gasMeterNo.present
          ? data.gasMeterNo.value
          : this.gasMeterNo,
      tenantId: data.tenantId.present ? data.tenantId.value : this.tenantId,
      tenantName: data.tenantName.present
          ? data.tenantName.value
          : this.tenantName,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UnitRecord(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('propertyName: $propertyName, ')
          ..write('unitNo: $unitNo, ')
          ..write('floor: $floor, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('expectedRent: $expectedRent, ')
          ..write('electricityServiceMode: $electricityServiceMode, ')
          ..write('electricityMeterNo: $electricityMeterNo, ')
          ..write('waterServiceMode: $waterServiceMode, ')
          ..write('waterMeterNo: $waterMeterNo, ')
          ..write('gasServiceMode: $gasServiceMode, ')
          ..write('gasMeterNo: $gasMeterNo, ')
          ..write('tenantId: $tenantId, ')
          ..write('tenantName: $tenantName, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    propertyId,
    propertyName,
    unitNo,
    floor,
    type,
    status,
    expectedRent,
    electricityServiceMode,
    electricityMeterNo,
    waterServiceMode,
    waterMeterNo,
    gasServiceMode,
    gasMeterNo,
    tenantId,
    tenantName,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnitRecord &&
          other.id == this.id &&
          other.propertyId == this.propertyId &&
          other.propertyName == this.propertyName &&
          other.unitNo == this.unitNo &&
          other.floor == this.floor &&
          other.type == this.type &&
          other.status == this.status &&
          other.expectedRent == this.expectedRent &&
          other.electricityServiceMode == this.electricityServiceMode &&
          other.electricityMeterNo == this.electricityMeterNo &&
          other.waterServiceMode == this.waterServiceMode &&
          other.waterMeterNo == this.waterMeterNo &&
          other.gasServiceMode == this.gasServiceMode &&
          other.gasMeterNo == this.gasMeterNo &&
          other.tenantId == this.tenantId &&
          other.tenantName == this.tenantName &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UnitsCompanion extends UpdateCompanion<UnitRecord> {
  final Value<int> id;
  final Value<int> propertyId;
  final Value<String> propertyName;
  final Value<String> unitNo;
  final Value<String?> floor;
  final Value<String> type;
  final Value<String> status;
  final Value<double> expectedRent;
  final Value<String> electricityServiceMode;
  final Value<String?> electricityMeterNo;
  final Value<String> waterServiceMode;
  final Value<String?> waterMeterNo;
  final Value<String> gasServiceMode;
  final Value<String?> gasMeterNo;
  final Value<int?> tenantId;
  final Value<String?> tenantName;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const UnitsCompanion({
    this.id = const Value.absent(),
    this.propertyId = const Value.absent(),
    this.propertyName = const Value.absent(),
    this.unitNo = const Value.absent(),
    this.floor = const Value.absent(),
    this.type = const Value.absent(),
    this.status = const Value.absent(),
    this.expectedRent = const Value.absent(),
    this.electricityServiceMode = const Value.absent(),
    this.electricityMeterNo = const Value.absent(),
    this.waterServiceMode = const Value.absent(),
    this.waterMeterNo = const Value.absent(),
    this.gasServiceMode = const Value.absent(),
    this.gasMeterNo = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.tenantName = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UnitsCompanion.insert({
    this.id = const Value.absent(),
    required int propertyId,
    required String propertyName,
    required String unitNo,
    this.floor = const Value.absent(),
    this.type = const Value.absent(),
    this.status = const Value.absent(),
    this.expectedRent = const Value.absent(),
    this.electricityServiceMode = const Value.absent(),
    this.electricityMeterNo = const Value.absent(),
    this.waterServiceMode = const Value.absent(),
    this.waterMeterNo = const Value.absent(),
    this.gasServiceMode = const Value.absent(),
    this.gasMeterNo = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.tenantName = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : propertyId = Value(propertyId),
       propertyName = Value(propertyName),
       unitNo = Value(unitNo);
  static Insertable<UnitRecord> custom({
    Expression<int>? id,
    Expression<int>? propertyId,
    Expression<String>? propertyName,
    Expression<String>? unitNo,
    Expression<String>? floor,
    Expression<String>? type,
    Expression<String>? status,
    Expression<double>? expectedRent,
    Expression<String>? electricityServiceMode,
    Expression<String>? electricityMeterNo,
    Expression<String>? waterServiceMode,
    Expression<String>? waterMeterNo,
    Expression<String>? gasServiceMode,
    Expression<String>? gasMeterNo,
    Expression<int>? tenantId,
    Expression<String>? tenantName,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (propertyId != null) 'property_id': propertyId,
      if (propertyName != null) 'property_name': propertyName,
      if (unitNo != null) 'unit_no': unitNo,
      if (floor != null) 'floor': floor,
      if (type != null) 'type': type,
      if (status != null) 'status': status,
      if (expectedRent != null) 'expected_rent': expectedRent,
      if (electricityServiceMode != null)
        'electricity_service_mode': electricityServiceMode,
      if (electricityMeterNo != null)
        'electricity_meter_no': electricityMeterNo,
      if (waterServiceMode != null) 'water_service_mode': waterServiceMode,
      if (waterMeterNo != null) 'water_meter_no': waterMeterNo,
      if (gasServiceMode != null) 'gas_service_mode': gasServiceMode,
      if (gasMeterNo != null) 'gas_meter_no': gasMeterNo,
      if (tenantId != null) 'tenant_id': tenantId,
      if (tenantName != null) 'tenant_name': tenantName,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UnitsCompanion copyWith({
    Value<int>? id,
    Value<int>? propertyId,
    Value<String>? propertyName,
    Value<String>? unitNo,
    Value<String?>? floor,
    Value<String>? type,
    Value<String>? status,
    Value<double>? expectedRent,
    Value<String>? electricityServiceMode,
    Value<String?>? electricityMeterNo,
    Value<String>? waterServiceMode,
    Value<String?>? waterMeterNo,
    Value<String>? gasServiceMode,
    Value<String?>? gasMeterNo,
    Value<int?>? tenantId,
    Value<String?>? tenantName,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return UnitsCompanion(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      propertyName: propertyName ?? this.propertyName,
      unitNo: unitNo ?? this.unitNo,
      floor: floor ?? this.floor,
      type: type ?? this.type,
      status: status ?? this.status,
      expectedRent: expectedRent ?? this.expectedRent,
      electricityServiceMode:
          electricityServiceMode ?? this.electricityServiceMode,
      electricityMeterNo: electricityMeterNo ?? this.electricityMeterNo,
      waterServiceMode: waterServiceMode ?? this.waterServiceMode,
      waterMeterNo: waterMeterNo ?? this.waterMeterNo,
      gasServiceMode: gasServiceMode ?? this.gasServiceMode,
      gasMeterNo: gasMeterNo ?? this.gasMeterNo,
      tenantId: tenantId ?? this.tenantId,
      tenantName: tenantName ?? this.tenantName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (propertyId.present) {
      map['property_id'] = Variable<int>(propertyId.value);
    }
    if (propertyName.present) {
      map['property_name'] = Variable<String>(propertyName.value);
    }
    if (unitNo.present) {
      map['unit_no'] = Variable<String>(unitNo.value);
    }
    if (floor.present) {
      map['floor'] = Variable<String>(floor.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (expectedRent.present) {
      map['expected_rent'] = Variable<double>(expectedRent.value);
    }
    if (electricityServiceMode.present) {
      map['electricity_service_mode'] = Variable<String>(
        electricityServiceMode.value,
      );
    }
    if (electricityMeterNo.present) {
      map['electricity_meter_no'] = Variable<String>(electricityMeterNo.value);
    }
    if (waterServiceMode.present) {
      map['water_service_mode'] = Variable<String>(waterServiceMode.value);
    }
    if (waterMeterNo.present) {
      map['water_meter_no'] = Variable<String>(waterMeterNo.value);
    }
    if (gasServiceMode.present) {
      map['gas_service_mode'] = Variable<String>(gasServiceMode.value);
    }
    if (gasMeterNo.present) {
      map['gas_meter_no'] = Variable<String>(gasMeterNo.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    if (tenantName.present) {
      map['tenant_name'] = Variable<String>(tenantName.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitsCompanion(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('propertyName: $propertyName, ')
          ..write('unitNo: $unitNo, ')
          ..write('floor: $floor, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('expectedRent: $expectedRent, ')
          ..write('electricityServiceMode: $electricityServiceMode, ')
          ..write('electricityMeterNo: $electricityMeterNo, ')
          ..write('waterServiceMode: $waterServiceMode, ')
          ..write('waterMeterNo: $waterMeterNo, ')
          ..write('gasServiceMode: $gasServiceMode, ')
          ..write('gasMeterNo: $gasMeterNo, ')
          ..write('tenantId: $tenantId, ')
          ..write('tenantName: $tenantName, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $RentSchedulesTable extends RentSchedules
    with TableInfo<$RentSchedulesTable, RentScheduleRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RentSchedulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _contractIdMeta = const VerificationMeta(
    'contractId',
  );
  @override
  late final GeneratedColumn<int> contractId = GeneratedColumn<int>(
    'contract_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES contracts (id)',
    ),
  );
  static const VerificationMeta _tenantIdMeta = const VerificationMeta(
    'tenantId',
  );
  @override
  late final GeneratedColumn<int> tenantId = GeneratedColumn<int>(
    'tenant_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tenants (id)',
    ),
  );
  static const VerificationMeta _propertyIdMeta = const VerificationMeta(
    'propertyId',
  );
  @override
  late final GeneratedColumn<int> propertyId = GeneratedColumn<int>(
    'property_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES properties (id)',
    ),
  );
  static const VerificationMeta _tenantNameMeta = const VerificationMeta(
    'tenantName',
  );
  @override
  late final GeneratedColumn<String> tenantName = GeneratedColumn<String>(
    'tenant_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _propertyNameMeta = const VerificationMeta(
    'propertyName',
  );
  @override
  late final GeneratedColumn<String> propertyName = GeneratedColumn<String>(
    'property_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<String> unitId = GeneratedColumn<String>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paidAmountMeta = const VerificationMeta(
    'paidAmount',
  );
  @override
  late final GeneratedColumn<double> paidAmount = GeneratedColumn<double>(
    'paid_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('YER'),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('due'),
  );
  static const VerificationMeta _paymentIdMeta = const VerificationMeta(
    'paymentId',
  );
  @override
  late final GeneratedColumn<int> paymentId = GeneratedColumn<int>(
    'payment_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES payments (id)',
    ),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    contractId,
    tenantId,
    propertyId,
    tenantName,
    propertyName,
    unitId,
    dueDate,
    amount,
    paidAmount,
    currency,
    status,
    paymentId,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rent_schedules';
  @override
  VerificationContext validateIntegrity(
    Insertable<RentScheduleRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('contract_id')) {
      context.handle(
        _contractIdMeta,
        contractId.isAcceptableOrUnknown(data['contract_id']!, _contractIdMeta),
      );
    } else if (isInserting) {
      context.missing(_contractIdMeta);
    }
    if (data.containsKey('tenant_id')) {
      context.handle(
        _tenantIdMeta,
        tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tenantIdMeta);
    }
    if (data.containsKey('property_id')) {
      context.handle(
        _propertyIdMeta,
        propertyId.isAcceptableOrUnknown(data['property_id']!, _propertyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_propertyIdMeta);
    }
    if (data.containsKey('tenant_name')) {
      context.handle(
        _tenantNameMeta,
        tenantName.isAcceptableOrUnknown(data['tenant_name']!, _tenantNameMeta),
      );
    } else if (isInserting) {
      context.missing(_tenantNameMeta);
    }
    if (data.containsKey('property_name')) {
      context.handle(
        _propertyNameMeta,
        propertyName.isAcceptableOrUnknown(
          data['property_name']!,
          _propertyNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_propertyNameMeta);
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_unitIdMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    } else if (isInserting) {
      context.missing(_dueDateMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('paid_amount')) {
      context.handle(
        _paidAmountMeta,
        paidAmount.isAcceptableOrUnknown(data['paid_amount']!, _paidAmountMeta),
      );
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('payment_id')) {
      context.handle(
        _paymentIdMeta,
        paymentId.isAcceptableOrUnknown(data['payment_id']!, _paymentIdMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RentScheduleRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RentScheduleRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      contractId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}contract_id'],
      )!,
      tenantId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tenant_id'],
      )!,
      propertyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}property_id'],
      )!,
      tenantName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_name'],
      )!,
      propertyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}property_name'],
      )!,
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_id'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      paidAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}paid_amount'],
      )!,
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      paymentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}payment_id'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $RentSchedulesTable createAlias(String alias) {
    return $RentSchedulesTable(attachedDatabase, alias);
  }
}

class RentScheduleRecord extends DataClass
    implements Insertable<RentScheduleRecord> {
  final int id;
  final int contractId;
  final int tenantId;
  final int propertyId;
  final String tenantName;
  final String propertyName;
  final String unitId;
  final DateTime dueDate;
  final double amount;
  final double paidAmount;
  final String currency;
  final String status;
  final int? paymentId;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const RentScheduleRecord({
    required this.id,
    required this.contractId,
    required this.tenantId,
    required this.propertyId,
    required this.tenantName,
    required this.propertyName,
    required this.unitId,
    required this.dueDate,
    required this.amount,
    required this.paidAmount,
    required this.currency,
    required this.status,
    this.paymentId,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['contract_id'] = Variable<int>(contractId);
    map['tenant_id'] = Variable<int>(tenantId);
    map['property_id'] = Variable<int>(propertyId);
    map['tenant_name'] = Variable<String>(tenantName);
    map['property_name'] = Variable<String>(propertyName);
    map['unit_id'] = Variable<String>(unitId);
    map['due_date'] = Variable<DateTime>(dueDate);
    map['amount'] = Variable<double>(amount);
    map['paid_amount'] = Variable<double>(paidAmount);
    map['currency'] = Variable<String>(currency);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || paymentId != null) {
      map['payment_id'] = Variable<int>(paymentId);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  RentSchedulesCompanion toCompanion(bool nullToAbsent) {
    return RentSchedulesCompanion(
      id: Value(id),
      contractId: Value(contractId),
      tenantId: Value(tenantId),
      propertyId: Value(propertyId),
      tenantName: Value(tenantName),
      propertyName: Value(propertyName),
      unitId: Value(unitId),
      dueDate: Value(dueDate),
      amount: Value(amount),
      paidAmount: Value(paidAmount),
      currency: Value(currency),
      status: Value(status),
      paymentId: paymentId == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentId),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory RentScheduleRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RentScheduleRecord(
      id: serializer.fromJson<int>(json['id']),
      contractId: serializer.fromJson<int>(json['contractId']),
      tenantId: serializer.fromJson<int>(json['tenantId']),
      propertyId: serializer.fromJson<int>(json['propertyId']),
      tenantName: serializer.fromJson<String>(json['tenantName']),
      propertyName: serializer.fromJson<String>(json['propertyName']),
      unitId: serializer.fromJson<String>(json['unitId']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
      amount: serializer.fromJson<double>(json['amount']),
      paidAmount: serializer.fromJson<double>(json['paidAmount']),
      currency: serializer.fromJson<String>(json['currency']),
      status: serializer.fromJson<String>(json['status']),
      paymentId: serializer.fromJson<int?>(json['paymentId']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'contractId': serializer.toJson<int>(contractId),
      'tenantId': serializer.toJson<int>(tenantId),
      'propertyId': serializer.toJson<int>(propertyId),
      'tenantName': serializer.toJson<String>(tenantName),
      'propertyName': serializer.toJson<String>(propertyName),
      'unitId': serializer.toJson<String>(unitId),
      'dueDate': serializer.toJson<DateTime>(dueDate),
      'amount': serializer.toJson<double>(amount),
      'paidAmount': serializer.toJson<double>(paidAmount),
      'currency': serializer.toJson<String>(currency),
      'status': serializer.toJson<String>(status),
      'paymentId': serializer.toJson<int?>(paymentId),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  RentScheduleRecord copyWith({
    int? id,
    int? contractId,
    int? tenantId,
    int? propertyId,
    String? tenantName,
    String? propertyName,
    String? unitId,
    DateTime? dueDate,
    double? amount,
    double? paidAmount,
    String? currency,
    String? status,
    Value<int?> paymentId = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => RentScheduleRecord(
    id: id ?? this.id,
    contractId: contractId ?? this.contractId,
    tenantId: tenantId ?? this.tenantId,
    propertyId: propertyId ?? this.propertyId,
    tenantName: tenantName ?? this.tenantName,
    propertyName: propertyName ?? this.propertyName,
    unitId: unitId ?? this.unitId,
    dueDate: dueDate ?? this.dueDate,
    amount: amount ?? this.amount,
    paidAmount: paidAmount ?? this.paidAmount,
    currency: currency ?? this.currency,
    status: status ?? this.status,
    paymentId: paymentId.present ? paymentId.value : this.paymentId,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  RentScheduleRecord copyWithCompanion(RentSchedulesCompanion data) {
    return RentScheduleRecord(
      id: data.id.present ? data.id.value : this.id,
      contractId: data.contractId.present
          ? data.contractId.value
          : this.contractId,
      tenantId: data.tenantId.present ? data.tenantId.value : this.tenantId,
      propertyId: data.propertyId.present
          ? data.propertyId.value
          : this.propertyId,
      tenantName: data.tenantName.present
          ? data.tenantName.value
          : this.tenantName,
      propertyName: data.propertyName.present
          ? data.propertyName.value
          : this.propertyName,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      amount: data.amount.present ? data.amount.value : this.amount,
      paidAmount: data.paidAmount.present
          ? data.paidAmount.value
          : this.paidAmount,
      currency: data.currency.present ? data.currency.value : this.currency,
      status: data.status.present ? data.status.value : this.status,
      paymentId: data.paymentId.present ? data.paymentId.value : this.paymentId,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RentScheduleRecord(')
          ..write('id: $id, ')
          ..write('contractId: $contractId, ')
          ..write('tenantId: $tenantId, ')
          ..write('propertyId: $propertyId, ')
          ..write('tenantName: $tenantName, ')
          ..write('propertyName: $propertyName, ')
          ..write('unitId: $unitId, ')
          ..write('dueDate: $dueDate, ')
          ..write('amount: $amount, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('currency: $currency, ')
          ..write('status: $status, ')
          ..write('paymentId: $paymentId, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    contractId,
    tenantId,
    propertyId,
    tenantName,
    propertyName,
    unitId,
    dueDate,
    amount,
    paidAmount,
    currency,
    status,
    paymentId,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RentScheduleRecord &&
          other.id == this.id &&
          other.contractId == this.contractId &&
          other.tenantId == this.tenantId &&
          other.propertyId == this.propertyId &&
          other.tenantName == this.tenantName &&
          other.propertyName == this.propertyName &&
          other.unitId == this.unitId &&
          other.dueDate == this.dueDate &&
          other.amount == this.amount &&
          other.paidAmount == this.paidAmount &&
          other.currency == this.currency &&
          other.status == this.status &&
          other.paymentId == this.paymentId &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RentSchedulesCompanion extends UpdateCompanion<RentScheduleRecord> {
  final Value<int> id;
  final Value<int> contractId;
  final Value<int> tenantId;
  final Value<int> propertyId;
  final Value<String> tenantName;
  final Value<String> propertyName;
  final Value<String> unitId;
  final Value<DateTime> dueDate;
  final Value<double> amount;
  final Value<double> paidAmount;
  final Value<String> currency;
  final Value<String> status;
  final Value<int?> paymentId;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const RentSchedulesCompanion({
    this.id = const Value.absent(),
    this.contractId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.propertyId = const Value.absent(),
    this.tenantName = const Value.absent(),
    this.propertyName = const Value.absent(),
    this.unitId = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.amount = const Value.absent(),
    this.paidAmount = const Value.absent(),
    this.currency = const Value.absent(),
    this.status = const Value.absent(),
    this.paymentId = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  RentSchedulesCompanion.insert({
    this.id = const Value.absent(),
    required int contractId,
    required int tenantId,
    required int propertyId,
    required String tenantName,
    required String propertyName,
    required String unitId,
    required DateTime dueDate,
    required double amount,
    this.paidAmount = const Value.absent(),
    this.currency = const Value.absent(),
    this.status = const Value.absent(),
    this.paymentId = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : contractId = Value(contractId),
       tenantId = Value(tenantId),
       propertyId = Value(propertyId),
       tenantName = Value(tenantName),
       propertyName = Value(propertyName),
       unitId = Value(unitId),
       dueDate = Value(dueDate),
       amount = Value(amount);
  static Insertable<RentScheduleRecord> custom({
    Expression<int>? id,
    Expression<int>? contractId,
    Expression<int>? tenantId,
    Expression<int>? propertyId,
    Expression<String>? tenantName,
    Expression<String>? propertyName,
    Expression<String>? unitId,
    Expression<DateTime>? dueDate,
    Expression<double>? amount,
    Expression<double>? paidAmount,
    Expression<String>? currency,
    Expression<String>? status,
    Expression<int>? paymentId,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (contractId != null) 'contract_id': contractId,
      if (tenantId != null) 'tenant_id': tenantId,
      if (propertyId != null) 'property_id': propertyId,
      if (tenantName != null) 'tenant_name': tenantName,
      if (propertyName != null) 'property_name': propertyName,
      if (unitId != null) 'unit_id': unitId,
      if (dueDate != null) 'due_date': dueDate,
      if (amount != null) 'amount': amount,
      if (paidAmount != null) 'paid_amount': paidAmount,
      if (currency != null) 'currency': currency,
      if (status != null) 'status': status,
      if (paymentId != null) 'payment_id': paymentId,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  RentSchedulesCompanion copyWith({
    Value<int>? id,
    Value<int>? contractId,
    Value<int>? tenantId,
    Value<int>? propertyId,
    Value<String>? tenantName,
    Value<String>? propertyName,
    Value<String>? unitId,
    Value<DateTime>? dueDate,
    Value<double>? amount,
    Value<double>? paidAmount,
    Value<String>? currency,
    Value<String>? status,
    Value<int?>? paymentId,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return RentSchedulesCompanion(
      id: id ?? this.id,
      contractId: contractId ?? this.contractId,
      tenantId: tenantId ?? this.tenantId,
      propertyId: propertyId ?? this.propertyId,
      tenantName: tenantName ?? this.tenantName,
      propertyName: propertyName ?? this.propertyName,
      unitId: unitId ?? this.unitId,
      dueDate: dueDate ?? this.dueDate,
      amount: amount ?? this.amount,
      paidAmount: paidAmount ?? this.paidAmount,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      paymentId: paymentId ?? this.paymentId,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (contractId.present) {
      map['contract_id'] = Variable<int>(contractId.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    if (propertyId.present) {
      map['property_id'] = Variable<int>(propertyId.value);
    }
    if (tenantName.present) {
      map['tenant_name'] = Variable<String>(tenantName.value);
    }
    if (propertyName.present) {
      map['property_name'] = Variable<String>(propertyName.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<String>(unitId.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (paidAmount.present) {
      map['paid_amount'] = Variable<double>(paidAmount.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (paymentId.present) {
      map['payment_id'] = Variable<int>(paymentId.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RentSchedulesCompanion(')
          ..write('id: $id, ')
          ..write('contractId: $contractId, ')
          ..write('tenantId: $tenantId, ')
          ..write('propertyId: $propertyId, ')
          ..write('tenantName: $tenantName, ')
          ..write('propertyName: $propertyName, ')
          ..write('unitId: $unitId, ')
          ..write('dueDate: $dueDate, ')
          ..write('amount: $amount, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('currency: $currency, ')
          ..write('status: $status, ')
          ..write('paymentId: $paymentId, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ExpensesTable extends Expenses
    with TableInfo<$ExpensesTable, ExpenseRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpensesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _propertyIdMeta = const VerificationMeta(
    'propertyId',
  );
  @override
  late final GeneratedColumn<int> propertyId = GeneratedColumn<int>(
    'property_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES properties (id)',
    ),
  );
  static const VerificationMeta _propertyNameMeta = const VerificationMeta(
    'propertyName',
  );
  @override
  late final GeneratedColumn<String> propertyName = GeneratedColumn<String>(
    'property_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('maintenance'),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _vendorMeta = const VerificationMeta('vendor');
  @override
  late final GeneratedColumn<String> vendor = GeneratedColumn<String>(
    'vendor',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    propertyId,
    propertyName,
    category,
    amount,
    date,
    description,
    vendor,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expenses';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExpenseRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('property_id')) {
      context.handle(
        _propertyIdMeta,
        propertyId.isAcceptableOrUnknown(data['property_id']!, _propertyIdMeta),
      );
    }
    if (data.containsKey('property_name')) {
      context.handle(
        _propertyNameMeta,
        propertyName.isAcceptableOrUnknown(
          data['property_name']!,
          _propertyNameMeta,
        ),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('vendor')) {
      context.handle(
        _vendorMeta,
        vendor.isAcceptableOrUnknown(data['vendor']!, _vendorMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExpenseRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExpenseRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      propertyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}property_id'],
      ),
      propertyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}property_name'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      vendor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vendor'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ExpensesTable createAlias(String alias) {
    return $ExpensesTable(attachedDatabase, alias);
  }
}

class ExpenseRecord extends DataClass implements Insertable<ExpenseRecord> {
  final int id;
  final int? propertyId;
  final String? propertyName;
  final String category;
  final double amount;
  final DateTime date;
  final String description;
  final String? vendor;
  final DateTime createdAt;
  const ExpenseRecord({
    required this.id,
    this.propertyId,
    this.propertyName,
    required this.category,
    required this.amount,
    required this.date,
    required this.description,
    this.vendor,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || propertyId != null) {
      map['property_id'] = Variable<int>(propertyId);
    }
    if (!nullToAbsent || propertyName != null) {
      map['property_name'] = Variable<String>(propertyName);
    }
    map['category'] = Variable<String>(category);
    map['amount'] = Variable<double>(amount);
    map['date'] = Variable<DateTime>(date);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || vendor != null) {
      map['vendor'] = Variable<String>(vendor);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ExpensesCompanion toCompanion(bool nullToAbsent) {
    return ExpensesCompanion(
      id: Value(id),
      propertyId: propertyId == null && nullToAbsent
          ? const Value.absent()
          : Value(propertyId),
      propertyName: propertyName == null && nullToAbsent
          ? const Value.absent()
          : Value(propertyName),
      category: Value(category),
      amount: Value(amount),
      date: Value(date),
      description: Value(description),
      vendor: vendor == null && nullToAbsent
          ? const Value.absent()
          : Value(vendor),
      createdAt: Value(createdAt),
    );
  }

  factory ExpenseRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExpenseRecord(
      id: serializer.fromJson<int>(json['id']),
      propertyId: serializer.fromJson<int?>(json['propertyId']),
      propertyName: serializer.fromJson<String?>(json['propertyName']),
      category: serializer.fromJson<String>(json['category']),
      amount: serializer.fromJson<double>(json['amount']),
      date: serializer.fromJson<DateTime>(json['date']),
      description: serializer.fromJson<String>(json['description']),
      vendor: serializer.fromJson<String?>(json['vendor']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'propertyId': serializer.toJson<int?>(propertyId),
      'propertyName': serializer.toJson<String?>(propertyName),
      'category': serializer.toJson<String>(category),
      'amount': serializer.toJson<double>(amount),
      'date': serializer.toJson<DateTime>(date),
      'description': serializer.toJson<String>(description),
      'vendor': serializer.toJson<String?>(vendor),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ExpenseRecord copyWith({
    int? id,
    Value<int?> propertyId = const Value.absent(),
    Value<String?> propertyName = const Value.absent(),
    String? category,
    double? amount,
    DateTime? date,
    String? description,
    Value<String?> vendor = const Value.absent(),
    DateTime? createdAt,
  }) => ExpenseRecord(
    id: id ?? this.id,
    propertyId: propertyId.present ? propertyId.value : this.propertyId,
    propertyName: propertyName.present ? propertyName.value : this.propertyName,
    category: category ?? this.category,
    amount: amount ?? this.amount,
    date: date ?? this.date,
    description: description ?? this.description,
    vendor: vendor.present ? vendor.value : this.vendor,
    createdAt: createdAt ?? this.createdAt,
  );
  ExpenseRecord copyWithCompanion(ExpensesCompanion data) {
    return ExpenseRecord(
      id: data.id.present ? data.id.value : this.id,
      propertyId: data.propertyId.present
          ? data.propertyId.value
          : this.propertyId,
      propertyName: data.propertyName.present
          ? data.propertyName.value
          : this.propertyName,
      category: data.category.present ? data.category.value : this.category,
      amount: data.amount.present ? data.amount.value : this.amount,
      date: data.date.present ? data.date.value : this.date,
      description: data.description.present
          ? data.description.value
          : this.description,
      vendor: data.vendor.present ? data.vendor.value : this.vendor,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseRecord(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('propertyName: $propertyName, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('date: $date, ')
          ..write('description: $description, ')
          ..write('vendor: $vendor, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    propertyId,
    propertyName,
    category,
    amount,
    date,
    description,
    vendor,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpenseRecord &&
          other.id == this.id &&
          other.propertyId == this.propertyId &&
          other.propertyName == this.propertyName &&
          other.category == this.category &&
          other.amount == this.amount &&
          other.date == this.date &&
          other.description == this.description &&
          other.vendor == this.vendor &&
          other.createdAt == this.createdAt);
}

class ExpensesCompanion extends UpdateCompanion<ExpenseRecord> {
  final Value<int> id;
  final Value<int?> propertyId;
  final Value<String?> propertyName;
  final Value<String> category;
  final Value<double> amount;
  final Value<DateTime> date;
  final Value<String> description;
  final Value<String?> vendor;
  final Value<DateTime> createdAt;
  const ExpensesCompanion({
    this.id = const Value.absent(),
    this.propertyId = const Value.absent(),
    this.propertyName = const Value.absent(),
    this.category = const Value.absent(),
    this.amount = const Value.absent(),
    this.date = const Value.absent(),
    this.description = const Value.absent(),
    this.vendor = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ExpensesCompanion.insert({
    this.id = const Value.absent(),
    this.propertyId = const Value.absent(),
    this.propertyName = const Value.absent(),
    this.category = const Value.absent(),
    required double amount,
    required DateTime date,
    required String description,
    this.vendor = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : amount = Value(amount),
       date = Value(date),
       description = Value(description);
  static Insertable<ExpenseRecord> custom({
    Expression<int>? id,
    Expression<int>? propertyId,
    Expression<String>? propertyName,
    Expression<String>? category,
    Expression<double>? amount,
    Expression<DateTime>? date,
    Expression<String>? description,
    Expression<String>? vendor,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (propertyId != null) 'property_id': propertyId,
      if (propertyName != null) 'property_name': propertyName,
      if (category != null) 'category': category,
      if (amount != null) 'amount': amount,
      if (date != null) 'date': date,
      if (description != null) 'description': description,
      if (vendor != null) 'vendor': vendor,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ExpensesCompanion copyWith({
    Value<int>? id,
    Value<int?>? propertyId,
    Value<String?>? propertyName,
    Value<String>? category,
    Value<double>? amount,
    Value<DateTime>? date,
    Value<String>? description,
    Value<String?>? vendor,
    Value<DateTime>? createdAt,
  }) {
    return ExpensesCompanion(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      propertyName: propertyName ?? this.propertyName,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      description: description ?? this.description,
      vendor: vendor ?? this.vendor,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (propertyId.present) {
      map['property_id'] = Variable<int>(propertyId.value);
    }
    if (propertyName.present) {
      map['property_name'] = Variable<String>(propertyName.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (vendor.present) {
      map['vendor'] = Variable<String>(vendor.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpensesCompanion(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('propertyName: $propertyName, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('date: $date, ')
          ..write('description: $description, ')
          ..write('vendor: $vendor, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $AttachmentsTable extends Attachments
    with TableInfo<$AttachmentsTable, AttachmentRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttachmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<int> entityId = GeneratedColumn<int>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileTypeMeta = const VerificationMeta(
    'fileType',
  );
  @override
  late final GeneratedColumn<String> fileType = GeneratedColumn<String>(
    'file_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('file'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entityType,
    entityId,
    label,
    filePath,
    fileType,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attachments';
  @override
  VerificationContext validateIntegrity(
    Insertable<AttachmentRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('file_type')) {
      context.handle(
        _fileTypeMeta,
        fileType.isAcceptableOrUnknown(data['file_type']!, _fileTypeMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AttachmentRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AttachmentRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}entity_id'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      )!,
      fileType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_type'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AttachmentsTable createAlias(String alias) {
    return $AttachmentsTable(attachedDatabase, alias);
  }
}

class AttachmentRecord extends DataClass
    implements Insertable<AttachmentRecord> {
  final int id;
  final String entityType;
  final int entityId;
  final String label;
  final String filePath;
  final String fileType;
  final DateTime createdAt;
  const AttachmentRecord({
    required this.id,
    required this.entityType,
    required this.entityId,
    required this.label,
    required this.filePath,
    required this.fileType,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<int>(entityId);
    map['label'] = Variable<String>(label);
    map['file_path'] = Variable<String>(filePath);
    map['file_type'] = Variable<String>(fileType);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AttachmentsCompanion toCompanion(bool nullToAbsent) {
    return AttachmentsCompanion(
      id: Value(id),
      entityType: Value(entityType),
      entityId: Value(entityId),
      label: Value(label),
      filePath: Value(filePath),
      fileType: Value(fileType),
      createdAt: Value(createdAt),
    );
  }

  factory AttachmentRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AttachmentRecord(
      id: serializer.fromJson<int>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<int>(json['entityId']),
      label: serializer.fromJson<String>(json['label']),
      filePath: serializer.fromJson<String>(json['filePath']),
      fileType: serializer.fromJson<String>(json['fileType']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<int>(entityId),
      'label': serializer.toJson<String>(label),
      'filePath': serializer.toJson<String>(filePath),
      'fileType': serializer.toJson<String>(fileType),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AttachmentRecord copyWith({
    int? id,
    String? entityType,
    int? entityId,
    String? label,
    String? filePath,
    String? fileType,
    DateTime? createdAt,
  }) => AttachmentRecord(
    id: id ?? this.id,
    entityType: entityType ?? this.entityType,
    entityId: entityId ?? this.entityId,
    label: label ?? this.label,
    filePath: filePath ?? this.filePath,
    fileType: fileType ?? this.fileType,
    createdAt: createdAt ?? this.createdAt,
  );
  AttachmentRecord copyWithCompanion(AttachmentsCompanion data) {
    return AttachmentRecord(
      id: data.id.present ? data.id.value : this.id,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      label: data.label.present ? data.label.value : this.label,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      fileType: data.fileType.present ? data.fileType.value : this.fileType,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AttachmentRecord(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('label: $label, ')
          ..write('filePath: $filePath, ')
          ..write('fileType: $fileType, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    entityType,
    entityId,
    label,
    filePath,
    fileType,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttachmentRecord &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.label == this.label &&
          other.filePath == this.filePath &&
          other.fileType == this.fileType &&
          other.createdAt == this.createdAt);
}

class AttachmentsCompanion extends UpdateCompanion<AttachmentRecord> {
  final Value<int> id;
  final Value<String> entityType;
  final Value<int> entityId;
  final Value<String> label;
  final Value<String> filePath;
  final Value<String> fileType;
  final Value<DateTime> createdAt;
  const AttachmentsCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.label = const Value.absent(),
    this.filePath = const Value.absent(),
    this.fileType = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AttachmentsCompanion.insert({
    this.id = const Value.absent(),
    required String entityType,
    required int entityId,
    required String label,
    required String filePath,
    this.fileType = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : entityType = Value(entityType),
       entityId = Value(entityId),
       label = Value(label),
       filePath = Value(filePath);
  static Insertable<AttachmentRecord> custom({
    Expression<int>? id,
    Expression<String>? entityType,
    Expression<int>? entityId,
    Expression<String>? label,
    Expression<String>? filePath,
    Expression<String>? fileType,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (label != null) 'label': label,
      if (filePath != null) 'file_path': filePath,
      if (fileType != null) 'file_type': fileType,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AttachmentsCompanion copyWith({
    Value<int>? id,
    Value<String>? entityType,
    Value<int>? entityId,
    Value<String>? label,
    Value<String>? filePath,
    Value<String>? fileType,
    Value<DateTime>? createdAt,
  }) {
    return AttachmentsCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      label: label ?? this.label,
      filePath: filePath ?? this.filePath,
      fileType: fileType ?? this.fileType,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<int>(entityId.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (fileType.present) {
      map['file_type'] = Variable<String>(fileType.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttachmentsCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('label: $label, ')
          ..write('filePath: $filePath, ')
          ..write('fileType: $fileType, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $MaintenanceTicketsTable extends MaintenanceTickets
    with TableInfo<$MaintenanceTicketsTable, MaintenanceTicketRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MaintenanceTicketsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _propertyIdMeta = const VerificationMeta(
    'propertyId',
  );
  @override
  late final GeneratedColumn<int> propertyId = GeneratedColumn<int>(
    'property_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES properties (id)',
    ),
  );
  static const VerificationMeta _propertyNameMeta = const VerificationMeta(
    'propertyName',
  );
  @override
  late final GeneratedColumn<String> propertyName = GeneratedColumn<String>(
    'property_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<String> unitId = GeneratedColumn<String>(
    'unit_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tenantIdMeta = const VerificationMeta(
    'tenantId',
  );
  @override
  late final GeneratedColumn<int> tenantId = GeneratedColumn<int>(
    'tenant_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tenants (id)',
    ),
  );
  static const VerificationMeta _tenantNameMeta = const VerificationMeta(
    'tenantName',
  );
  @override
  late final GeneratedColumn<String> tenantName = GeneratedColumn<String>(
    'tenant_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _damageResponsibilityMeta =
      const VerificationMeta('damageResponsibility');
  @override
  late final GeneratedColumn<String> damageResponsibility =
      GeneratedColumn<String>(
        'damage_responsibility',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('tenant'),
      );
  static const VerificationMeta _chargeFromDepositMeta = const VerificationMeta(
    'chargeFromDeposit',
  );
  @override
  late final GeneratedColumn<bool> chargeFromDeposit = GeneratedColumn<bool>(
    'charge_from_deposit',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("charge_from_deposit" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('open'),
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('normal'),
  );
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<double> cost = GeneratedColumn<double>(
    'cost',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    propertyId,
    propertyName,
    unitId,
    tenantId,
    tenantName,
    title,
    description,
    damageResponsibility,
    chargeFromDeposit,
    status,
    priority,
    cost,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'maintenance_tickets';
  @override
  VerificationContext validateIntegrity(
    Insertable<MaintenanceTicketRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('property_id')) {
      context.handle(
        _propertyIdMeta,
        propertyId.isAcceptableOrUnknown(data['property_id']!, _propertyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_propertyIdMeta);
    }
    if (data.containsKey('property_name')) {
      context.handle(
        _propertyNameMeta,
        propertyName.isAcceptableOrUnknown(
          data['property_name']!,
          _propertyNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_propertyNameMeta);
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    }
    if (data.containsKey('tenant_id')) {
      context.handle(
        _tenantIdMeta,
        tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta),
      );
    }
    if (data.containsKey('tenant_name')) {
      context.handle(
        _tenantNameMeta,
        tenantName.isAcceptableOrUnknown(data['tenant_name']!, _tenantNameMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('damage_responsibility')) {
      context.handle(
        _damageResponsibilityMeta,
        damageResponsibility.isAcceptableOrUnknown(
          data['damage_responsibility']!,
          _damageResponsibilityMeta,
        ),
      );
    }
    if (data.containsKey('charge_from_deposit')) {
      context.handle(
        _chargeFromDepositMeta,
        chargeFromDeposit.isAcceptableOrUnknown(
          data['charge_from_deposit']!,
          _chargeFromDepositMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    }
    if (data.containsKey('cost')) {
      context.handle(
        _costMeta,
        cost.isAcceptableOrUnknown(data['cost']!, _costMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MaintenanceTicketRecord map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MaintenanceTicketRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      propertyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}property_id'],
      )!,
      propertyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}property_name'],
      )!,
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_id'],
      ),
      tenantId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tenant_id'],
      ),
      tenantName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_name'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      damageResponsibility: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}damage_responsibility'],
      )!,
      chargeFromDeposit: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}charge_from_deposit'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}priority'],
      )!,
      cost: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cost'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $MaintenanceTicketsTable createAlias(String alias) {
    return $MaintenanceTicketsTable(attachedDatabase, alias);
  }
}

class MaintenanceTicketRecord extends DataClass
    implements Insertable<MaintenanceTicketRecord> {
  final int id;
  final int propertyId;
  final String propertyName;
  final String? unitId;
  final int? tenantId;
  final String? tenantName;
  final String title;
  final String description;
  final String damageResponsibility;
  final bool chargeFromDeposit;
  final String status;
  final String priority;
  final double cost;
  final DateTime createdAt;
  final DateTime updatedAt;
  const MaintenanceTicketRecord({
    required this.id,
    required this.propertyId,
    required this.propertyName,
    this.unitId,
    this.tenantId,
    this.tenantName,
    required this.title,
    required this.description,
    required this.damageResponsibility,
    required this.chargeFromDeposit,
    required this.status,
    required this.priority,
    required this.cost,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['property_id'] = Variable<int>(propertyId);
    map['property_name'] = Variable<String>(propertyName);
    if (!nullToAbsent || unitId != null) {
      map['unit_id'] = Variable<String>(unitId);
    }
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<int>(tenantId);
    }
    if (!nullToAbsent || tenantName != null) {
      map['tenant_name'] = Variable<String>(tenantName);
    }
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['damage_responsibility'] = Variable<String>(damageResponsibility);
    map['charge_from_deposit'] = Variable<bool>(chargeFromDeposit);
    map['status'] = Variable<String>(status);
    map['priority'] = Variable<String>(priority);
    map['cost'] = Variable<double>(cost);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MaintenanceTicketsCompanion toCompanion(bool nullToAbsent) {
    return MaintenanceTicketsCompanion(
      id: Value(id),
      propertyId: Value(propertyId),
      propertyName: Value(propertyName),
      unitId: unitId == null && nullToAbsent
          ? const Value.absent()
          : Value(unitId),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      tenantName: tenantName == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantName),
      title: Value(title),
      description: Value(description),
      damageResponsibility: Value(damageResponsibility),
      chargeFromDeposit: Value(chargeFromDeposit),
      status: Value(status),
      priority: Value(priority),
      cost: Value(cost),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory MaintenanceTicketRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MaintenanceTicketRecord(
      id: serializer.fromJson<int>(json['id']),
      propertyId: serializer.fromJson<int>(json['propertyId']),
      propertyName: serializer.fromJson<String>(json['propertyName']),
      unitId: serializer.fromJson<String?>(json['unitId']),
      tenantId: serializer.fromJson<int?>(json['tenantId']),
      tenantName: serializer.fromJson<String?>(json['tenantName']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      damageResponsibility: serializer.fromJson<String>(
        json['damageResponsibility'],
      ),
      chargeFromDeposit: serializer.fromJson<bool>(json['chargeFromDeposit']),
      status: serializer.fromJson<String>(json['status']),
      priority: serializer.fromJson<String>(json['priority']),
      cost: serializer.fromJson<double>(json['cost']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'propertyId': serializer.toJson<int>(propertyId),
      'propertyName': serializer.toJson<String>(propertyName),
      'unitId': serializer.toJson<String?>(unitId),
      'tenantId': serializer.toJson<int?>(tenantId),
      'tenantName': serializer.toJson<String?>(tenantName),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'damageResponsibility': serializer.toJson<String>(damageResponsibility),
      'chargeFromDeposit': serializer.toJson<bool>(chargeFromDeposit),
      'status': serializer.toJson<String>(status),
      'priority': serializer.toJson<String>(priority),
      'cost': serializer.toJson<double>(cost),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MaintenanceTicketRecord copyWith({
    int? id,
    int? propertyId,
    String? propertyName,
    Value<String?> unitId = const Value.absent(),
    Value<int?> tenantId = const Value.absent(),
    Value<String?> tenantName = const Value.absent(),
    String? title,
    String? description,
    String? damageResponsibility,
    bool? chargeFromDeposit,
    String? status,
    String? priority,
    double? cost,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => MaintenanceTicketRecord(
    id: id ?? this.id,
    propertyId: propertyId ?? this.propertyId,
    propertyName: propertyName ?? this.propertyName,
    unitId: unitId.present ? unitId.value : this.unitId,
    tenantId: tenantId.present ? tenantId.value : this.tenantId,
    tenantName: tenantName.present ? tenantName.value : this.tenantName,
    title: title ?? this.title,
    description: description ?? this.description,
    damageResponsibility: damageResponsibility ?? this.damageResponsibility,
    chargeFromDeposit: chargeFromDeposit ?? this.chargeFromDeposit,
    status: status ?? this.status,
    priority: priority ?? this.priority,
    cost: cost ?? this.cost,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  MaintenanceTicketRecord copyWithCompanion(MaintenanceTicketsCompanion data) {
    return MaintenanceTicketRecord(
      id: data.id.present ? data.id.value : this.id,
      propertyId: data.propertyId.present
          ? data.propertyId.value
          : this.propertyId,
      propertyName: data.propertyName.present
          ? data.propertyName.value
          : this.propertyName,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      tenantId: data.tenantId.present ? data.tenantId.value : this.tenantId,
      tenantName: data.tenantName.present
          ? data.tenantName.value
          : this.tenantName,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      damageResponsibility: data.damageResponsibility.present
          ? data.damageResponsibility.value
          : this.damageResponsibility,
      chargeFromDeposit: data.chargeFromDeposit.present
          ? data.chargeFromDeposit.value
          : this.chargeFromDeposit,
      status: data.status.present ? data.status.value : this.status,
      priority: data.priority.present ? data.priority.value : this.priority,
      cost: data.cost.present ? data.cost.value : this.cost,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MaintenanceTicketRecord(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('propertyName: $propertyName, ')
          ..write('unitId: $unitId, ')
          ..write('tenantId: $tenantId, ')
          ..write('tenantName: $tenantName, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('damageResponsibility: $damageResponsibility, ')
          ..write('chargeFromDeposit: $chargeFromDeposit, ')
          ..write('status: $status, ')
          ..write('priority: $priority, ')
          ..write('cost: $cost, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    propertyId,
    propertyName,
    unitId,
    tenantId,
    tenantName,
    title,
    description,
    damageResponsibility,
    chargeFromDeposit,
    status,
    priority,
    cost,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MaintenanceTicketRecord &&
          other.id == this.id &&
          other.propertyId == this.propertyId &&
          other.propertyName == this.propertyName &&
          other.unitId == this.unitId &&
          other.tenantId == this.tenantId &&
          other.tenantName == this.tenantName &&
          other.title == this.title &&
          other.description == this.description &&
          other.damageResponsibility == this.damageResponsibility &&
          other.chargeFromDeposit == this.chargeFromDeposit &&
          other.status == this.status &&
          other.priority == this.priority &&
          other.cost == this.cost &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MaintenanceTicketsCompanion
    extends UpdateCompanion<MaintenanceTicketRecord> {
  final Value<int> id;
  final Value<int> propertyId;
  final Value<String> propertyName;
  final Value<String?> unitId;
  final Value<int?> tenantId;
  final Value<String?> tenantName;
  final Value<String> title;
  final Value<String> description;
  final Value<String> damageResponsibility;
  final Value<bool> chargeFromDeposit;
  final Value<String> status;
  final Value<String> priority;
  final Value<double> cost;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const MaintenanceTicketsCompanion({
    this.id = const Value.absent(),
    this.propertyId = const Value.absent(),
    this.propertyName = const Value.absent(),
    this.unitId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.tenantName = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.damageResponsibility = const Value.absent(),
    this.chargeFromDeposit = const Value.absent(),
    this.status = const Value.absent(),
    this.priority = const Value.absent(),
    this.cost = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  MaintenanceTicketsCompanion.insert({
    this.id = const Value.absent(),
    required int propertyId,
    required String propertyName,
    this.unitId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.tenantName = const Value.absent(),
    required String title,
    required String description,
    this.damageResponsibility = const Value.absent(),
    this.chargeFromDeposit = const Value.absent(),
    this.status = const Value.absent(),
    this.priority = const Value.absent(),
    this.cost = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : propertyId = Value(propertyId),
       propertyName = Value(propertyName),
       title = Value(title),
       description = Value(description);
  static Insertable<MaintenanceTicketRecord> custom({
    Expression<int>? id,
    Expression<int>? propertyId,
    Expression<String>? propertyName,
    Expression<String>? unitId,
    Expression<int>? tenantId,
    Expression<String>? tenantName,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? damageResponsibility,
    Expression<bool>? chargeFromDeposit,
    Expression<String>? status,
    Expression<String>? priority,
    Expression<double>? cost,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (propertyId != null) 'property_id': propertyId,
      if (propertyName != null) 'property_name': propertyName,
      if (unitId != null) 'unit_id': unitId,
      if (tenantId != null) 'tenant_id': tenantId,
      if (tenantName != null) 'tenant_name': tenantName,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (damageResponsibility != null)
        'damage_responsibility': damageResponsibility,
      if (chargeFromDeposit != null) 'charge_from_deposit': chargeFromDeposit,
      if (status != null) 'status': status,
      if (priority != null) 'priority': priority,
      if (cost != null) 'cost': cost,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  MaintenanceTicketsCompanion copyWith({
    Value<int>? id,
    Value<int>? propertyId,
    Value<String>? propertyName,
    Value<String?>? unitId,
    Value<int?>? tenantId,
    Value<String?>? tenantName,
    Value<String>? title,
    Value<String>? description,
    Value<String>? damageResponsibility,
    Value<bool>? chargeFromDeposit,
    Value<String>? status,
    Value<String>? priority,
    Value<double>? cost,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return MaintenanceTicketsCompanion(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      propertyName: propertyName ?? this.propertyName,
      unitId: unitId ?? this.unitId,
      tenantId: tenantId ?? this.tenantId,
      tenantName: tenantName ?? this.tenantName,
      title: title ?? this.title,
      description: description ?? this.description,
      damageResponsibility: damageResponsibility ?? this.damageResponsibility,
      chargeFromDeposit: chargeFromDeposit ?? this.chargeFromDeposit,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      cost: cost ?? this.cost,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (propertyId.present) {
      map['property_id'] = Variable<int>(propertyId.value);
    }
    if (propertyName.present) {
      map['property_name'] = Variable<String>(propertyName.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<String>(unitId.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    if (tenantName.present) {
      map['tenant_name'] = Variable<String>(tenantName.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (damageResponsibility.present) {
      map['damage_responsibility'] = Variable<String>(
        damageResponsibility.value,
      );
    }
    if (chargeFromDeposit.present) {
      map['charge_from_deposit'] = Variable<bool>(chargeFromDeposit.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (cost.present) {
      map['cost'] = Variable<double>(cost.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MaintenanceTicketsCompanion(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('propertyName: $propertyName, ')
          ..write('unitId: $unitId, ')
          ..write('tenantId: $tenantId, ')
          ..write('tenantName: $tenantName, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('damageResponsibility: $damageResponsibility, ')
          ..write('chargeFromDeposit: $chargeFromDeposit, ')
          ..write('status: $status, ')
          ..write('priority: $priority, ')
          ..write('cost: $cost, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $MessageTemplatesTable extends MessageTemplates
    with TableInfo<$MessageTemplatesTable, MessageTemplateRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessageTemplatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _channelDefaultMeta = const VerificationMeta(
    'channelDefault',
  );
  @override
  late final GeneratedColumn<String> channelDefault = GeneratedColumn<String>(
    'channel_default',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('whatsapp'),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    type,
    title,
    body,
    channelDefault,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'message_templates';
  @override
  VerificationContext validateIntegrity(
    Insertable<MessageTemplateRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('channel_default')) {
      context.handle(
        _channelDefaultMeta,
        channelDefault.isAcceptableOrUnknown(
          data['channel_default']!,
          _channelDefaultMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MessageTemplateRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MessageTemplateRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      channelDefault: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}channel_default'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $MessageTemplatesTable createAlias(String alias) {
    return $MessageTemplatesTable(attachedDatabase, alias);
  }
}

class MessageTemplateRecord extends DataClass
    implements Insertable<MessageTemplateRecord> {
  final int id;
  final String type;
  final String title;
  final String body;
  final String channelDefault;
  final DateTime updatedAt;
  const MessageTemplateRecord({
    required this.id,
    required this.type,
    required this.title,
    required this.body,
    required this.channelDefault,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type'] = Variable<String>(type);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    map['channel_default'] = Variable<String>(channelDefault);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MessageTemplatesCompanion toCompanion(bool nullToAbsent) {
    return MessageTemplatesCompanion(
      id: Value(id),
      type: Value(type),
      title: Value(title),
      body: Value(body),
      channelDefault: Value(channelDefault),
      updatedAt: Value(updatedAt),
    );
  }

  factory MessageTemplateRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MessageTemplateRecord(
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      channelDefault: serializer.fromJson<String>(json['channelDefault']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(type),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'channelDefault': serializer.toJson<String>(channelDefault),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MessageTemplateRecord copyWith({
    int? id,
    String? type,
    String? title,
    String? body,
    String? channelDefault,
    DateTime? updatedAt,
  }) => MessageTemplateRecord(
    id: id ?? this.id,
    type: type ?? this.type,
    title: title ?? this.title,
    body: body ?? this.body,
    channelDefault: channelDefault ?? this.channelDefault,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  MessageTemplateRecord copyWithCompanion(MessageTemplatesCompanion data) {
    return MessageTemplateRecord(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      channelDefault: data.channelDefault.present
          ? data.channelDefault.value
          : this.channelDefault,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MessageTemplateRecord(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('channelDefault: $channelDefault, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, type, title, body, channelDefault, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MessageTemplateRecord &&
          other.id == this.id &&
          other.type == this.type &&
          other.title == this.title &&
          other.body == this.body &&
          other.channelDefault == this.channelDefault &&
          other.updatedAt == this.updatedAt);
}

class MessageTemplatesCompanion extends UpdateCompanion<MessageTemplateRecord> {
  final Value<int> id;
  final Value<String> type;
  final Value<String> title;
  final Value<String> body;
  final Value<String> channelDefault;
  final Value<DateTime> updatedAt;
  const MessageTemplatesCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.channelDefault = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  MessageTemplatesCompanion.insert({
    this.id = const Value.absent(),
    required String type,
    required String title,
    required String body,
    this.channelDefault = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : type = Value(type),
       title = Value(title),
       body = Value(body);
  static Insertable<MessageTemplateRecord> custom({
    Expression<int>? id,
    Expression<String>? type,
    Expression<String>? title,
    Expression<String>? body,
    Expression<String>? channelDefault,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (channelDefault != null) 'channel_default': channelDefault,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  MessageTemplatesCompanion copyWith({
    Value<int>? id,
    Value<String>? type,
    Value<String>? title,
    Value<String>? body,
    Value<String>? channelDefault,
    Value<DateTime>? updatedAt,
  }) {
    return MessageTemplatesCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      body: body ?? this.body,
      channelDefault: channelDefault ?? this.channelDefault,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (channelDefault.present) {
      map['channel_default'] = Variable<String>(channelDefault.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessageTemplatesCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('channelDefault: $channelDefault, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $MessageLogsTable extends MessageLogs
    with TableInfo<$MessageLogsTable, MessageLogRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessageLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _tenantIdMeta = const VerificationMeta(
    'tenantId',
  );
  @override
  late final GeneratedColumn<int> tenantId = GeneratedColumn<int>(
    'tenant_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tenants (id)',
    ),
  );
  static const VerificationMeta _tenantNameMeta = const VerificationMeta(
    'tenantName',
  );
  @override
  late final GeneratedColumn<String> tenantName = GeneratedColumn<String>(
    'tenant_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tenantPhoneMeta = const VerificationMeta(
    'tenantPhone',
  );
  @override
  late final GeneratedColumn<String> tenantPhone = GeneratedColumn<String>(
    'tenant_phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _channelMeta = const VerificationMeta(
    'channel',
  );
  @override
  late final GeneratedColumn<String> channel = GeneratedColumn<String>(
    'channel',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('opened'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    tenantId,
    tenantName,
    tenantPhone,
    type,
    channel,
    body,
    status,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'message_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<MessageLogRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tenant_id')) {
      context.handle(
        _tenantIdMeta,
        tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta),
      );
    }
    if (data.containsKey('tenant_name')) {
      context.handle(
        _tenantNameMeta,
        tenantName.isAcceptableOrUnknown(data['tenant_name']!, _tenantNameMeta),
      );
    } else if (isInserting) {
      context.missing(_tenantNameMeta);
    }
    if (data.containsKey('tenant_phone')) {
      context.handle(
        _tenantPhoneMeta,
        tenantPhone.isAcceptableOrUnknown(
          data['tenant_phone']!,
          _tenantPhoneMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tenantPhoneMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('channel')) {
      context.handle(
        _channelMeta,
        channel.isAcceptableOrUnknown(data['channel']!, _channelMeta),
      );
    } else if (isInserting) {
      context.missing(_channelMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MessageLogRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MessageLogRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tenantId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tenant_id'],
      ),
      tenantName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_name'],
      )!,
      tenantPhone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_phone'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      channel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}channel'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $MessageLogsTable createAlias(String alias) {
    return $MessageLogsTable(attachedDatabase, alias);
  }
}

class MessageLogRecord extends DataClass
    implements Insertable<MessageLogRecord> {
  final int id;
  final int? tenantId;
  final String tenantName;
  final String tenantPhone;
  final String type;
  final String channel;
  final String body;
  final String status;
  final DateTime createdAt;
  const MessageLogRecord({
    required this.id,
    this.tenantId,
    required this.tenantName,
    required this.tenantPhone,
    required this.type,
    required this.channel,
    required this.body,
    required this.status,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<int>(tenantId);
    }
    map['tenant_name'] = Variable<String>(tenantName);
    map['tenant_phone'] = Variable<String>(tenantPhone);
    map['type'] = Variable<String>(type);
    map['channel'] = Variable<String>(channel);
    map['body'] = Variable<String>(body);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  MessageLogsCompanion toCompanion(bool nullToAbsent) {
    return MessageLogsCompanion(
      id: Value(id),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      tenantName: Value(tenantName),
      tenantPhone: Value(tenantPhone),
      type: Value(type),
      channel: Value(channel),
      body: Value(body),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory MessageLogRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MessageLogRecord(
      id: serializer.fromJson<int>(json['id']),
      tenantId: serializer.fromJson<int?>(json['tenantId']),
      tenantName: serializer.fromJson<String>(json['tenantName']),
      tenantPhone: serializer.fromJson<String>(json['tenantPhone']),
      type: serializer.fromJson<String>(json['type']),
      channel: serializer.fromJson<String>(json['channel']),
      body: serializer.fromJson<String>(json['body']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tenantId': serializer.toJson<int?>(tenantId),
      'tenantName': serializer.toJson<String>(tenantName),
      'tenantPhone': serializer.toJson<String>(tenantPhone),
      'type': serializer.toJson<String>(type),
      'channel': serializer.toJson<String>(channel),
      'body': serializer.toJson<String>(body),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  MessageLogRecord copyWith({
    int? id,
    Value<int?> tenantId = const Value.absent(),
    String? tenantName,
    String? tenantPhone,
    String? type,
    String? channel,
    String? body,
    String? status,
    DateTime? createdAt,
  }) => MessageLogRecord(
    id: id ?? this.id,
    tenantId: tenantId.present ? tenantId.value : this.tenantId,
    tenantName: tenantName ?? this.tenantName,
    tenantPhone: tenantPhone ?? this.tenantPhone,
    type: type ?? this.type,
    channel: channel ?? this.channel,
    body: body ?? this.body,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
  );
  MessageLogRecord copyWithCompanion(MessageLogsCompanion data) {
    return MessageLogRecord(
      id: data.id.present ? data.id.value : this.id,
      tenantId: data.tenantId.present ? data.tenantId.value : this.tenantId,
      tenantName: data.tenantName.present
          ? data.tenantName.value
          : this.tenantName,
      tenantPhone: data.tenantPhone.present
          ? data.tenantPhone.value
          : this.tenantPhone,
      type: data.type.present ? data.type.value : this.type,
      channel: data.channel.present ? data.channel.value : this.channel,
      body: data.body.present ? data.body.value : this.body,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MessageLogRecord(')
          ..write('id: $id, ')
          ..write('tenantId: $tenantId, ')
          ..write('tenantName: $tenantName, ')
          ..write('tenantPhone: $tenantPhone, ')
          ..write('type: $type, ')
          ..write('channel: $channel, ')
          ..write('body: $body, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    tenantId,
    tenantName,
    tenantPhone,
    type,
    channel,
    body,
    status,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MessageLogRecord &&
          other.id == this.id &&
          other.tenantId == this.tenantId &&
          other.tenantName == this.tenantName &&
          other.tenantPhone == this.tenantPhone &&
          other.type == this.type &&
          other.channel == this.channel &&
          other.body == this.body &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class MessageLogsCompanion extends UpdateCompanion<MessageLogRecord> {
  final Value<int> id;
  final Value<int?> tenantId;
  final Value<String> tenantName;
  final Value<String> tenantPhone;
  final Value<String> type;
  final Value<String> channel;
  final Value<String> body;
  final Value<String> status;
  final Value<DateTime> createdAt;
  const MessageLogsCompanion({
    this.id = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.tenantName = const Value.absent(),
    this.tenantPhone = const Value.absent(),
    this.type = const Value.absent(),
    this.channel = const Value.absent(),
    this.body = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  MessageLogsCompanion.insert({
    this.id = const Value.absent(),
    this.tenantId = const Value.absent(),
    required String tenantName,
    required String tenantPhone,
    required String type,
    required String channel,
    required String body,
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : tenantName = Value(tenantName),
       tenantPhone = Value(tenantPhone),
       type = Value(type),
       channel = Value(channel),
       body = Value(body);
  static Insertable<MessageLogRecord> custom({
    Expression<int>? id,
    Expression<int>? tenantId,
    Expression<String>? tenantName,
    Expression<String>? tenantPhone,
    Expression<String>? type,
    Expression<String>? channel,
    Expression<String>? body,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tenantId != null) 'tenant_id': tenantId,
      if (tenantName != null) 'tenant_name': tenantName,
      if (tenantPhone != null) 'tenant_phone': tenantPhone,
      if (type != null) 'type': type,
      if (channel != null) 'channel': channel,
      if (body != null) 'body': body,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  MessageLogsCompanion copyWith({
    Value<int>? id,
    Value<int?>? tenantId,
    Value<String>? tenantName,
    Value<String>? tenantPhone,
    Value<String>? type,
    Value<String>? channel,
    Value<String>? body,
    Value<String>? status,
    Value<DateTime>? createdAt,
  }) {
    return MessageLogsCompanion(
      id: id ?? this.id,
      tenantId: tenantId ?? this.tenantId,
      tenantName: tenantName ?? this.tenantName,
      tenantPhone: tenantPhone ?? this.tenantPhone,
      type: type ?? this.type,
      channel: channel ?? this.channel,
      body: body ?? this.body,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    if (tenantName.present) {
      map['tenant_name'] = Variable<String>(tenantName.value);
    }
    if (tenantPhone.present) {
      map['tenant_phone'] = Variable<String>(tenantPhone.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (channel.present) {
      map['channel'] = Variable<String>(channel.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessageLogsCompanion(')
          ..write('id: $id, ')
          ..write('tenantId: $tenantId, ')
          ..write('tenantName: $tenantName, ')
          ..write('tenantPhone: $tenantPhone, ')
          ..write('type: $type, ')
          ..write('channel: $channel, ')
          ..write('body: $body, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings
    with TableInfo<$SettingsTable, SettingRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [key, value, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<SettingRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  SettingRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingRecord(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class SettingRecord extends DataClass implements Insertable<SettingRecord> {
  final String key;
  final String value;
  final DateTime updatedAt;
  const SettingRecord({
    required this.key,
    required this.value,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      key: Value(key),
      value: Value(value),
      updatedAt: Value(updatedAt),
    );
  }

  factory SettingRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingRecord(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SettingRecord copyWith({String? key, String? value, DateTime? updatedAt}) =>
      SettingRecord(
        key: key ?? this.key,
        value: value ?? this.value,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  SettingRecord copyWithCompanion(SettingsCompanion data) {
    return SettingRecord(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingRecord(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingRecord &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAt == this.updatedAt);
}

class SettingsCompanion extends UpdateCompanion<SettingRecord> {
  final Value<String> key;
  final Value<String> value;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsCompanion.insert({
    required String key,
    required String value,
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<SettingRecord> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AuditLogsTable extends AuditLogs
    with TableInfo<$AuditLogsTable, AuditLogRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<int> entityId = GeneratedColumn<int>(
    'entity_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    action,
    entityType,
    entityId,
    description,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audit_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuditLogRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuditLogRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuditLogRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}entity_id'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AuditLogsTable createAlias(String alias) {
    return $AuditLogsTable(attachedDatabase, alias);
  }
}

class AuditLogRecord extends DataClass implements Insertable<AuditLogRecord> {
  final int id;
  final String action;
  final String entityType;
  final int? entityId;
  final String description;
  final DateTime createdAt;
  const AuditLogRecord({
    required this.id,
    required this.action,
    required this.entityType,
    this.entityId,
    required this.description,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['action'] = Variable<String>(action);
    map['entity_type'] = Variable<String>(entityType);
    if (!nullToAbsent || entityId != null) {
      map['entity_id'] = Variable<int>(entityId);
    }
    map['description'] = Variable<String>(description);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AuditLogsCompanion toCompanion(bool nullToAbsent) {
    return AuditLogsCompanion(
      id: Value(id),
      action: Value(action),
      entityType: Value(entityType),
      entityId: entityId == null && nullToAbsent
          ? const Value.absent()
          : Value(entityId),
      description: Value(description),
      createdAt: Value(createdAt),
    );
  }

  factory AuditLogRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuditLogRecord(
      id: serializer.fromJson<int>(json['id']),
      action: serializer.fromJson<String>(json['action']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<int?>(json['entityId']),
      description: serializer.fromJson<String>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'action': serializer.toJson<String>(action),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<int?>(entityId),
      'description': serializer.toJson<String>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AuditLogRecord copyWith({
    int? id,
    String? action,
    String? entityType,
    Value<int?> entityId = const Value.absent(),
    String? description,
    DateTime? createdAt,
  }) => AuditLogRecord(
    id: id ?? this.id,
    action: action ?? this.action,
    entityType: entityType ?? this.entityType,
    entityId: entityId.present ? entityId.value : this.entityId,
    description: description ?? this.description,
    createdAt: createdAt ?? this.createdAt,
  );
  AuditLogRecord copyWithCompanion(AuditLogsCompanion data) {
    return AuditLogRecord(
      id: data.id.present ? data.id.value : this.id,
      action: data.action.present ? data.action.value : this.action,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      description: data.description.present
          ? data.description.value
          : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogRecord(')
          ..write('id: $id, ')
          ..write('action: $action, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, action, entityType, entityId, description, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuditLogRecord &&
          other.id == this.id &&
          other.action == this.action &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.description == this.description &&
          other.createdAt == this.createdAt);
}

class AuditLogsCompanion extends UpdateCompanion<AuditLogRecord> {
  final Value<int> id;
  final Value<String> action;
  final Value<String> entityType;
  final Value<int?> entityId;
  final Value<String> description;
  final Value<DateTime> createdAt;
  const AuditLogsCompanion({
    this.id = const Value.absent(),
    this.action = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AuditLogsCompanion.insert({
    this.id = const Value.absent(),
    required String action,
    required String entityType,
    this.entityId = const Value.absent(),
    required String description,
    this.createdAt = const Value.absent(),
  }) : action = Value(action),
       entityType = Value(entityType),
       description = Value(description);
  static Insertable<AuditLogRecord> custom({
    Expression<int>? id,
    Expression<String>? action,
    Expression<String>? entityType,
    Expression<int>? entityId,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (action != null) 'action': action,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AuditLogsCompanion copyWith({
    Value<int>? id,
    Value<String>? action,
    Value<String>? entityType,
    Value<int?>? entityId,
    Value<String>? description,
    Value<DateTime>? createdAt,
  }) {
    return AuditLogsCompanion(
      id: id ?? this.id,
      action: action ?? this.action,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<int>(entityId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogsCompanion(')
          ..write('id: $id, ')
          ..write('action: $action, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PropertiesTable properties = $PropertiesTable(this);
  late final $TenantsTable tenants = $TenantsTable(this);
  late final $ContractsTable contracts = $ContractsTable(this);
  late final $PaymentsTable payments = $PaymentsTable(this);
  late final $UtilityBillsTable utilityBills = $UtilityBillsTable(this);
  late final $UnitsTable units = $UnitsTable(this);
  late final $RentSchedulesTable rentSchedules = $RentSchedulesTable(this);
  late final $ExpensesTable expenses = $ExpensesTable(this);
  late final $AttachmentsTable attachments = $AttachmentsTable(this);
  late final $MaintenanceTicketsTable maintenanceTickets =
      $MaintenanceTicketsTable(this);
  late final $MessageTemplatesTable messageTemplates = $MessageTemplatesTable(
    this,
  );
  late final $MessageLogsTable messageLogs = $MessageLogsTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $AuditLogsTable auditLogs = $AuditLogsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    properties,
    tenants,
    contracts,
    payments,
    utilityBills,
    units,
    rentSchedules,
    expenses,
    attachments,
    maintenanceTickets,
    messageTemplates,
    messageLogs,
    settings,
    auditLogs,
  ];
}

typedef $$PropertiesTableCreateCompanionBuilder =
    PropertiesCompanion Function({
      Value<int> id,
      required String name,
      required String address,
      Value<String> type,
      Value<String?> ownerName,
      Value<int> units,
      Value<int> floors,
      Value<int> unitsPerFloor,
      Value<int> shops,
      Value<int> occupiedUnits,
      Value<double> monthlyIncome,
      Value<String> electricityServiceMode,
      Value<String> waterServiceMode,
      Value<String> gasServiceMode,
      Value<String?> imagePath,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$PropertiesTableUpdateCompanionBuilder =
    PropertiesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> address,
      Value<String> type,
      Value<String?> ownerName,
      Value<int> units,
      Value<int> floors,
      Value<int> unitsPerFloor,
      Value<int> shops,
      Value<int> occupiedUnits,
      Value<double> monthlyIncome,
      Value<String> electricityServiceMode,
      Value<String> waterServiceMode,
      Value<String> gasServiceMode,
      Value<String?> imagePath,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$PropertiesTableReferences
    extends BaseReferences<_$AppDatabase, $PropertiesTable, PropertyRecord> {
  $$PropertiesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TenantsTable, List<TenantRecord>>
  _tenantsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.tenants,
    aliasName: $_aliasNameGenerator(db.properties.id, db.tenants.propertyId),
  );

  $$TenantsTableProcessedTableManager get tenantsRefs {
    final manager = $$TenantsTableTableManager(
      $_db,
      $_db.tenants,
    ).filter((f) => f.propertyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_tenantsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ContractsTable, List<ContractRecord>>
  _contractsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.contracts,
    aliasName: $_aliasNameGenerator(db.properties.id, db.contracts.propertyId),
  );

  $$ContractsTableProcessedTableManager get contractsRefs {
    final manager = $$ContractsTableTableManager(
      $_db,
      $_db.contracts,
    ).filter((f) => f.propertyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_contractsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PaymentsTable, List<PaymentRecord>>
  _paymentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.payments,
    aliasName: $_aliasNameGenerator(db.properties.id, db.payments.propertyId),
  );

  $$PaymentsTableProcessedTableManager get paymentsRefs {
    final manager = $$PaymentsTableTableManager(
      $_db,
      $_db.payments,
    ).filter((f) => f.propertyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_paymentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UtilityBillsTable, List<UtilityBillRecord>>
  _utilityBillsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.utilityBills,
    aliasName: $_aliasNameGenerator(
      db.properties.id,
      db.utilityBills.propertyId,
    ),
  );

  $$UtilityBillsTableProcessedTableManager get utilityBillsRefs {
    final manager = $$UtilityBillsTableTableManager(
      $_db,
      $_db.utilityBills,
    ).filter((f) => f.propertyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_utilityBillsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UnitsTable, List<UnitRecord>> _unitsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.units,
    aliasName: $_aliasNameGenerator(db.properties.id, db.units.propertyId),
  );

  $$UnitsTableProcessedTableManager get unitsRefs {
    final manager = $$UnitsTableTableManager(
      $_db,
      $_db.units,
    ).filter((f) => f.propertyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_unitsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RentSchedulesTable, List<RentScheduleRecord>>
  _rentSchedulesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.rentSchedules,
    aliasName: $_aliasNameGenerator(
      db.properties.id,
      db.rentSchedules.propertyId,
    ),
  );

  $$RentSchedulesTableProcessedTableManager get rentSchedulesRefs {
    final manager = $$RentSchedulesTableTableManager(
      $_db,
      $_db.rentSchedules,
    ).filter((f) => f.propertyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_rentSchedulesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ExpensesTable, List<ExpenseRecord>>
  _expensesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.expenses,
    aliasName: $_aliasNameGenerator(db.properties.id, db.expenses.propertyId),
  );

  $$ExpensesTableProcessedTableManager get expensesRefs {
    final manager = $$ExpensesTableTableManager(
      $_db,
      $_db.expenses,
    ).filter((f) => f.propertyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_expensesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $MaintenanceTicketsTable,
    List<MaintenanceTicketRecord>
  >
  _maintenanceTicketsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.maintenanceTickets,
        aliasName: $_aliasNameGenerator(
          db.properties.id,
          db.maintenanceTickets.propertyId,
        ),
      );

  $$MaintenanceTicketsTableProcessedTableManager get maintenanceTicketsRefs {
    final manager = $$MaintenanceTicketsTableTableManager(
      $_db,
      $_db.maintenanceTickets,
    ).filter((f) => f.propertyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _maintenanceTicketsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PropertiesTableFilterComposer
    extends Composer<_$AppDatabase, $PropertiesTable> {
  $$PropertiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerName => $composableBuilder(
    column: $table.ownerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get units => $composableBuilder(
    column: $table.units,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get floors => $composableBuilder(
    column: $table.floors,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitsPerFloor => $composableBuilder(
    column: $table.unitsPerFloor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get shops => $composableBuilder(
    column: $table.shops,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get occupiedUnits => $composableBuilder(
    column: $table.occupiedUnits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get monthlyIncome => $composableBuilder(
    column: $table.monthlyIncome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get electricityServiceMode => $composableBuilder(
    column: $table.electricityServiceMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get waterServiceMode => $composableBuilder(
    column: $table.waterServiceMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gasServiceMode => $composableBuilder(
    column: $table.gasServiceMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> tenantsRefs(
    Expression<bool> Function($$TenantsTableFilterComposer f) f,
  ) {
    final $$TenantsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.propertyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableFilterComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> contractsRefs(
    Expression<bool> Function($$ContractsTableFilterComposer f) f,
  ) {
    final $$ContractsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.contracts,
      getReferencedColumn: (t) => t.propertyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContractsTableFilterComposer(
            $db: $db,
            $table: $db.contracts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> paymentsRefs(
    Expression<bool> Function($$PaymentsTableFilterComposer f) f,
  ) {
    final $$PaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.propertyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableFilterComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> utilityBillsRefs(
    Expression<bool> Function($$UtilityBillsTableFilterComposer f) f,
  ) {
    final $$UtilityBillsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.utilityBills,
      getReferencedColumn: (t) => t.propertyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UtilityBillsTableFilterComposer(
            $db: $db,
            $table: $db.utilityBills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> unitsRefs(
    Expression<bool> Function($$UnitsTableFilterComposer f) f,
  ) {
    final $$UnitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.propertyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableFilterComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> rentSchedulesRefs(
    Expression<bool> Function($$RentSchedulesTableFilterComposer f) f,
  ) {
    final $$RentSchedulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rentSchedules,
      getReferencedColumn: (t) => t.propertyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RentSchedulesTableFilterComposer(
            $db: $db,
            $table: $db.rentSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> expensesRefs(
    Expression<bool> Function($$ExpensesTableFilterComposer f) f,
  ) {
    final $$ExpensesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.expenses,
      getReferencedColumn: (t) => t.propertyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExpensesTableFilterComposer(
            $db: $db,
            $table: $db.expenses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> maintenanceTicketsRefs(
    Expression<bool> Function($$MaintenanceTicketsTableFilterComposer f) f,
  ) {
    final $$MaintenanceTicketsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.maintenanceTickets,
      getReferencedColumn: (t) => t.propertyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MaintenanceTicketsTableFilterComposer(
            $db: $db,
            $table: $db.maintenanceTickets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PropertiesTableOrderingComposer
    extends Composer<_$AppDatabase, $PropertiesTable> {
  $$PropertiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerName => $composableBuilder(
    column: $table.ownerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get units => $composableBuilder(
    column: $table.units,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get floors => $composableBuilder(
    column: $table.floors,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitsPerFloor => $composableBuilder(
    column: $table.unitsPerFloor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get shops => $composableBuilder(
    column: $table.shops,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get occupiedUnits => $composableBuilder(
    column: $table.occupiedUnits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get monthlyIncome => $composableBuilder(
    column: $table.monthlyIncome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get electricityServiceMode => $composableBuilder(
    column: $table.electricityServiceMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get waterServiceMode => $composableBuilder(
    column: $table.waterServiceMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gasServiceMode => $composableBuilder(
    column: $table.gasServiceMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PropertiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PropertiesTable> {
  $$PropertiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get ownerName =>
      $composableBuilder(column: $table.ownerName, builder: (column) => column);

  GeneratedColumn<int> get units =>
      $composableBuilder(column: $table.units, builder: (column) => column);

  GeneratedColumn<int> get floors =>
      $composableBuilder(column: $table.floors, builder: (column) => column);

  GeneratedColumn<int> get unitsPerFloor => $composableBuilder(
    column: $table.unitsPerFloor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get shops =>
      $composableBuilder(column: $table.shops, builder: (column) => column);

  GeneratedColumn<int> get occupiedUnits => $composableBuilder(
    column: $table.occupiedUnits,
    builder: (column) => column,
  );

  GeneratedColumn<double> get monthlyIncome => $composableBuilder(
    column: $table.monthlyIncome,
    builder: (column) => column,
  );

  GeneratedColumn<String> get electricityServiceMode => $composableBuilder(
    column: $table.electricityServiceMode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get waterServiceMode => $composableBuilder(
    column: $table.waterServiceMode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get gasServiceMode => $composableBuilder(
    column: $table.gasServiceMode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> tenantsRefs<T extends Object>(
    Expression<T> Function($$TenantsTableAnnotationComposer a) f,
  ) {
    final $$TenantsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.propertyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableAnnotationComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> contractsRefs<T extends Object>(
    Expression<T> Function($$ContractsTableAnnotationComposer a) f,
  ) {
    final $$ContractsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.contracts,
      getReferencedColumn: (t) => t.propertyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContractsTableAnnotationComposer(
            $db: $db,
            $table: $db.contracts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> paymentsRefs<T extends Object>(
    Expression<T> Function($$PaymentsTableAnnotationComposer a) f,
  ) {
    final $$PaymentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.propertyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableAnnotationComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> utilityBillsRefs<T extends Object>(
    Expression<T> Function($$UtilityBillsTableAnnotationComposer a) f,
  ) {
    final $$UtilityBillsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.utilityBills,
      getReferencedColumn: (t) => t.propertyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UtilityBillsTableAnnotationComposer(
            $db: $db,
            $table: $db.utilityBills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> unitsRefs<T extends Object>(
    Expression<T> Function($$UnitsTableAnnotationComposer a) f,
  ) {
    final $$UnitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.propertyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableAnnotationComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> rentSchedulesRefs<T extends Object>(
    Expression<T> Function($$RentSchedulesTableAnnotationComposer a) f,
  ) {
    final $$RentSchedulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rentSchedules,
      getReferencedColumn: (t) => t.propertyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RentSchedulesTableAnnotationComposer(
            $db: $db,
            $table: $db.rentSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> expensesRefs<T extends Object>(
    Expression<T> Function($$ExpensesTableAnnotationComposer a) f,
  ) {
    final $$ExpensesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.expenses,
      getReferencedColumn: (t) => t.propertyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExpensesTableAnnotationComposer(
            $db: $db,
            $table: $db.expenses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> maintenanceTicketsRefs<T extends Object>(
    Expression<T> Function($$MaintenanceTicketsTableAnnotationComposer a) f,
  ) {
    final $$MaintenanceTicketsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.maintenanceTickets,
          getReferencedColumn: (t) => t.propertyId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MaintenanceTicketsTableAnnotationComposer(
                $db: $db,
                $table: $db.maintenanceTickets,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PropertiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PropertiesTable,
          PropertyRecord,
          $$PropertiesTableFilterComposer,
          $$PropertiesTableOrderingComposer,
          $$PropertiesTableAnnotationComposer,
          $$PropertiesTableCreateCompanionBuilder,
          $$PropertiesTableUpdateCompanionBuilder,
          (PropertyRecord, $$PropertiesTableReferences),
          PropertyRecord,
          PrefetchHooks Function({
            bool tenantsRefs,
            bool contractsRefs,
            bool paymentsRefs,
            bool utilityBillsRefs,
            bool unitsRefs,
            bool rentSchedulesRefs,
            bool expensesRefs,
            bool maintenanceTicketsRefs,
          })
        > {
  $$PropertiesTableTableManager(_$AppDatabase db, $PropertiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PropertiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PropertiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PropertiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String?> ownerName = const Value.absent(),
                Value<int> units = const Value.absent(),
                Value<int> floors = const Value.absent(),
                Value<int> unitsPerFloor = const Value.absent(),
                Value<int> shops = const Value.absent(),
                Value<int> occupiedUnits = const Value.absent(),
                Value<double> monthlyIncome = const Value.absent(),
                Value<String> electricityServiceMode = const Value.absent(),
                Value<String> waterServiceMode = const Value.absent(),
                Value<String> gasServiceMode = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => PropertiesCompanion(
                id: id,
                name: name,
                address: address,
                type: type,
                ownerName: ownerName,
                units: units,
                floors: floors,
                unitsPerFloor: unitsPerFloor,
                shops: shops,
                occupiedUnits: occupiedUnits,
                monthlyIncome: monthlyIncome,
                electricityServiceMode: electricityServiceMode,
                waterServiceMode: waterServiceMode,
                gasServiceMode: gasServiceMode,
                imagePath: imagePath,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String address,
                Value<String> type = const Value.absent(),
                Value<String?> ownerName = const Value.absent(),
                Value<int> units = const Value.absent(),
                Value<int> floors = const Value.absent(),
                Value<int> unitsPerFloor = const Value.absent(),
                Value<int> shops = const Value.absent(),
                Value<int> occupiedUnits = const Value.absent(),
                Value<double> monthlyIncome = const Value.absent(),
                Value<String> electricityServiceMode = const Value.absent(),
                Value<String> waterServiceMode = const Value.absent(),
                Value<String> gasServiceMode = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => PropertiesCompanion.insert(
                id: id,
                name: name,
                address: address,
                type: type,
                ownerName: ownerName,
                units: units,
                floors: floors,
                unitsPerFloor: unitsPerFloor,
                shops: shops,
                occupiedUnits: occupiedUnits,
                monthlyIncome: monthlyIncome,
                electricityServiceMode: electricityServiceMode,
                waterServiceMode: waterServiceMode,
                gasServiceMode: gasServiceMode,
                imagePath: imagePath,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PropertiesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                tenantsRefs = false,
                contractsRefs = false,
                paymentsRefs = false,
                utilityBillsRefs = false,
                unitsRefs = false,
                rentSchedulesRefs = false,
                expensesRefs = false,
                maintenanceTicketsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (tenantsRefs) db.tenants,
                    if (contractsRefs) db.contracts,
                    if (paymentsRefs) db.payments,
                    if (utilityBillsRefs) db.utilityBills,
                    if (unitsRefs) db.units,
                    if (rentSchedulesRefs) db.rentSchedules,
                    if (expensesRefs) db.expenses,
                    if (maintenanceTicketsRefs) db.maintenanceTickets,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (tenantsRefs)
                        await $_getPrefetchedData<
                          PropertyRecord,
                          $PropertiesTable,
                          TenantRecord
                        >(
                          currentTable: table,
                          referencedTable: $$PropertiesTableReferences
                              ._tenantsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PropertiesTableReferences(
                                db,
                                table,
                                p0,
                              ).tenantsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.propertyId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (contractsRefs)
                        await $_getPrefetchedData<
                          PropertyRecord,
                          $PropertiesTable,
                          ContractRecord
                        >(
                          currentTable: table,
                          referencedTable: $$PropertiesTableReferences
                              ._contractsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PropertiesTableReferences(
                                db,
                                table,
                                p0,
                              ).contractsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.propertyId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (paymentsRefs)
                        await $_getPrefetchedData<
                          PropertyRecord,
                          $PropertiesTable,
                          PaymentRecord
                        >(
                          currentTable: table,
                          referencedTable: $$PropertiesTableReferences
                              ._paymentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PropertiesTableReferences(
                                db,
                                table,
                                p0,
                              ).paymentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.propertyId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (utilityBillsRefs)
                        await $_getPrefetchedData<
                          PropertyRecord,
                          $PropertiesTable,
                          UtilityBillRecord
                        >(
                          currentTable: table,
                          referencedTable: $$PropertiesTableReferences
                              ._utilityBillsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PropertiesTableReferences(
                                db,
                                table,
                                p0,
                              ).utilityBillsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.propertyId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (unitsRefs)
                        await $_getPrefetchedData<
                          PropertyRecord,
                          $PropertiesTable,
                          UnitRecord
                        >(
                          currentTable: table,
                          referencedTable: $$PropertiesTableReferences
                              ._unitsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PropertiesTableReferences(
                                db,
                                table,
                                p0,
                              ).unitsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.propertyId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (rentSchedulesRefs)
                        await $_getPrefetchedData<
                          PropertyRecord,
                          $PropertiesTable,
                          RentScheduleRecord
                        >(
                          currentTable: table,
                          referencedTable: $$PropertiesTableReferences
                              ._rentSchedulesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PropertiesTableReferences(
                                db,
                                table,
                                p0,
                              ).rentSchedulesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.propertyId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (expensesRefs)
                        await $_getPrefetchedData<
                          PropertyRecord,
                          $PropertiesTable,
                          ExpenseRecord
                        >(
                          currentTable: table,
                          referencedTable: $$PropertiesTableReferences
                              ._expensesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PropertiesTableReferences(
                                db,
                                table,
                                p0,
                              ).expensesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.propertyId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (maintenanceTicketsRefs)
                        await $_getPrefetchedData<
                          PropertyRecord,
                          $PropertiesTable,
                          MaintenanceTicketRecord
                        >(
                          currentTable: table,
                          referencedTable: $$PropertiesTableReferences
                              ._maintenanceTicketsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PropertiesTableReferences(
                                db,
                                table,
                                p0,
                              ).maintenanceTicketsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.propertyId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PropertiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PropertiesTable,
      PropertyRecord,
      $$PropertiesTableFilterComposer,
      $$PropertiesTableOrderingComposer,
      $$PropertiesTableAnnotationComposer,
      $$PropertiesTableCreateCompanionBuilder,
      $$PropertiesTableUpdateCompanionBuilder,
      (PropertyRecord, $$PropertiesTableReferences),
      PropertyRecord,
      PrefetchHooks Function({
        bool tenantsRefs,
        bool contractsRefs,
        bool paymentsRefs,
        bool utilityBillsRefs,
        bool unitsRefs,
        bool rentSchedulesRefs,
        bool expensesRefs,
        bool maintenanceTicketsRefs,
      })
    >;
typedef $$TenantsTableCreateCompanionBuilder =
    TenantsCompanion Function({
      Value<int> id,
      required String name,
      required String phone,
      Value<String?> email,
      Value<String?> nationalId,
      Value<String?> address,
      Value<String?> notes,
      Value<String> status,
      Value<double> balance,
      Value<double> accumulatedDebt,
      Value<double> securityDeposit,
      Value<String> rentalType,
      Value<double> waterBill,
      Value<double> electricityBill,
      required int propertyId,
      required String propertyName,
      required String unitId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$TenantsTableUpdateCompanionBuilder =
    TenantsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> phone,
      Value<String?> email,
      Value<String?> nationalId,
      Value<String?> address,
      Value<String?> notes,
      Value<String> status,
      Value<double> balance,
      Value<double> accumulatedDebt,
      Value<double> securityDeposit,
      Value<String> rentalType,
      Value<double> waterBill,
      Value<double> electricityBill,
      Value<int> propertyId,
      Value<String> propertyName,
      Value<String> unitId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$TenantsTableReferences
    extends BaseReferences<_$AppDatabase, $TenantsTable, TenantRecord> {
  $$TenantsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PropertiesTable _propertyIdTable(_$AppDatabase db) =>
      db.properties.createAlias(
        $_aliasNameGenerator(db.tenants.propertyId, db.properties.id),
      );

  $$PropertiesTableProcessedTableManager get propertyId {
    final $_column = $_itemColumn<int>('property_id')!;

    final manager = $$PropertiesTableTableManager(
      $_db,
      $_db.properties,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_propertyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ContractsTable, List<ContractRecord>>
  _contractsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.contracts,
    aliasName: $_aliasNameGenerator(db.tenants.id, db.contracts.tenantId),
  );

  $$ContractsTableProcessedTableManager get contractsRefs {
    final manager = $$ContractsTableTableManager(
      $_db,
      $_db.contracts,
    ).filter((f) => f.tenantId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_contractsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PaymentsTable, List<PaymentRecord>>
  _paymentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.payments,
    aliasName: $_aliasNameGenerator(db.tenants.id, db.payments.tenantId),
  );

  $$PaymentsTableProcessedTableManager get paymentsRefs {
    final manager = $$PaymentsTableTableManager(
      $_db,
      $_db.payments,
    ).filter((f) => f.tenantId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_paymentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UtilityBillsTable, List<UtilityBillRecord>>
  _utilityBillsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.utilityBills,
    aliasName: $_aliasNameGenerator(db.tenants.id, db.utilityBills.tenantId),
  );

  $$UtilityBillsTableProcessedTableManager get utilityBillsRefs {
    final manager = $$UtilityBillsTableTableManager(
      $_db,
      $_db.utilityBills,
    ).filter((f) => f.tenantId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_utilityBillsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UnitsTable, List<UnitRecord>> _unitsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.units,
    aliasName: $_aliasNameGenerator(db.tenants.id, db.units.tenantId),
  );

  $$UnitsTableProcessedTableManager get unitsRefs {
    final manager = $$UnitsTableTableManager(
      $_db,
      $_db.units,
    ).filter((f) => f.tenantId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_unitsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RentSchedulesTable, List<RentScheduleRecord>>
  _rentSchedulesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.rentSchedules,
    aliasName: $_aliasNameGenerator(db.tenants.id, db.rentSchedules.tenantId),
  );

  $$RentSchedulesTableProcessedTableManager get rentSchedulesRefs {
    final manager = $$RentSchedulesTableTableManager(
      $_db,
      $_db.rentSchedules,
    ).filter((f) => f.tenantId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_rentSchedulesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $MaintenanceTicketsTable,
    List<MaintenanceTicketRecord>
  >
  _maintenanceTicketsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.maintenanceTickets,
        aliasName: $_aliasNameGenerator(
          db.tenants.id,
          db.maintenanceTickets.tenantId,
        ),
      );

  $$MaintenanceTicketsTableProcessedTableManager get maintenanceTicketsRefs {
    final manager = $$MaintenanceTicketsTableTableManager(
      $_db,
      $_db.maintenanceTickets,
    ).filter((f) => f.tenantId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _maintenanceTicketsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MessageLogsTable, List<MessageLogRecord>>
  _messageLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.messageLogs,
    aliasName: $_aliasNameGenerator(db.tenants.id, db.messageLogs.tenantId),
  );

  $$MessageLogsTableProcessedTableManager get messageLogsRefs {
    final manager = $$MessageLogsTableTableManager(
      $_db,
      $_db.messageLogs,
    ).filter((f) => f.tenantId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_messageLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TenantsTableFilterComposer
    extends Composer<_$AppDatabase, $TenantsTable> {
  $$TenantsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nationalId => $composableBuilder(
    column: $table.nationalId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get accumulatedDebt => $composableBuilder(
    column: $table.accumulatedDebt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get securityDeposit => $composableBuilder(
    column: $table.securityDeposit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rentalType => $composableBuilder(
    column: $table.rentalType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get waterBill => $composableBuilder(
    column: $table.waterBill,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get electricityBill => $composableBuilder(
    column: $table.electricityBill,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PropertiesTableFilterComposer get propertyId {
    final $$PropertiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableFilterComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> contractsRefs(
    Expression<bool> Function($$ContractsTableFilterComposer f) f,
  ) {
    final $$ContractsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.contracts,
      getReferencedColumn: (t) => t.tenantId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContractsTableFilterComposer(
            $db: $db,
            $table: $db.contracts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> paymentsRefs(
    Expression<bool> Function($$PaymentsTableFilterComposer f) f,
  ) {
    final $$PaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.tenantId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableFilterComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> utilityBillsRefs(
    Expression<bool> Function($$UtilityBillsTableFilterComposer f) f,
  ) {
    final $$UtilityBillsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.utilityBills,
      getReferencedColumn: (t) => t.tenantId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UtilityBillsTableFilterComposer(
            $db: $db,
            $table: $db.utilityBills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> unitsRefs(
    Expression<bool> Function($$UnitsTableFilterComposer f) f,
  ) {
    final $$UnitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.tenantId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableFilterComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> rentSchedulesRefs(
    Expression<bool> Function($$RentSchedulesTableFilterComposer f) f,
  ) {
    final $$RentSchedulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rentSchedules,
      getReferencedColumn: (t) => t.tenantId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RentSchedulesTableFilterComposer(
            $db: $db,
            $table: $db.rentSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> maintenanceTicketsRefs(
    Expression<bool> Function($$MaintenanceTicketsTableFilterComposer f) f,
  ) {
    final $$MaintenanceTicketsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.maintenanceTickets,
      getReferencedColumn: (t) => t.tenantId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MaintenanceTicketsTableFilterComposer(
            $db: $db,
            $table: $db.maintenanceTickets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> messageLogsRefs(
    Expression<bool> Function($$MessageLogsTableFilterComposer f) f,
  ) {
    final $$MessageLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.messageLogs,
      getReferencedColumn: (t) => t.tenantId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessageLogsTableFilterComposer(
            $db: $db,
            $table: $db.messageLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TenantsTableOrderingComposer
    extends Composer<_$AppDatabase, $TenantsTable> {
  $$TenantsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nationalId => $composableBuilder(
    column: $table.nationalId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get accumulatedDebt => $composableBuilder(
    column: $table.accumulatedDebt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get securityDeposit => $composableBuilder(
    column: $table.securityDeposit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rentalType => $composableBuilder(
    column: $table.rentalType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get waterBill => $composableBuilder(
    column: $table.waterBill,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get electricityBill => $composableBuilder(
    column: $table.electricityBill,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PropertiesTableOrderingComposer get propertyId {
    final $$PropertiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableOrderingComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TenantsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TenantsTable> {
  $$TenantsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get nationalId => $composableBuilder(
    column: $table.nationalId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get balance =>
      $composableBuilder(column: $table.balance, builder: (column) => column);

  GeneratedColumn<double> get accumulatedDebt => $composableBuilder(
    column: $table.accumulatedDebt,
    builder: (column) => column,
  );

  GeneratedColumn<double> get securityDeposit => $composableBuilder(
    column: $table.securityDeposit,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rentalType => $composableBuilder(
    column: $table.rentalType,
    builder: (column) => column,
  );

  GeneratedColumn<double> get waterBill =>
      $composableBuilder(column: $table.waterBill, builder: (column) => column);

  GeneratedColumn<double> get electricityBill => $composableBuilder(
    column: $table.electricityBill,
    builder: (column) => column,
  );

  GeneratedColumn<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$PropertiesTableAnnotationComposer get propertyId {
    final $$PropertiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableAnnotationComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> contractsRefs<T extends Object>(
    Expression<T> Function($$ContractsTableAnnotationComposer a) f,
  ) {
    final $$ContractsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.contracts,
      getReferencedColumn: (t) => t.tenantId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContractsTableAnnotationComposer(
            $db: $db,
            $table: $db.contracts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> paymentsRefs<T extends Object>(
    Expression<T> Function($$PaymentsTableAnnotationComposer a) f,
  ) {
    final $$PaymentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.tenantId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableAnnotationComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> utilityBillsRefs<T extends Object>(
    Expression<T> Function($$UtilityBillsTableAnnotationComposer a) f,
  ) {
    final $$UtilityBillsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.utilityBills,
      getReferencedColumn: (t) => t.tenantId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UtilityBillsTableAnnotationComposer(
            $db: $db,
            $table: $db.utilityBills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> unitsRefs<T extends Object>(
    Expression<T> Function($$UnitsTableAnnotationComposer a) f,
  ) {
    final $$UnitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.tenantId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableAnnotationComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> rentSchedulesRefs<T extends Object>(
    Expression<T> Function($$RentSchedulesTableAnnotationComposer a) f,
  ) {
    final $$RentSchedulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rentSchedules,
      getReferencedColumn: (t) => t.tenantId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RentSchedulesTableAnnotationComposer(
            $db: $db,
            $table: $db.rentSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> maintenanceTicketsRefs<T extends Object>(
    Expression<T> Function($$MaintenanceTicketsTableAnnotationComposer a) f,
  ) {
    final $$MaintenanceTicketsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.maintenanceTickets,
          getReferencedColumn: (t) => t.tenantId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MaintenanceTicketsTableAnnotationComposer(
                $db: $db,
                $table: $db.maintenanceTickets,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> messageLogsRefs<T extends Object>(
    Expression<T> Function($$MessageLogsTableAnnotationComposer a) f,
  ) {
    final $$MessageLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.messageLogs,
      getReferencedColumn: (t) => t.tenantId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessageLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.messageLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TenantsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TenantsTable,
          TenantRecord,
          $$TenantsTableFilterComposer,
          $$TenantsTableOrderingComposer,
          $$TenantsTableAnnotationComposer,
          $$TenantsTableCreateCompanionBuilder,
          $$TenantsTableUpdateCompanionBuilder,
          (TenantRecord, $$TenantsTableReferences),
          TenantRecord,
          PrefetchHooks Function({
            bool propertyId,
            bool contractsRefs,
            bool paymentsRefs,
            bool utilityBillsRefs,
            bool unitsRefs,
            bool rentSchedulesRefs,
            bool maintenanceTicketsRefs,
            bool messageLogsRefs,
          })
        > {
  $$TenantsTableTableManager(_$AppDatabase db, $TenantsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TenantsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TenantsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TenantsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> nationalId = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<double> balance = const Value.absent(),
                Value<double> accumulatedDebt = const Value.absent(),
                Value<double> securityDeposit = const Value.absent(),
                Value<String> rentalType = const Value.absent(),
                Value<double> waterBill = const Value.absent(),
                Value<double> electricityBill = const Value.absent(),
                Value<int> propertyId = const Value.absent(),
                Value<String> propertyName = const Value.absent(),
                Value<String> unitId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => TenantsCompanion(
                id: id,
                name: name,
                phone: phone,
                email: email,
                nationalId: nationalId,
                address: address,
                notes: notes,
                status: status,
                balance: balance,
                accumulatedDebt: accumulatedDebt,
                securityDeposit: securityDeposit,
                rentalType: rentalType,
                waterBill: waterBill,
                electricityBill: electricityBill,
                propertyId: propertyId,
                propertyName: propertyName,
                unitId: unitId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String phone,
                Value<String?> email = const Value.absent(),
                Value<String?> nationalId = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<double> balance = const Value.absent(),
                Value<double> accumulatedDebt = const Value.absent(),
                Value<double> securityDeposit = const Value.absent(),
                Value<String> rentalType = const Value.absent(),
                Value<double> waterBill = const Value.absent(),
                Value<double> electricityBill = const Value.absent(),
                required int propertyId,
                required String propertyName,
                required String unitId,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => TenantsCompanion.insert(
                id: id,
                name: name,
                phone: phone,
                email: email,
                nationalId: nationalId,
                address: address,
                notes: notes,
                status: status,
                balance: balance,
                accumulatedDebt: accumulatedDebt,
                securityDeposit: securityDeposit,
                rentalType: rentalType,
                waterBill: waterBill,
                electricityBill: electricityBill,
                propertyId: propertyId,
                propertyName: propertyName,
                unitId: unitId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TenantsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                propertyId = false,
                contractsRefs = false,
                paymentsRefs = false,
                utilityBillsRefs = false,
                unitsRefs = false,
                rentSchedulesRefs = false,
                maintenanceTicketsRefs = false,
                messageLogsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (contractsRefs) db.contracts,
                    if (paymentsRefs) db.payments,
                    if (utilityBillsRefs) db.utilityBills,
                    if (unitsRefs) db.units,
                    if (rentSchedulesRefs) db.rentSchedules,
                    if (maintenanceTicketsRefs) db.maintenanceTickets,
                    if (messageLogsRefs) db.messageLogs,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (propertyId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.propertyId,
                                    referencedTable: $$TenantsTableReferences
                                        ._propertyIdTable(db),
                                    referencedColumn: $$TenantsTableReferences
                                        ._propertyIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (contractsRefs)
                        await $_getPrefetchedData<
                          TenantRecord,
                          $TenantsTable,
                          ContractRecord
                        >(
                          currentTable: table,
                          referencedTable: $$TenantsTableReferences
                              ._contractsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TenantsTableReferences(
                                db,
                                table,
                                p0,
                              ).contractsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tenantId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (paymentsRefs)
                        await $_getPrefetchedData<
                          TenantRecord,
                          $TenantsTable,
                          PaymentRecord
                        >(
                          currentTable: table,
                          referencedTable: $$TenantsTableReferences
                              ._paymentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TenantsTableReferences(
                                db,
                                table,
                                p0,
                              ).paymentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tenantId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (utilityBillsRefs)
                        await $_getPrefetchedData<
                          TenantRecord,
                          $TenantsTable,
                          UtilityBillRecord
                        >(
                          currentTable: table,
                          referencedTable: $$TenantsTableReferences
                              ._utilityBillsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TenantsTableReferences(
                                db,
                                table,
                                p0,
                              ).utilityBillsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tenantId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (unitsRefs)
                        await $_getPrefetchedData<
                          TenantRecord,
                          $TenantsTable,
                          UnitRecord
                        >(
                          currentTable: table,
                          referencedTable: $$TenantsTableReferences
                              ._unitsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TenantsTableReferences(db, table, p0).unitsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tenantId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (rentSchedulesRefs)
                        await $_getPrefetchedData<
                          TenantRecord,
                          $TenantsTable,
                          RentScheduleRecord
                        >(
                          currentTable: table,
                          referencedTable: $$TenantsTableReferences
                              ._rentSchedulesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TenantsTableReferences(
                                db,
                                table,
                                p0,
                              ).rentSchedulesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tenantId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (maintenanceTicketsRefs)
                        await $_getPrefetchedData<
                          TenantRecord,
                          $TenantsTable,
                          MaintenanceTicketRecord
                        >(
                          currentTable: table,
                          referencedTable: $$TenantsTableReferences
                              ._maintenanceTicketsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TenantsTableReferences(
                                db,
                                table,
                                p0,
                              ).maintenanceTicketsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tenantId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (messageLogsRefs)
                        await $_getPrefetchedData<
                          TenantRecord,
                          $TenantsTable,
                          MessageLogRecord
                        >(
                          currentTable: table,
                          referencedTable: $$TenantsTableReferences
                              ._messageLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TenantsTableReferences(
                                db,
                                table,
                                p0,
                              ).messageLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tenantId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TenantsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TenantsTable,
      TenantRecord,
      $$TenantsTableFilterComposer,
      $$TenantsTableOrderingComposer,
      $$TenantsTableAnnotationComposer,
      $$TenantsTableCreateCompanionBuilder,
      $$TenantsTableUpdateCompanionBuilder,
      (TenantRecord, $$TenantsTableReferences),
      TenantRecord,
      PrefetchHooks Function({
        bool propertyId,
        bool contractsRefs,
        bool paymentsRefs,
        bool utilityBillsRefs,
        bool unitsRefs,
        bool rentSchedulesRefs,
        bool maintenanceTicketsRefs,
        bool messageLogsRefs,
      })
    >;
typedef $$ContractsTableCreateCompanionBuilder =
    ContractsCompanion Function({
      Value<int> id,
      required int tenantId,
      required int propertyId,
      Value<String> contractNo,
      required String landlordName,
      required String tenantName,
      required String propertyName,
      Value<String> unitId,
      required DateTime startDate,
      required DateTime endDate,
      required double rentAmount,
      Value<String> currency,
      Value<String> paymentFrequency,
      Value<double> securityDepositAmount,
      Value<String> status,
      Value<String?> customTerms,
      Value<String> renewalStatus,
      required String content,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$ContractsTableUpdateCompanionBuilder =
    ContractsCompanion Function({
      Value<int> id,
      Value<int> tenantId,
      Value<int> propertyId,
      Value<String> contractNo,
      Value<String> landlordName,
      Value<String> tenantName,
      Value<String> propertyName,
      Value<String> unitId,
      Value<DateTime> startDate,
      Value<DateTime> endDate,
      Value<double> rentAmount,
      Value<String> currency,
      Value<String> paymentFrequency,
      Value<double> securityDepositAmount,
      Value<String> status,
      Value<String?> customTerms,
      Value<String> renewalStatus,
      Value<String> content,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$ContractsTableReferences
    extends BaseReferences<_$AppDatabase, $ContractsTable, ContractRecord> {
  $$ContractsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TenantsTable _tenantIdTable(_$AppDatabase db) => db.tenants
      .createAlias($_aliasNameGenerator(db.contracts.tenantId, db.tenants.id));

  $$TenantsTableProcessedTableManager get tenantId {
    final $_column = $_itemColumn<int>('tenant_id')!;

    final manager = $$TenantsTableTableManager(
      $_db,
      $_db.tenants,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tenantIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PropertiesTable _propertyIdTable(_$AppDatabase db) =>
      db.properties.createAlias(
        $_aliasNameGenerator(db.contracts.propertyId, db.properties.id),
      );

  $$PropertiesTableProcessedTableManager get propertyId {
    final $_column = $_itemColumn<int>('property_id')!;

    final manager = $$PropertiesTableTableManager(
      $_db,
      $_db.properties,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_propertyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$RentSchedulesTable, List<RentScheduleRecord>>
  _rentSchedulesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.rentSchedules,
    aliasName: $_aliasNameGenerator(
      db.contracts.id,
      db.rentSchedules.contractId,
    ),
  );

  $$RentSchedulesTableProcessedTableManager get rentSchedulesRefs {
    final manager = $$RentSchedulesTableTableManager(
      $_db,
      $_db.rentSchedules,
    ).filter((f) => f.contractId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_rentSchedulesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ContractsTableFilterComposer
    extends Composer<_$AppDatabase, $ContractsTable> {
  $$ContractsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contractNo => $composableBuilder(
    column: $table.contractNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get landlordName => $composableBuilder(
    column: $table.landlordName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenantName => $composableBuilder(
    column: $table.tenantName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rentAmount => $composableBuilder(
    column: $table.rentAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentFrequency => $composableBuilder(
    column: $table.paymentFrequency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get securityDepositAmount => $composableBuilder(
    column: $table.securityDepositAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customTerms => $composableBuilder(
    column: $table.customTerms,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get renewalStatus => $composableBuilder(
    column: $table.renewalStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$TenantsTableFilterComposer get tenantId {
    final $$TenantsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableFilterComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PropertiesTableFilterComposer get propertyId {
    final $$PropertiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableFilterComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> rentSchedulesRefs(
    Expression<bool> Function($$RentSchedulesTableFilterComposer f) f,
  ) {
    final $$RentSchedulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rentSchedules,
      getReferencedColumn: (t) => t.contractId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RentSchedulesTableFilterComposer(
            $db: $db,
            $table: $db.rentSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ContractsTableOrderingComposer
    extends Composer<_$AppDatabase, $ContractsTable> {
  $$ContractsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contractNo => $composableBuilder(
    column: $table.contractNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get landlordName => $composableBuilder(
    column: $table.landlordName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenantName => $composableBuilder(
    column: $table.tenantName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rentAmount => $composableBuilder(
    column: $table.rentAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentFrequency => $composableBuilder(
    column: $table.paymentFrequency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get securityDepositAmount => $composableBuilder(
    column: $table.securityDepositAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customTerms => $composableBuilder(
    column: $table.customTerms,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get renewalStatus => $composableBuilder(
    column: $table.renewalStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TenantsTableOrderingComposer get tenantId {
    final $$TenantsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableOrderingComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PropertiesTableOrderingComposer get propertyId {
    final $$PropertiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableOrderingComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ContractsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContractsTable> {
  $$ContractsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get contractNo => $composableBuilder(
    column: $table.contractNo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get landlordName => $composableBuilder(
    column: $table.landlordName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tenantName => $composableBuilder(
    column: $table.tenantName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<double> get rentAmount => $composableBuilder(
    column: $table.rentAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<String> get paymentFrequency => $composableBuilder(
    column: $table.paymentFrequency,
    builder: (column) => column,
  );

  GeneratedColumn<double> get securityDepositAmount => $composableBuilder(
    column: $table.securityDepositAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get customTerms => $composableBuilder(
    column: $table.customTerms,
    builder: (column) => column,
  );

  GeneratedColumn<String> get renewalStatus => $composableBuilder(
    column: $table.renewalStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$TenantsTableAnnotationComposer get tenantId {
    final $$TenantsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableAnnotationComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PropertiesTableAnnotationComposer get propertyId {
    final $$PropertiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableAnnotationComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> rentSchedulesRefs<T extends Object>(
    Expression<T> Function($$RentSchedulesTableAnnotationComposer a) f,
  ) {
    final $$RentSchedulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rentSchedules,
      getReferencedColumn: (t) => t.contractId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RentSchedulesTableAnnotationComposer(
            $db: $db,
            $table: $db.rentSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ContractsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ContractsTable,
          ContractRecord,
          $$ContractsTableFilterComposer,
          $$ContractsTableOrderingComposer,
          $$ContractsTableAnnotationComposer,
          $$ContractsTableCreateCompanionBuilder,
          $$ContractsTableUpdateCompanionBuilder,
          (ContractRecord, $$ContractsTableReferences),
          ContractRecord,
          PrefetchHooks Function({
            bool tenantId,
            bool propertyId,
            bool rentSchedulesRefs,
          })
        > {
  $$ContractsTableTableManager(_$AppDatabase db, $ContractsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContractsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContractsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContractsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> tenantId = const Value.absent(),
                Value<int> propertyId = const Value.absent(),
                Value<String> contractNo = const Value.absent(),
                Value<String> landlordName = const Value.absent(),
                Value<String> tenantName = const Value.absent(),
                Value<String> propertyName = const Value.absent(),
                Value<String> unitId = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime> endDate = const Value.absent(),
                Value<double> rentAmount = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<String> paymentFrequency = const Value.absent(),
                Value<double> securityDepositAmount = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> customTerms = const Value.absent(),
                Value<String> renewalStatus = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ContractsCompanion(
                id: id,
                tenantId: tenantId,
                propertyId: propertyId,
                contractNo: contractNo,
                landlordName: landlordName,
                tenantName: tenantName,
                propertyName: propertyName,
                unitId: unitId,
                startDate: startDate,
                endDate: endDate,
                rentAmount: rentAmount,
                currency: currency,
                paymentFrequency: paymentFrequency,
                securityDepositAmount: securityDepositAmount,
                status: status,
                customTerms: customTerms,
                renewalStatus: renewalStatus,
                content: content,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int tenantId,
                required int propertyId,
                Value<String> contractNo = const Value.absent(),
                required String landlordName,
                required String tenantName,
                required String propertyName,
                Value<String> unitId = const Value.absent(),
                required DateTime startDate,
                required DateTime endDate,
                required double rentAmount,
                Value<String> currency = const Value.absent(),
                Value<String> paymentFrequency = const Value.absent(),
                Value<double> securityDepositAmount = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> customTerms = const Value.absent(),
                Value<String> renewalStatus = const Value.absent(),
                required String content,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ContractsCompanion.insert(
                id: id,
                tenantId: tenantId,
                propertyId: propertyId,
                contractNo: contractNo,
                landlordName: landlordName,
                tenantName: tenantName,
                propertyName: propertyName,
                unitId: unitId,
                startDate: startDate,
                endDate: endDate,
                rentAmount: rentAmount,
                currency: currency,
                paymentFrequency: paymentFrequency,
                securityDepositAmount: securityDepositAmount,
                status: status,
                customTerms: customTerms,
                renewalStatus: renewalStatus,
                content: content,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ContractsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                tenantId = false,
                propertyId = false,
                rentSchedulesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (rentSchedulesRefs) db.rentSchedules,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (tenantId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.tenantId,
                                    referencedTable: $$ContractsTableReferences
                                        ._tenantIdTable(db),
                                    referencedColumn: $$ContractsTableReferences
                                        ._tenantIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (propertyId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.propertyId,
                                    referencedTable: $$ContractsTableReferences
                                        ._propertyIdTable(db),
                                    referencedColumn: $$ContractsTableReferences
                                        ._propertyIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (rentSchedulesRefs)
                        await $_getPrefetchedData<
                          ContractRecord,
                          $ContractsTable,
                          RentScheduleRecord
                        >(
                          currentTable: table,
                          referencedTable: $$ContractsTableReferences
                              ._rentSchedulesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ContractsTableReferences(
                                db,
                                table,
                                p0,
                              ).rentSchedulesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.contractId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ContractsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ContractsTable,
      ContractRecord,
      $$ContractsTableFilterComposer,
      $$ContractsTableOrderingComposer,
      $$ContractsTableAnnotationComposer,
      $$ContractsTableCreateCompanionBuilder,
      $$ContractsTableUpdateCompanionBuilder,
      (ContractRecord, $$ContractsTableReferences),
      ContractRecord,
      PrefetchHooks Function({
        bool tenantId,
        bool propertyId,
        bool rentSchedulesRefs,
      })
    >;
typedef $$PaymentsTableCreateCompanionBuilder =
    PaymentsCompanion Function({
      Value<int> id,
      required int tenantId,
      required String tenantName,
      required String tenantPhone,
      required int propertyId,
      required String propertyName,
      required double amount,
      Value<String> currency,
      required DateTime date,
      Value<String> method,
      Value<String> status,
      required String receiptNo,
      Value<int?> dueScheduleId,
      Value<String> messageStatus,
      Value<String?> notes,
      Value<DateTime> createdAt,
    });
typedef $$PaymentsTableUpdateCompanionBuilder =
    PaymentsCompanion Function({
      Value<int> id,
      Value<int> tenantId,
      Value<String> tenantName,
      Value<String> tenantPhone,
      Value<int> propertyId,
      Value<String> propertyName,
      Value<double> amount,
      Value<String> currency,
      Value<DateTime> date,
      Value<String> method,
      Value<String> status,
      Value<String> receiptNo,
      Value<int?> dueScheduleId,
      Value<String> messageStatus,
      Value<String?> notes,
      Value<DateTime> createdAt,
    });

final class $$PaymentsTableReferences
    extends BaseReferences<_$AppDatabase, $PaymentsTable, PaymentRecord> {
  $$PaymentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TenantsTable _tenantIdTable(_$AppDatabase db) => db.tenants
      .createAlias($_aliasNameGenerator(db.payments.tenantId, db.tenants.id));

  $$TenantsTableProcessedTableManager get tenantId {
    final $_column = $_itemColumn<int>('tenant_id')!;

    final manager = $$TenantsTableTableManager(
      $_db,
      $_db.tenants,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tenantIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PropertiesTable _propertyIdTable(_$AppDatabase db) =>
      db.properties.createAlias(
        $_aliasNameGenerator(db.payments.propertyId, db.properties.id),
      );

  $$PropertiesTableProcessedTableManager get propertyId {
    final $_column = $_itemColumn<int>('property_id')!;

    final manager = $$PropertiesTableTableManager(
      $_db,
      $_db.properties,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_propertyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$UtilityBillsTable, List<UtilityBillRecord>>
  _utilityBillsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.utilityBills,
    aliasName: $_aliasNameGenerator(db.payments.id, db.utilityBills.paymentId),
  );

  $$UtilityBillsTableProcessedTableManager get utilityBillsRefs {
    final manager = $$UtilityBillsTableTableManager(
      $_db,
      $_db.utilityBills,
    ).filter((f) => f.paymentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_utilityBillsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RentSchedulesTable, List<RentScheduleRecord>>
  _rentSchedulesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.rentSchedules,
    aliasName: $_aliasNameGenerator(db.payments.id, db.rentSchedules.paymentId),
  );

  $$RentSchedulesTableProcessedTableManager get rentSchedulesRefs {
    final manager = $$RentSchedulesTableTableManager(
      $_db,
      $_db.rentSchedules,
    ).filter((f) => f.paymentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_rentSchedulesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PaymentsTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenantName => $composableBuilder(
    column: $table.tenantName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenantPhone => $composableBuilder(
    column: $table.tenantPhone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get receiptNo => $composableBuilder(
    column: $table.receiptNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dueScheduleId => $composableBuilder(
    column: $table.dueScheduleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get messageStatus => $composableBuilder(
    column: $table.messageStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$TenantsTableFilterComposer get tenantId {
    final $$TenantsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableFilterComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PropertiesTableFilterComposer get propertyId {
    final $$PropertiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableFilterComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> utilityBillsRefs(
    Expression<bool> Function($$UtilityBillsTableFilterComposer f) f,
  ) {
    final $$UtilityBillsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.utilityBills,
      getReferencedColumn: (t) => t.paymentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UtilityBillsTableFilterComposer(
            $db: $db,
            $table: $db.utilityBills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> rentSchedulesRefs(
    Expression<bool> Function($$RentSchedulesTableFilterComposer f) f,
  ) {
    final $$RentSchedulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rentSchedules,
      getReferencedColumn: (t) => t.paymentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RentSchedulesTableFilterComposer(
            $db: $db,
            $table: $db.rentSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PaymentsTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenantName => $composableBuilder(
    column: $table.tenantName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenantPhone => $composableBuilder(
    column: $table.tenantPhone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get receiptNo => $composableBuilder(
    column: $table.receiptNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dueScheduleId => $composableBuilder(
    column: $table.dueScheduleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get messageStatus => $composableBuilder(
    column: $table.messageStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TenantsTableOrderingComposer get tenantId {
    final $$TenantsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableOrderingComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PropertiesTableOrderingComposer get propertyId {
    final $$PropertiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableOrderingComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PaymentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tenantName => $composableBuilder(
    column: $table.tenantName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tenantPhone => $composableBuilder(
    column: $table.tenantPhone,
    builder: (column) => column,
  );

  GeneratedColumn<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => column,
  );

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get method =>
      $composableBuilder(column: $table.method, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get receiptNo =>
      $composableBuilder(column: $table.receiptNo, builder: (column) => column);

  GeneratedColumn<int> get dueScheduleId => $composableBuilder(
    column: $table.dueScheduleId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get messageStatus => $composableBuilder(
    column: $table.messageStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$TenantsTableAnnotationComposer get tenantId {
    final $$TenantsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableAnnotationComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PropertiesTableAnnotationComposer get propertyId {
    final $$PropertiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableAnnotationComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> utilityBillsRefs<T extends Object>(
    Expression<T> Function($$UtilityBillsTableAnnotationComposer a) f,
  ) {
    final $$UtilityBillsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.utilityBills,
      getReferencedColumn: (t) => t.paymentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UtilityBillsTableAnnotationComposer(
            $db: $db,
            $table: $db.utilityBills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> rentSchedulesRefs<T extends Object>(
    Expression<T> Function($$RentSchedulesTableAnnotationComposer a) f,
  ) {
    final $$RentSchedulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rentSchedules,
      getReferencedColumn: (t) => t.paymentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RentSchedulesTableAnnotationComposer(
            $db: $db,
            $table: $db.rentSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PaymentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PaymentsTable,
          PaymentRecord,
          $$PaymentsTableFilterComposer,
          $$PaymentsTableOrderingComposer,
          $$PaymentsTableAnnotationComposer,
          $$PaymentsTableCreateCompanionBuilder,
          $$PaymentsTableUpdateCompanionBuilder,
          (PaymentRecord, $$PaymentsTableReferences),
          PaymentRecord,
          PrefetchHooks Function({
            bool tenantId,
            bool propertyId,
            bool utilityBillsRefs,
            bool rentSchedulesRefs,
          })
        > {
  $$PaymentsTableTableManager(_$AppDatabase db, $PaymentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> tenantId = const Value.absent(),
                Value<String> tenantName = const Value.absent(),
                Value<String> tenantPhone = const Value.absent(),
                Value<int> propertyId = const Value.absent(),
                Value<String> propertyName = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> method = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> receiptNo = const Value.absent(),
                Value<int?> dueScheduleId = const Value.absent(),
                Value<String> messageStatus = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PaymentsCompanion(
                id: id,
                tenantId: tenantId,
                tenantName: tenantName,
                tenantPhone: tenantPhone,
                propertyId: propertyId,
                propertyName: propertyName,
                amount: amount,
                currency: currency,
                date: date,
                method: method,
                status: status,
                receiptNo: receiptNo,
                dueScheduleId: dueScheduleId,
                messageStatus: messageStatus,
                notes: notes,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int tenantId,
                required String tenantName,
                required String tenantPhone,
                required int propertyId,
                required String propertyName,
                required double amount,
                Value<String> currency = const Value.absent(),
                required DateTime date,
                Value<String> method = const Value.absent(),
                Value<String> status = const Value.absent(),
                required String receiptNo,
                Value<int?> dueScheduleId = const Value.absent(),
                Value<String> messageStatus = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PaymentsCompanion.insert(
                id: id,
                tenantId: tenantId,
                tenantName: tenantName,
                tenantPhone: tenantPhone,
                propertyId: propertyId,
                propertyName: propertyName,
                amount: amount,
                currency: currency,
                date: date,
                method: method,
                status: status,
                receiptNo: receiptNo,
                dueScheduleId: dueScheduleId,
                messageStatus: messageStatus,
                notes: notes,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PaymentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                tenantId = false,
                propertyId = false,
                utilityBillsRefs = false,
                rentSchedulesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (utilityBillsRefs) db.utilityBills,
                    if (rentSchedulesRefs) db.rentSchedules,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (tenantId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.tenantId,
                                    referencedTable: $$PaymentsTableReferences
                                        ._tenantIdTable(db),
                                    referencedColumn: $$PaymentsTableReferences
                                        ._tenantIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (propertyId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.propertyId,
                                    referencedTable: $$PaymentsTableReferences
                                        ._propertyIdTable(db),
                                    referencedColumn: $$PaymentsTableReferences
                                        ._propertyIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (utilityBillsRefs)
                        await $_getPrefetchedData<
                          PaymentRecord,
                          $PaymentsTable,
                          UtilityBillRecord
                        >(
                          currentTable: table,
                          referencedTable: $$PaymentsTableReferences
                              ._utilityBillsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PaymentsTableReferences(
                                db,
                                table,
                                p0,
                              ).utilityBillsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.paymentId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (rentSchedulesRefs)
                        await $_getPrefetchedData<
                          PaymentRecord,
                          $PaymentsTable,
                          RentScheduleRecord
                        >(
                          currentTable: table,
                          referencedTable: $$PaymentsTableReferences
                              ._rentSchedulesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PaymentsTableReferences(
                                db,
                                table,
                                p0,
                              ).rentSchedulesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.paymentId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PaymentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PaymentsTable,
      PaymentRecord,
      $$PaymentsTableFilterComposer,
      $$PaymentsTableOrderingComposer,
      $$PaymentsTableAnnotationComposer,
      $$PaymentsTableCreateCompanionBuilder,
      $$PaymentsTableUpdateCompanionBuilder,
      (PaymentRecord, $$PaymentsTableReferences),
      PaymentRecord,
      PrefetchHooks Function({
        bool tenantId,
        bool propertyId,
        bool utilityBillsRefs,
        bool rentSchedulesRefs,
      })
    >;
typedef $$UtilityBillsTableCreateCompanionBuilder =
    UtilityBillsCompanion Function({
      Value<int> id,
      Value<int?> tenantId,
      Value<String?> tenantName,
      required int propertyId,
      required String propertyName,
      required String unitId,
      required String type,
      required DateTime periodStart,
      required DateTime periodEnd,
      Value<double> consumption,
      Value<double> rate,
      Value<double> amount,
      Value<String> meterOwnership,
      Value<String?> meterNo,
      Value<double> previousReading,
      Value<double> currentReading,
      Value<bool> chargeToTenant,
      Value<bool> paidExternally,
      Value<String?> proofPath,
      Value<String> status,
      Value<int?> paymentId,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$UtilityBillsTableUpdateCompanionBuilder =
    UtilityBillsCompanion Function({
      Value<int> id,
      Value<int?> tenantId,
      Value<String?> tenantName,
      Value<int> propertyId,
      Value<String> propertyName,
      Value<String> unitId,
      Value<String> type,
      Value<DateTime> periodStart,
      Value<DateTime> periodEnd,
      Value<double> consumption,
      Value<double> rate,
      Value<double> amount,
      Value<String> meterOwnership,
      Value<String?> meterNo,
      Value<double> previousReading,
      Value<double> currentReading,
      Value<bool> chargeToTenant,
      Value<bool> paidExternally,
      Value<String?> proofPath,
      Value<String> status,
      Value<int?> paymentId,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$UtilityBillsTableReferences
    extends
        BaseReferences<_$AppDatabase, $UtilityBillsTable, UtilityBillRecord> {
  $$UtilityBillsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TenantsTable _tenantIdTable(_$AppDatabase db) =>
      db.tenants.createAlias(
        $_aliasNameGenerator(db.utilityBills.tenantId, db.tenants.id),
      );

  $$TenantsTableProcessedTableManager? get tenantId {
    final $_column = $_itemColumn<int>('tenant_id');
    if ($_column == null) return null;
    final manager = $$TenantsTableTableManager(
      $_db,
      $_db.tenants,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tenantIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PropertiesTable _propertyIdTable(_$AppDatabase db) =>
      db.properties.createAlias(
        $_aliasNameGenerator(db.utilityBills.propertyId, db.properties.id),
      );

  $$PropertiesTableProcessedTableManager get propertyId {
    final $_column = $_itemColumn<int>('property_id')!;

    final manager = $$PropertiesTableTableManager(
      $_db,
      $_db.properties,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_propertyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PaymentsTable _paymentIdTable(_$AppDatabase db) =>
      db.payments.createAlias(
        $_aliasNameGenerator(db.utilityBills.paymentId, db.payments.id),
      );

  $$PaymentsTableProcessedTableManager? get paymentId {
    final $_column = $_itemColumn<int>('payment_id');
    if ($_column == null) return null;
    final manager = $$PaymentsTableTableManager(
      $_db,
      $_db.payments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_paymentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UtilityBillsTableFilterComposer
    extends Composer<_$AppDatabase, $UtilityBillsTable> {
  $$UtilityBillsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenantName => $composableBuilder(
    column: $table.tenantName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get periodStart => $composableBuilder(
    column: $table.periodStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get periodEnd => $composableBuilder(
    column: $table.periodEnd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get consumption => $composableBuilder(
    column: $table.consumption,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rate => $composableBuilder(
    column: $table.rate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get meterOwnership => $composableBuilder(
    column: $table.meterOwnership,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get meterNo => $composableBuilder(
    column: $table.meterNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get previousReading => $composableBuilder(
    column: $table.previousReading,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get currentReading => $composableBuilder(
    column: $table.currentReading,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get chargeToTenant => $composableBuilder(
    column: $table.chargeToTenant,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get paidExternally => $composableBuilder(
    column: $table.paidExternally,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get proofPath => $composableBuilder(
    column: $table.proofPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$TenantsTableFilterComposer get tenantId {
    final $$TenantsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableFilterComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PropertiesTableFilterComposer get propertyId {
    final $$PropertiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableFilterComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PaymentsTableFilterComposer get paymentId {
    final $$PaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentId,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableFilterComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UtilityBillsTableOrderingComposer
    extends Composer<_$AppDatabase, $UtilityBillsTable> {
  $$UtilityBillsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenantName => $composableBuilder(
    column: $table.tenantName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get periodStart => $composableBuilder(
    column: $table.periodStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get periodEnd => $composableBuilder(
    column: $table.periodEnd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get consumption => $composableBuilder(
    column: $table.consumption,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rate => $composableBuilder(
    column: $table.rate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meterOwnership => $composableBuilder(
    column: $table.meterOwnership,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meterNo => $composableBuilder(
    column: $table.meterNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get previousReading => $composableBuilder(
    column: $table.previousReading,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get currentReading => $composableBuilder(
    column: $table.currentReading,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get chargeToTenant => $composableBuilder(
    column: $table.chargeToTenant,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get paidExternally => $composableBuilder(
    column: $table.paidExternally,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get proofPath => $composableBuilder(
    column: $table.proofPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TenantsTableOrderingComposer get tenantId {
    final $$TenantsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableOrderingComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PropertiesTableOrderingComposer get propertyId {
    final $$PropertiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableOrderingComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PaymentsTableOrderingComposer get paymentId {
    final $$PaymentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentId,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableOrderingComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UtilityBillsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UtilityBillsTable> {
  $$UtilityBillsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tenantName => $composableBuilder(
    column: $table.tenantName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get periodStart => $composableBuilder(
    column: $table.periodStart,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get periodEnd =>
      $composableBuilder(column: $table.periodEnd, builder: (column) => column);

  GeneratedColumn<double> get consumption => $composableBuilder(
    column: $table.consumption,
    builder: (column) => column,
  );

  GeneratedColumn<double> get rate =>
      $composableBuilder(column: $table.rate, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get meterOwnership => $composableBuilder(
    column: $table.meterOwnership,
    builder: (column) => column,
  );

  GeneratedColumn<String> get meterNo =>
      $composableBuilder(column: $table.meterNo, builder: (column) => column);

  GeneratedColumn<double> get previousReading => $composableBuilder(
    column: $table.previousReading,
    builder: (column) => column,
  );

  GeneratedColumn<double> get currentReading => $composableBuilder(
    column: $table.currentReading,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get chargeToTenant => $composableBuilder(
    column: $table.chargeToTenant,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get paidExternally => $composableBuilder(
    column: $table.paidExternally,
    builder: (column) => column,
  );

  GeneratedColumn<String> get proofPath =>
      $composableBuilder(column: $table.proofPath, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$TenantsTableAnnotationComposer get tenantId {
    final $$TenantsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableAnnotationComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PropertiesTableAnnotationComposer get propertyId {
    final $$PropertiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableAnnotationComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PaymentsTableAnnotationComposer get paymentId {
    final $$PaymentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentId,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableAnnotationComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UtilityBillsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UtilityBillsTable,
          UtilityBillRecord,
          $$UtilityBillsTableFilterComposer,
          $$UtilityBillsTableOrderingComposer,
          $$UtilityBillsTableAnnotationComposer,
          $$UtilityBillsTableCreateCompanionBuilder,
          $$UtilityBillsTableUpdateCompanionBuilder,
          (UtilityBillRecord, $$UtilityBillsTableReferences),
          UtilityBillRecord,
          PrefetchHooks Function({
            bool tenantId,
            bool propertyId,
            bool paymentId,
          })
        > {
  $$UtilityBillsTableTableManager(_$AppDatabase db, $UtilityBillsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UtilityBillsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UtilityBillsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UtilityBillsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> tenantId = const Value.absent(),
                Value<String?> tenantName = const Value.absent(),
                Value<int> propertyId = const Value.absent(),
                Value<String> propertyName = const Value.absent(),
                Value<String> unitId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<DateTime> periodStart = const Value.absent(),
                Value<DateTime> periodEnd = const Value.absent(),
                Value<double> consumption = const Value.absent(),
                Value<double> rate = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> meterOwnership = const Value.absent(),
                Value<String?> meterNo = const Value.absent(),
                Value<double> previousReading = const Value.absent(),
                Value<double> currentReading = const Value.absent(),
                Value<bool> chargeToTenant = const Value.absent(),
                Value<bool> paidExternally = const Value.absent(),
                Value<String?> proofPath = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int?> paymentId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UtilityBillsCompanion(
                id: id,
                tenantId: tenantId,
                tenantName: tenantName,
                propertyId: propertyId,
                propertyName: propertyName,
                unitId: unitId,
                type: type,
                periodStart: periodStart,
                periodEnd: periodEnd,
                consumption: consumption,
                rate: rate,
                amount: amount,
                meterOwnership: meterOwnership,
                meterNo: meterNo,
                previousReading: previousReading,
                currentReading: currentReading,
                chargeToTenant: chargeToTenant,
                paidExternally: paidExternally,
                proofPath: proofPath,
                status: status,
                paymentId: paymentId,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> tenantId = const Value.absent(),
                Value<String?> tenantName = const Value.absent(),
                required int propertyId,
                required String propertyName,
                required String unitId,
                required String type,
                required DateTime periodStart,
                required DateTime periodEnd,
                Value<double> consumption = const Value.absent(),
                Value<double> rate = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> meterOwnership = const Value.absent(),
                Value<String?> meterNo = const Value.absent(),
                Value<double> previousReading = const Value.absent(),
                Value<double> currentReading = const Value.absent(),
                Value<bool> chargeToTenant = const Value.absent(),
                Value<bool> paidExternally = const Value.absent(),
                Value<String?> proofPath = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int?> paymentId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UtilityBillsCompanion.insert(
                id: id,
                tenantId: tenantId,
                tenantName: tenantName,
                propertyId: propertyId,
                propertyName: propertyName,
                unitId: unitId,
                type: type,
                periodStart: periodStart,
                periodEnd: periodEnd,
                consumption: consumption,
                rate: rate,
                amount: amount,
                meterOwnership: meterOwnership,
                meterNo: meterNo,
                previousReading: previousReading,
                currentReading: currentReading,
                chargeToTenant: chargeToTenant,
                paidExternally: paidExternally,
                proofPath: proofPath,
                status: status,
                paymentId: paymentId,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UtilityBillsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({tenantId = false, propertyId = false, paymentId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (tenantId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.tenantId,
                                    referencedTable:
                                        $$UtilityBillsTableReferences
                                            ._tenantIdTable(db),
                                    referencedColumn:
                                        $$UtilityBillsTableReferences
                                            ._tenantIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (propertyId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.propertyId,
                                    referencedTable:
                                        $$UtilityBillsTableReferences
                                            ._propertyIdTable(db),
                                    referencedColumn:
                                        $$UtilityBillsTableReferences
                                            ._propertyIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (paymentId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.paymentId,
                                    referencedTable:
                                        $$UtilityBillsTableReferences
                                            ._paymentIdTable(db),
                                    referencedColumn:
                                        $$UtilityBillsTableReferences
                                            ._paymentIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$UtilityBillsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UtilityBillsTable,
      UtilityBillRecord,
      $$UtilityBillsTableFilterComposer,
      $$UtilityBillsTableOrderingComposer,
      $$UtilityBillsTableAnnotationComposer,
      $$UtilityBillsTableCreateCompanionBuilder,
      $$UtilityBillsTableUpdateCompanionBuilder,
      (UtilityBillRecord, $$UtilityBillsTableReferences),
      UtilityBillRecord,
      PrefetchHooks Function({bool tenantId, bool propertyId, bool paymentId})
    >;
typedef $$UnitsTableCreateCompanionBuilder =
    UnitsCompanion Function({
      Value<int> id,
      required int propertyId,
      required String propertyName,
      required String unitNo,
      Value<String?> floor,
      Value<String> type,
      Value<String> status,
      Value<double> expectedRent,
      Value<String> electricityServiceMode,
      Value<String?> electricityMeterNo,
      Value<String> waterServiceMode,
      Value<String?> waterMeterNo,
      Value<String> gasServiceMode,
      Value<String?> gasMeterNo,
      Value<int?> tenantId,
      Value<String?> tenantName,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$UnitsTableUpdateCompanionBuilder =
    UnitsCompanion Function({
      Value<int> id,
      Value<int> propertyId,
      Value<String> propertyName,
      Value<String> unitNo,
      Value<String?> floor,
      Value<String> type,
      Value<String> status,
      Value<double> expectedRent,
      Value<String> electricityServiceMode,
      Value<String?> electricityMeterNo,
      Value<String> waterServiceMode,
      Value<String?> waterMeterNo,
      Value<String> gasServiceMode,
      Value<String?> gasMeterNo,
      Value<int?> tenantId,
      Value<String?> tenantName,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$UnitsTableReferences
    extends BaseReferences<_$AppDatabase, $UnitsTable, UnitRecord> {
  $$UnitsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PropertiesTable _propertyIdTable(_$AppDatabase db) => db.properties
      .createAlias($_aliasNameGenerator(db.units.propertyId, db.properties.id));

  $$PropertiesTableProcessedTableManager get propertyId {
    final $_column = $_itemColumn<int>('property_id')!;

    final manager = $$PropertiesTableTableManager(
      $_db,
      $_db.properties,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_propertyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TenantsTable _tenantIdTable(_$AppDatabase db) => db.tenants
      .createAlias($_aliasNameGenerator(db.units.tenantId, db.tenants.id));

  $$TenantsTableProcessedTableManager? get tenantId {
    final $_column = $_itemColumn<int>('tenant_id');
    if ($_column == null) return null;
    final manager = $$TenantsTableTableManager(
      $_db,
      $_db.tenants,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tenantIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UnitsTableFilterComposer extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitNo => $composableBuilder(
    column: $table.unitNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get floor => $composableBuilder(
    column: $table.floor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get expectedRent => $composableBuilder(
    column: $table.expectedRent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get electricityServiceMode => $composableBuilder(
    column: $table.electricityServiceMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get electricityMeterNo => $composableBuilder(
    column: $table.electricityMeterNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get waterServiceMode => $composableBuilder(
    column: $table.waterServiceMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get waterMeterNo => $composableBuilder(
    column: $table.waterMeterNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gasServiceMode => $composableBuilder(
    column: $table.gasServiceMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gasMeterNo => $composableBuilder(
    column: $table.gasMeterNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenantName => $composableBuilder(
    column: $table.tenantName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PropertiesTableFilterComposer get propertyId {
    final $$PropertiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableFilterComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TenantsTableFilterComposer get tenantId {
    final $$TenantsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableFilterComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnitsTableOrderingComposer
    extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitNo => $composableBuilder(
    column: $table.unitNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get floor => $composableBuilder(
    column: $table.floor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get expectedRent => $composableBuilder(
    column: $table.expectedRent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get electricityServiceMode => $composableBuilder(
    column: $table.electricityServiceMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get electricityMeterNo => $composableBuilder(
    column: $table.electricityMeterNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get waterServiceMode => $composableBuilder(
    column: $table.waterServiceMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get waterMeterNo => $composableBuilder(
    column: $table.waterMeterNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gasServiceMode => $composableBuilder(
    column: $table.gasServiceMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gasMeterNo => $composableBuilder(
    column: $table.gasMeterNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenantName => $composableBuilder(
    column: $table.tenantName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PropertiesTableOrderingComposer get propertyId {
    final $$PropertiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableOrderingComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TenantsTableOrderingComposer get tenantId {
    final $$TenantsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableOrderingComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unitNo =>
      $composableBuilder(column: $table.unitNo, builder: (column) => column);

  GeneratedColumn<String> get floor =>
      $composableBuilder(column: $table.floor, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get expectedRent => $composableBuilder(
    column: $table.expectedRent,
    builder: (column) => column,
  );

  GeneratedColumn<String> get electricityServiceMode => $composableBuilder(
    column: $table.electricityServiceMode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get electricityMeterNo => $composableBuilder(
    column: $table.electricityMeterNo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get waterServiceMode => $composableBuilder(
    column: $table.waterServiceMode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get waterMeterNo => $composableBuilder(
    column: $table.waterMeterNo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get gasServiceMode => $composableBuilder(
    column: $table.gasServiceMode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get gasMeterNo => $composableBuilder(
    column: $table.gasMeterNo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tenantName => $composableBuilder(
    column: $table.tenantName,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$PropertiesTableAnnotationComposer get propertyId {
    final $$PropertiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableAnnotationComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TenantsTableAnnotationComposer get tenantId {
    final $$TenantsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableAnnotationComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UnitsTable,
          UnitRecord,
          $$UnitsTableFilterComposer,
          $$UnitsTableOrderingComposer,
          $$UnitsTableAnnotationComposer,
          $$UnitsTableCreateCompanionBuilder,
          $$UnitsTableUpdateCompanionBuilder,
          (UnitRecord, $$UnitsTableReferences),
          UnitRecord,
          PrefetchHooks Function({bool propertyId, bool tenantId})
        > {
  $$UnitsTableTableManager(_$AppDatabase db, $UnitsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UnitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UnitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UnitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> propertyId = const Value.absent(),
                Value<String> propertyName = const Value.absent(),
                Value<String> unitNo = const Value.absent(),
                Value<String?> floor = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<double> expectedRent = const Value.absent(),
                Value<String> electricityServiceMode = const Value.absent(),
                Value<String?> electricityMeterNo = const Value.absent(),
                Value<String> waterServiceMode = const Value.absent(),
                Value<String?> waterMeterNo = const Value.absent(),
                Value<String> gasServiceMode = const Value.absent(),
                Value<String?> gasMeterNo = const Value.absent(),
                Value<int?> tenantId = const Value.absent(),
                Value<String?> tenantName = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UnitsCompanion(
                id: id,
                propertyId: propertyId,
                propertyName: propertyName,
                unitNo: unitNo,
                floor: floor,
                type: type,
                status: status,
                expectedRent: expectedRent,
                electricityServiceMode: electricityServiceMode,
                electricityMeterNo: electricityMeterNo,
                waterServiceMode: waterServiceMode,
                waterMeterNo: waterMeterNo,
                gasServiceMode: gasServiceMode,
                gasMeterNo: gasMeterNo,
                tenantId: tenantId,
                tenantName: tenantName,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int propertyId,
                required String propertyName,
                required String unitNo,
                Value<String?> floor = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<double> expectedRent = const Value.absent(),
                Value<String> electricityServiceMode = const Value.absent(),
                Value<String?> electricityMeterNo = const Value.absent(),
                Value<String> waterServiceMode = const Value.absent(),
                Value<String?> waterMeterNo = const Value.absent(),
                Value<String> gasServiceMode = const Value.absent(),
                Value<String?> gasMeterNo = const Value.absent(),
                Value<int?> tenantId = const Value.absent(),
                Value<String?> tenantName = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UnitsCompanion.insert(
                id: id,
                propertyId: propertyId,
                propertyName: propertyName,
                unitNo: unitNo,
                floor: floor,
                type: type,
                status: status,
                expectedRent: expectedRent,
                electricityServiceMode: electricityServiceMode,
                electricityMeterNo: electricityMeterNo,
                waterServiceMode: waterServiceMode,
                waterMeterNo: waterMeterNo,
                gasServiceMode: gasServiceMode,
                gasMeterNo: gasMeterNo,
                tenantId: tenantId,
                tenantName: tenantName,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UnitsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({propertyId = false, tenantId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (propertyId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.propertyId,
                                referencedTable: $$UnitsTableReferences
                                    ._propertyIdTable(db),
                                referencedColumn: $$UnitsTableReferences
                                    ._propertyIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (tenantId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tenantId,
                                referencedTable: $$UnitsTableReferences
                                    ._tenantIdTable(db),
                                referencedColumn: $$UnitsTableReferences
                                    ._tenantIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UnitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UnitsTable,
      UnitRecord,
      $$UnitsTableFilterComposer,
      $$UnitsTableOrderingComposer,
      $$UnitsTableAnnotationComposer,
      $$UnitsTableCreateCompanionBuilder,
      $$UnitsTableUpdateCompanionBuilder,
      (UnitRecord, $$UnitsTableReferences),
      UnitRecord,
      PrefetchHooks Function({bool propertyId, bool tenantId})
    >;
typedef $$RentSchedulesTableCreateCompanionBuilder =
    RentSchedulesCompanion Function({
      Value<int> id,
      required int contractId,
      required int tenantId,
      required int propertyId,
      required String tenantName,
      required String propertyName,
      required String unitId,
      required DateTime dueDate,
      required double amount,
      Value<double> paidAmount,
      Value<String> currency,
      Value<String> status,
      Value<int?> paymentId,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$RentSchedulesTableUpdateCompanionBuilder =
    RentSchedulesCompanion Function({
      Value<int> id,
      Value<int> contractId,
      Value<int> tenantId,
      Value<int> propertyId,
      Value<String> tenantName,
      Value<String> propertyName,
      Value<String> unitId,
      Value<DateTime> dueDate,
      Value<double> amount,
      Value<double> paidAmount,
      Value<String> currency,
      Value<String> status,
      Value<int?> paymentId,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$RentSchedulesTableReferences
    extends
        BaseReferences<_$AppDatabase, $RentSchedulesTable, RentScheduleRecord> {
  $$RentSchedulesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ContractsTable _contractIdTable(_$AppDatabase db) =>
      db.contracts.createAlias(
        $_aliasNameGenerator(db.rentSchedules.contractId, db.contracts.id),
      );

  $$ContractsTableProcessedTableManager get contractId {
    final $_column = $_itemColumn<int>('contract_id')!;

    final manager = $$ContractsTableTableManager(
      $_db,
      $_db.contracts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_contractIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TenantsTable _tenantIdTable(_$AppDatabase db) =>
      db.tenants.createAlias(
        $_aliasNameGenerator(db.rentSchedules.tenantId, db.tenants.id),
      );

  $$TenantsTableProcessedTableManager get tenantId {
    final $_column = $_itemColumn<int>('tenant_id')!;

    final manager = $$TenantsTableTableManager(
      $_db,
      $_db.tenants,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tenantIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PropertiesTable _propertyIdTable(_$AppDatabase db) =>
      db.properties.createAlias(
        $_aliasNameGenerator(db.rentSchedules.propertyId, db.properties.id),
      );

  $$PropertiesTableProcessedTableManager get propertyId {
    final $_column = $_itemColumn<int>('property_id')!;

    final manager = $$PropertiesTableTableManager(
      $_db,
      $_db.properties,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_propertyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PaymentsTable _paymentIdTable(_$AppDatabase db) =>
      db.payments.createAlias(
        $_aliasNameGenerator(db.rentSchedules.paymentId, db.payments.id),
      );

  $$PaymentsTableProcessedTableManager? get paymentId {
    final $_column = $_itemColumn<int>('payment_id');
    if ($_column == null) return null;
    final manager = $$PaymentsTableTableManager(
      $_db,
      $_db.payments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_paymentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RentSchedulesTableFilterComposer
    extends Composer<_$AppDatabase, $RentSchedulesTable> {
  $$RentSchedulesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenantName => $composableBuilder(
    column: $table.tenantName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get paidAmount => $composableBuilder(
    column: $table.paidAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ContractsTableFilterComposer get contractId {
    final $$ContractsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.contractId,
      referencedTable: $db.contracts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContractsTableFilterComposer(
            $db: $db,
            $table: $db.contracts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TenantsTableFilterComposer get tenantId {
    final $$TenantsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableFilterComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PropertiesTableFilterComposer get propertyId {
    final $$PropertiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableFilterComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PaymentsTableFilterComposer get paymentId {
    final $$PaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentId,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableFilterComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RentSchedulesTableOrderingComposer
    extends Composer<_$AppDatabase, $RentSchedulesTable> {
  $$RentSchedulesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenantName => $composableBuilder(
    column: $table.tenantName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get paidAmount => $composableBuilder(
    column: $table.paidAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ContractsTableOrderingComposer get contractId {
    final $$ContractsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.contractId,
      referencedTable: $db.contracts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContractsTableOrderingComposer(
            $db: $db,
            $table: $db.contracts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TenantsTableOrderingComposer get tenantId {
    final $$TenantsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableOrderingComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PropertiesTableOrderingComposer get propertyId {
    final $$PropertiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableOrderingComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PaymentsTableOrderingComposer get paymentId {
    final $$PaymentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentId,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableOrderingComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RentSchedulesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RentSchedulesTable> {
  $$RentSchedulesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tenantName => $composableBuilder(
    column: $table.tenantName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<double> get paidAmount => $composableBuilder(
    column: $table.paidAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ContractsTableAnnotationComposer get contractId {
    final $$ContractsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.contractId,
      referencedTable: $db.contracts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContractsTableAnnotationComposer(
            $db: $db,
            $table: $db.contracts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TenantsTableAnnotationComposer get tenantId {
    final $$TenantsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableAnnotationComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PropertiesTableAnnotationComposer get propertyId {
    final $$PropertiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableAnnotationComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PaymentsTableAnnotationComposer get paymentId {
    final $$PaymentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentId,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableAnnotationComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RentSchedulesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RentSchedulesTable,
          RentScheduleRecord,
          $$RentSchedulesTableFilterComposer,
          $$RentSchedulesTableOrderingComposer,
          $$RentSchedulesTableAnnotationComposer,
          $$RentSchedulesTableCreateCompanionBuilder,
          $$RentSchedulesTableUpdateCompanionBuilder,
          (RentScheduleRecord, $$RentSchedulesTableReferences),
          RentScheduleRecord,
          PrefetchHooks Function({
            bool contractId,
            bool tenantId,
            bool propertyId,
            bool paymentId,
          })
        > {
  $$RentSchedulesTableTableManager(_$AppDatabase db, $RentSchedulesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RentSchedulesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RentSchedulesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RentSchedulesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> contractId = const Value.absent(),
                Value<int> tenantId = const Value.absent(),
                Value<int> propertyId = const Value.absent(),
                Value<String> tenantName = const Value.absent(),
                Value<String> propertyName = const Value.absent(),
                Value<String> unitId = const Value.absent(),
                Value<DateTime> dueDate = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<double> paidAmount = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int?> paymentId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => RentSchedulesCompanion(
                id: id,
                contractId: contractId,
                tenantId: tenantId,
                propertyId: propertyId,
                tenantName: tenantName,
                propertyName: propertyName,
                unitId: unitId,
                dueDate: dueDate,
                amount: amount,
                paidAmount: paidAmount,
                currency: currency,
                status: status,
                paymentId: paymentId,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int contractId,
                required int tenantId,
                required int propertyId,
                required String tenantName,
                required String propertyName,
                required String unitId,
                required DateTime dueDate,
                required double amount,
                Value<double> paidAmount = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int?> paymentId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => RentSchedulesCompanion.insert(
                id: id,
                contractId: contractId,
                tenantId: tenantId,
                propertyId: propertyId,
                tenantName: tenantName,
                propertyName: propertyName,
                unitId: unitId,
                dueDate: dueDate,
                amount: amount,
                paidAmount: paidAmount,
                currency: currency,
                status: status,
                paymentId: paymentId,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RentSchedulesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                contractId = false,
                tenantId = false,
                propertyId = false,
                paymentId = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (contractId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.contractId,
                                    referencedTable:
                                        $$RentSchedulesTableReferences
                                            ._contractIdTable(db),
                                    referencedColumn:
                                        $$RentSchedulesTableReferences
                                            ._contractIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (tenantId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.tenantId,
                                    referencedTable:
                                        $$RentSchedulesTableReferences
                                            ._tenantIdTable(db),
                                    referencedColumn:
                                        $$RentSchedulesTableReferences
                                            ._tenantIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (propertyId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.propertyId,
                                    referencedTable:
                                        $$RentSchedulesTableReferences
                                            ._propertyIdTable(db),
                                    referencedColumn:
                                        $$RentSchedulesTableReferences
                                            ._propertyIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (paymentId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.paymentId,
                                    referencedTable:
                                        $$RentSchedulesTableReferences
                                            ._paymentIdTable(db),
                                    referencedColumn:
                                        $$RentSchedulesTableReferences
                                            ._paymentIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$RentSchedulesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RentSchedulesTable,
      RentScheduleRecord,
      $$RentSchedulesTableFilterComposer,
      $$RentSchedulesTableOrderingComposer,
      $$RentSchedulesTableAnnotationComposer,
      $$RentSchedulesTableCreateCompanionBuilder,
      $$RentSchedulesTableUpdateCompanionBuilder,
      (RentScheduleRecord, $$RentSchedulesTableReferences),
      RentScheduleRecord,
      PrefetchHooks Function({
        bool contractId,
        bool tenantId,
        bool propertyId,
        bool paymentId,
      })
    >;
typedef $$ExpensesTableCreateCompanionBuilder =
    ExpensesCompanion Function({
      Value<int> id,
      Value<int?> propertyId,
      Value<String?> propertyName,
      Value<String> category,
      required double amount,
      required DateTime date,
      required String description,
      Value<String?> vendor,
      Value<DateTime> createdAt,
    });
typedef $$ExpensesTableUpdateCompanionBuilder =
    ExpensesCompanion Function({
      Value<int> id,
      Value<int?> propertyId,
      Value<String?> propertyName,
      Value<String> category,
      Value<double> amount,
      Value<DateTime> date,
      Value<String> description,
      Value<String?> vendor,
      Value<DateTime> createdAt,
    });

final class $$ExpensesTableReferences
    extends BaseReferences<_$AppDatabase, $ExpensesTable, ExpenseRecord> {
  $$ExpensesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PropertiesTable _propertyIdTable(_$AppDatabase db) =>
      db.properties.createAlias(
        $_aliasNameGenerator(db.expenses.propertyId, db.properties.id),
      );

  $$PropertiesTableProcessedTableManager? get propertyId {
    final $_column = $_itemColumn<int>('property_id');
    if ($_column == null) return null;
    final manager = $$PropertiesTableTableManager(
      $_db,
      $_db.properties,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_propertyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ExpensesTableFilterComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vendor => $composableBuilder(
    column: $table.vendor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PropertiesTableFilterComposer get propertyId {
    final $$PropertiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableFilterComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExpensesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vendor => $composableBuilder(
    column: $table.vendor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PropertiesTableOrderingComposer get propertyId {
    final $$PropertiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableOrderingComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExpensesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get vendor =>
      $composableBuilder(column: $table.vendor, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$PropertiesTableAnnotationComposer get propertyId {
    final $$PropertiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableAnnotationComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExpensesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExpensesTable,
          ExpenseRecord,
          $$ExpensesTableFilterComposer,
          $$ExpensesTableOrderingComposer,
          $$ExpensesTableAnnotationComposer,
          $$ExpensesTableCreateCompanionBuilder,
          $$ExpensesTableUpdateCompanionBuilder,
          (ExpenseRecord, $$ExpensesTableReferences),
          ExpenseRecord,
          PrefetchHooks Function({bool propertyId})
        > {
  $$ExpensesTableTableManager(_$AppDatabase db, $ExpensesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpensesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpensesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpensesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> propertyId = const Value.absent(),
                Value<String?> propertyName = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String?> vendor = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ExpensesCompanion(
                id: id,
                propertyId: propertyId,
                propertyName: propertyName,
                category: category,
                amount: amount,
                date: date,
                description: description,
                vendor: vendor,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> propertyId = const Value.absent(),
                Value<String?> propertyName = const Value.absent(),
                Value<String> category = const Value.absent(),
                required double amount,
                required DateTime date,
                required String description,
                Value<String?> vendor = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ExpensesCompanion.insert(
                id: id,
                propertyId: propertyId,
                propertyName: propertyName,
                category: category,
                amount: amount,
                date: date,
                description: description,
                vendor: vendor,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ExpensesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({propertyId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (propertyId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.propertyId,
                                referencedTable: $$ExpensesTableReferences
                                    ._propertyIdTable(db),
                                referencedColumn: $$ExpensesTableReferences
                                    ._propertyIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ExpensesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExpensesTable,
      ExpenseRecord,
      $$ExpensesTableFilterComposer,
      $$ExpensesTableOrderingComposer,
      $$ExpensesTableAnnotationComposer,
      $$ExpensesTableCreateCompanionBuilder,
      $$ExpensesTableUpdateCompanionBuilder,
      (ExpenseRecord, $$ExpensesTableReferences),
      ExpenseRecord,
      PrefetchHooks Function({bool propertyId})
    >;
typedef $$AttachmentsTableCreateCompanionBuilder =
    AttachmentsCompanion Function({
      Value<int> id,
      required String entityType,
      required int entityId,
      required String label,
      required String filePath,
      Value<String> fileType,
      Value<DateTime> createdAt,
    });
typedef $$AttachmentsTableUpdateCompanionBuilder =
    AttachmentsCompanion Function({
      Value<int> id,
      Value<String> entityType,
      Value<int> entityId,
      Value<String> label,
      Value<String> filePath,
      Value<String> fileType,
      Value<DateTime> createdAt,
    });

class $$AttachmentsTableFilterComposer
    extends Composer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileType => $composableBuilder(
    column: $table.fileType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AttachmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileType => $composableBuilder(
    column: $table.fileType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AttachmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get fileType =>
      $composableBuilder(column: $table.fileType, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AttachmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AttachmentsTable,
          AttachmentRecord,
          $$AttachmentsTableFilterComposer,
          $$AttachmentsTableOrderingComposer,
          $$AttachmentsTableAnnotationComposer,
          $$AttachmentsTableCreateCompanionBuilder,
          $$AttachmentsTableUpdateCompanionBuilder,
          (
            AttachmentRecord,
            BaseReferences<_$AppDatabase, $AttachmentsTable, AttachmentRecord>,
          ),
          AttachmentRecord,
          PrefetchHooks Function()
        > {
  $$AttachmentsTableTableManager(_$AppDatabase db, $AttachmentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AttachmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AttachmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AttachmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<int> entityId = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<String> filePath = const Value.absent(),
                Value<String> fileType = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AttachmentsCompanion(
                id: id,
                entityType: entityType,
                entityId: entityId,
                label: label,
                filePath: filePath,
                fileType: fileType,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String entityType,
                required int entityId,
                required String label,
                required String filePath,
                Value<String> fileType = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AttachmentsCompanion.insert(
                id: id,
                entityType: entityType,
                entityId: entityId,
                label: label,
                filePath: filePath,
                fileType: fileType,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AttachmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AttachmentsTable,
      AttachmentRecord,
      $$AttachmentsTableFilterComposer,
      $$AttachmentsTableOrderingComposer,
      $$AttachmentsTableAnnotationComposer,
      $$AttachmentsTableCreateCompanionBuilder,
      $$AttachmentsTableUpdateCompanionBuilder,
      (
        AttachmentRecord,
        BaseReferences<_$AppDatabase, $AttachmentsTable, AttachmentRecord>,
      ),
      AttachmentRecord,
      PrefetchHooks Function()
    >;
typedef $$MaintenanceTicketsTableCreateCompanionBuilder =
    MaintenanceTicketsCompanion Function({
      Value<int> id,
      required int propertyId,
      required String propertyName,
      Value<String?> unitId,
      Value<int?> tenantId,
      Value<String?> tenantName,
      required String title,
      required String description,
      Value<String> damageResponsibility,
      Value<bool> chargeFromDeposit,
      Value<String> status,
      Value<String> priority,
      Value<double> cost,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$MaintenanceTicketsTableUpdateCompanionBuilder =
    MaintenanceTicketsCompanion Function({
      Value<int> id,
      Value<int> propertyId,
      Value<String> propertyName,
      Value<String?> unitId,
      Value<int?> tenantId,
      Value<String?> tenantName,
      Value<String> title,
      Value<String> description,
      Value<String> damageResponsibility,
      Value<bool> chargeFromDeposit,
      Value<String> status,
      Value<String> priority,
      Value<double> cost,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$MaintenanceTicketsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MaintenanceTicketsTable,
          MaintenanceTicketRecord
        > {
  $$MaintenanceTicketsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PropertiesTable _propertyIdTable(_$AppDatabase db) =>
      db.properties.createAlias(
        $_aliasNameGenerator(
          db.maintenanceTickets.propertyId,
          db.properties.id,
        ),
      );

  $$PropertiesTableProcessedTableManager get propertyId {
    final $_column = $_itemColumn<int>('property_id')!;

    final manager = $$PropertiesTableTableManager(
      $_db,
      $_db.properties,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_propertyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TenantsTable _tenantIdTable(_$AppDatabase db) =>
      db.tenants.createAlias(
        $_aliasNameGenerator(db.maintenanceTickets.tenantId, db.tenants.id),
      );

  $$TenantsTableProcessedTableManager? get tenantId {
    final $_column = $_itemColumn<int>('tenant_id');
    if ($_column == null) return null;
    final manager = $$TenantsTableTableManager(
      $_db,
      $_db.tenants,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tenantIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MaintenanceTicketsTableFilterComposer
    extends Composer<_$AppDatabase, $MaintenanceTicketsTable> {
  $$MaintenanceTicketsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenantName => $composableBuilder(
    column: $table.tenantName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get damageResponsibility => $composableBuilder(
    column: $table.damageResponsibility,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get chargeFromDeposit => $composableBuilder(
    column: $table.chargeFromDeposit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PropertiesTableFilterComposer get propertyId {
    final $$PropertiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableFilterComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TenantsTableFilterComposer get tenantId {
    final $$TenantsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableFilterComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MaintenanceTicketsTableOrderingComposer
    extends Composer<_$AppDatabase, $MaintenanceTicketsTable> {
  $$MaintenanceTicketsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenantName => $composableBuilder(
    column: $table.tenantName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get damageResponsibility => $composableBuilder(
    column: $table.damageResponsibility,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get chargeFromDeposit => $composableBuilder(
    column: $table.chargeFromDeposit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PropertiesTableOrderingComposer get propertyId {
    final $$PropertiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableOrderingComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TenantsTableOrderingComposer get tenantId {
    final $$TenantsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableOrderingComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MaintenanceTicketsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MaintenanceTicketsTable> {
  $$MaintenanceTicketsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<String> get tenantName => $composableBuilder(
    column: $table.tenantName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get damageResponsibility => $composableBuilder(
    column: $table.damageResponsibility,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get chargeFromDeposit => $composableBuilder(
    column: $table.chargeFromDeposit,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<double> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$PropertiesTableAnnotationComposer get propertyId {
    final $$PropertiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableAnnotationComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TenantsTableAnnotationComposer get tenantId {
    final $$TenantsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableAnnotationComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MaintenanceTicketsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MaintenanceTicketsTable,
          MaintenanceTicketRecord,
          $$MaintenanceTicketsTableFilterComposer,
          $$MaintenanceTicketsTableOrderingComposer,
          $$MaintenanceTicketsTableAnnotationComposer,
          $$MaintenanceTicketsTableCreateCompanionBuilder,
          $$MaintenanceTicketsTableUpdateCompanionBuilder,
          (MaintenanceTicketRecord, $$MaintenanceTicketsTableReferences),
          MaintenanceTicketRecord,
          PrefetchHooks Function({bool propertyId, bool tenantId})
        > {
  $$MaintenanceTicketsTableTableManager(
    _$AppDatabase db,
    $MaintenanceTicketsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MaintenanceTicketsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MaintenanceTicketsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MaintenanceTicketsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> propertyId = const Value.absent(),
                Value<String> propertyName = const Value.absent(),
                Value<String?> unitId = const Value.absent(),
                Value<int?> tenantId = const Value.absent(),
                Value<String?> tenantName = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> damageResponsibility = const Value.absent(),
                Value<bool> chargeFromDeposit = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> priority = const Value.absent(),
                Value<double> cost = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => MaintenanceTicketsCompanion(
                id: id,
                propertyId: propertyId,
                propertyName: propertyName,
                unitId: unitId,
                tenantId: tenantId,
                tenantName: tenantName,
                title: title,
                description: description,
                damageResponsibility: damageResponsibility,
                chargeFromDeposit: chargeFromDeposit,
                status: status,
                priority: priority,
                cost: cost,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int propertyId,
                required String propertyName,
                Value<String?> unitId = const Value.absent(),
                Value<int?> tenantId = const Value.absent(),
                Value<String?> tenantName = const Value.absent(),
                required String title,
                required String description,
                Value<String> damageResponsibility = const Value.absent(),
                Value<bool> chargeFromDeposit = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> priority = const Value.absent(),
                Value<double> cost = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => MaintenanceTicketsCompanion.insert(
                id: id,
                propertyId: propertyId,
                propertyName: propertyName,
                unitId: unitId,
                tenantId: tenantId,
                tenantName: tenantName,
                title: title,
                description: description,
                damageResponsibility: damageResponsibility,
                chargeFromDeposit: chargeFromDeposit,
                status: status,
                priority: priority,
                cost: cost,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MaintenanceTicketsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({propertyId = false, tenantId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (propertyId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.propertyId,
                                referencedTable:
                                    $$MaintenanceTicketsTableReferences
                                        ._propertyIdTable(db),
                                referencedColumn:
                                    $$MaintenanceTicketsTableReferences
                                        ._propertyIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (tenantId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tenantId,
                                referencedTable:
                                    $$MaintenanceTicketsTableReferences
                                        ._tenantIdTable(db),
                                referencedColumn:
                                    $$MaintenanceTicketsTableReferences
                                        ._tenantIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MaintenanceTicketsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MaintenanceTicketsTable,
      MaintenanceTicketRecord,
      $$MaintenanceTicketsTableFilterComposer,
      $$MaintenanceTicketsTableOrderingComposer,
      $$MaintenanceTicketsTableAnnotationComposer,
      $$MaintenanceTicketsTableCreateCompanionBuilder,
      $$MaintenanceTicketsTableUpdateCompanionBuilder,
      (MaintenanceTicketRecord, $$MaintenanceTicketsTableReferences),
      MaintenanceTicketRecord,
      PrefetchHooks Function({bool propertyId, bool tenantId})
    >;
typedef $$MessageTemplatesTableCreateCompanionBuilder =
    MessageTemplatesCompanion Function({
      Value<int> id,
      required String type,
      required String title,
      required String body,
      Value<String> channelDefault,
      Value<DateTime> updatedAt,
    });
typedef $$MessageTemplatesTableUpdateCompanionBuilder =
    MessageTemplatesCompanion Function({
      Value<int> id,
      Value<String> type,
      Value<String> title,
      Value<String> body,
      Value<String> channelDefault,
      Value<DateTime> updatedAt,
    });

class $$MessageTemplatesTableFilterComposer
    extends Composer<_$AppDatabase, $MessageTemplatesTable> {
  $$MessageTemplatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get channelDefault => $composableBuilder(
    column: $table.channelDefault,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MessageTemplatesTableOrderingComposer
    extends Composer<_$AppDatabase, $MessageTemplatesTable> {
  $$MessageTemplatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get channelDefault => $composableBuilder(
    column: $table.channelDefault,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MessageTemplatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MessageTemplatesTable> {
  $$MessageTemplatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<String> get channelDefault => $composableBuilder(
    column: $table.channelDefault,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$MessageTemplatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MessageTemplatesTable,
          MessageTemplateRecord,
          $$MessageTemplatesTableFilterComposer,
          $$MessageTemplatesTableOrderingComposer,
          $$MessageTemplatesTableAnnotationComposer,
          $$MessageTemplatesTableCreateCompanionBuilder,
          $$MessageTemplatesTableUpdateCompanionBuilder,
          (
            MessageTemplateRecord,
            BaseReferences<
              _$AppDatabase,
              $MessageTemplatesTable,
              MessageTemplateRecord
            >,
          ),
          MessageTemplateRecord,
          PrefetchHooks Function()
        > {
  $$MessageTemplatesTableTableManager(
    _$AppDatabase db,
    $MessageTemplatesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MessageTemplatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MessageTemplatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MessageTemplatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<String> channelDefault = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => MessageTemplatesCompanion(
                id: id,
                type: type,
                title: title,
                body: body,
                channelDefault: channelDefault,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String type,
                required String title,
                required String body,
                Value<String> channelDefault = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => MessageTemplatesCompanion.insert(
                id: id,
                type: type,
                title: title,
                body: body,
                channelDefault: channelDefault,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MessageTemplatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MessageTemplatesTable,
      MessageTemplateRecord,
      $$MessageTemplatesTableFilterComposer,
      $$MessageTemplatesTableOrderingComposer,
      $$MessageTemplatesTableAnnotationComposer,
      $$MessageTemplatesTableCreateCompanionBuilder,
      $$MessageTemplatesTableUpdateCompanionBuilder,
      (
        MessageTemplateRecord,
        BaseReferences<
          _$AppDatabase,
          $MessageTemplatesTable,
          MessageTemplateRecord
        >,
      ),
      MessageTemplateRecord,
      PrefetchHooks Function()
    >;
typedef $$MessageLogsTableCreateCompanionBuilder =
    MessageLogsCompanion Function({
      Value<int> id,
      Value<int?> tenantId,
      required String tenantName,
      required String tenantPhone,
      required String type,
      required String channel,
      required String body,
      Value<String> status,
      Value<DateTime> createdAt,
    });
typedef $$MessageLogsTableUpdateCompanionBuilder =
    MessageLogsCompanion Function({
      Value<int> id,
      Value<int?> tenantId,
      Value<String> tenantName,
      Value<String> tenantPhone,
      Value<String> type,
      Value<String> channel,
      Value<String> body,
      Value<String> status,
      Value<DateTime> createdAt,
    });

final class $$MessageLogsTableReferences
    extends BaseReferences<_$AppDatabase, $MessageLogsTable, MessageLogRecord> {
  $$MessageLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TenantsTable _tenantIdTable(_$AppDatabase db) =>
      db.tenants.createAlias(
        $_aliasNameGenerator(db.messageLogs.tenantId, db.tenants.id),
      );

  $$TenantsTableProcessedTableManager? get tenantId {
    final $_column = $_itemColumn<int>('tenant_id');
    if ($_column == null) return null;
    final manager = $$TenantsTableTableManager(
      $_db,
      $_db.tenants,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tenantIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MessageLogsTableFilterComposer
    extends Composer<_$AppDatabase, $MessageLogsTable> {
  $$MessageLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenantName => $composableBuilder(
    column: $table.tenantName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenantPhone => $composableBuilder(
    column: $table.tenantPhone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get channel => $composableBuilder(
    column: $table.channel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$TenantsTableFilterComposer get tenantId {
    final $$TenantsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableFilterComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MessageLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $MessageLogsTable> {
  $$MessageLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenantName => $composableBuilder(
    column: $table.tenantName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenantPhone => $composableBuilder(
    column: $table.tenantPhone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get channel => $composableBuilder(
    column: $table.channel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TenantsTableOrderingComposer get tenantId {
    final $$TenantsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableOrderingComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MessageLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MessageLogsTable> {
  $$MessageLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tenantName => $composableBuilder(
    column: $table.tenantName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tenantPhone => $composableBuilder(
    column: $table.tenantPhone,
    builder: (column) => column,
  );

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get channel =>
      $composableBuilder(column: $table.channel, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$TenantsTableAnnotationComposer get tenantId {
    final $$TenantsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableAnnotationComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MessageLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MessageLogsTable,
          MessageLogRecord,
          $$MessageLogsTableFilterComposer,
          $$MessageLogsTableOrderingComposer,
          $$MessageLogsTableAnnotationComposer,
          $$MessageLogsTableCreateCompanionBuilder,
          $$MessageLogsTableUpdateCompanionBuilder,
          (MessageLogRecord, $$MessageLogsTableReferences),
          MessageLogRecord,
          PrefetchHooks Function({bool tenantId})
        > {
  $$MessageLogsTableTableManager(_$AppDatabase db, $MessageLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MessageLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MessageLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MessageLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> tenantId = const Value.absent(),
                Value<String> tenantName = const Value.absent(),
                Value<String> tenantPhone = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> channel = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => MessageLogsCompanion(
                id: id,
                tenantId: tenantId,
                tenantName: tenantName,
                tenantPhone: tenantPhone,
                type: type,
                channel: channel,
                body: body,
                status: status,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> tenantId = const Value.absent(),
                required String tenantName,
                required String tenantPhone,
                required String type,
                required String channel,
                required String body,
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => MessageLogsCompanion.insert(
                id: id,
                tenantId: tenantId,
                tenantName: tenantName,
                tenantPhone: tenantPhone,
                type: type,
                channel: channel,
                body: body,
                status: status,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MessageLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({tenantId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (tenantId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tenantId,
                                referencedTable: $$MessageLogsTableReferences
                                    ._tenantIdTable(db),
                                referencedColumn: $$MessageLogsTableReferences
                                    ._tenantIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MessageLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MessageLogsTable,
      MessageLogRecord,
      $$MessageLogsTableFilterComposer,
      $$MessageLogsTableOrderingComposer,
      $$MessageLogsTableAnnotationComposer,
      $$MessageLogsTableCreateCompanionBuilder,
      $$MessageLogsTableUpdateCompanionBuilder,
      (MessageLogRecord, $$MessageLogsTableReferences),
      MessageLogRecord,
      PrefetchHooks Function({bool tenantId})
    >;
typedef $$SettingsTableCreateCompanionBuilder =
    SettingsCompanion Function({
      required String key,
      required String value,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$SettingsTableUpdateCompanionBuilder =
    SettingsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTable,
          SettingRecord,
          $$SettingsTableFilterComposer,
          $$SettingsTableOrderingComposer,
          $$SettingsTableAnnotationComposer,
          $$SettingsTableCreateCompanionBuilder,
          $$SettingsTableUpdateCompanionBuilder,
          (
            SettingRecord,
            BaseReferences<_$AppDatabase, $SettingsTable, SettingRecord>,
          ),
          SettingRecord,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SettingsCompanion(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SettingsCompanion.insert(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTable,
      SettingRecord,
      $$SettingsTableFilterComposer,
      $$SettingsTableOrderingComposer,
      $$SettingsTableAnnotationComposer,
      $$SettingsTableCreateCompanionBuilder,
      $$SettingsTableUpdateCompanionBuilder,
      (
        SettingRecord,
        BaseReferences<_$AppDatabase, $SettingsTable, SettingRecord>,
      ),
      SettingRecord,
      PrefetchHooks Function()
    >;
typedef $$AuditLogsTableCreateCompanionBuilder =
    AuditLogsCompanion Function({
      Value<int> id,
      required String action,
      required String entityType,
      Value<int?> entityId,
      required String description,
      Value<DateTime> createdAt,
    });
typedef $$AuditLogsTableUpdateCompanionBuilder =
    AuditLogsCompanion Function({
      Value<int> id,
      Value<String> action,
      Value<String> entityType,
      Value<int?> entityId,
      Value<String> description,
      Value<DateTime> createdAt,
    });

class $$AuditLogsTableFilterComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AuditLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AuditLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AuditLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuditLogsTable,
          AuditLogRecord,
          $$AuditLogsTableFilterComposer,
          $$AuditLogsTableOrderingComposer,
          $$AuditLogsTableAnnotationComposer,
          $$AuditLogsTableCreateCompanionBuilder,
          $$AuditLogsTableUpdateCompanionBuilder,
          (
            AuditLogRecord,
            BaseReferences<_$AppDatabase, $AuditLogsTable, AuditLogRecord>,
          ),
          AuditLogRecord,
          PrefetchHooks Function()
        > {
  $$AuditLogsTableTableManager(_$AppDatabase db, $AuditLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<int?> entityId = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AuditLogsCompanion(
                id: id,
                action: action,
                entityType: entityType,
                entityId: entityId,
                description: description,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String action,
                required String entityType,
                Value<int?> entityId = const Value.absent(),
                required String description,
                Value<DateTime> createdAt = const Value.absent(),
              }) => AuditLogsCompanion.insert(
                id: id,
                action: action,
                entityType: entityType,
                entityId: entityId,
                description: description,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AuditLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuditLogsTable,
      AuditLogRecord,
      $$AuditLogsTableFilterComposer,
      $$AuditLogsTableOrderingComposer,
      $$AuditLogsTableAnnotationComposer,
      $$AuditLogsTableCreateCompanionBuilder,
      $$AuditLogsTableUpdateCompanionBuilder,
      (
        AuditLogRecord,
        BaseReferences<_$AppDatabase, $AuditLogsTable, AuditLogRecord>,
      ),
      AuditLogRecord,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PropertiesTableTableManager get properties =>
      $$PropertiesTableTableManager(_db, _db.properties);
  $$TenantsTableTableManager get tenants =>
      $$TenantsTableTableManager(_db, _db.tenants);
  $$ContractsTableTableManager get contracts =>
      $$ContractsTableTableManager(_db, _db.contracts);
  $$PaymentsTableTableManager get payments =>
      $$PaymentsTableTableManager(_db, _db.payments);
  $$UtilityBillsTableTableManager get utilityBills =>
      $$UtilityBillsTableTableManager(_db, _db.utilityBills);
  $$UnitsTableTableManager get units =>
      $$UnitsTableTableManager(_db, _db.units);
  $$RentSchedulesTableTableManager get rentSchedules =>
      $$RentSchedulesTableTableManager(_db, _db.rentSchedules);
  $$ExpensesTableTableManager get expenses =>
      $$ExpensesTableTableManager(_db, _db.expenses);
  $$AttachmentsTableTableManager get attachments =>
      $$AttachmentsTableTableManager(_db, _db.attachments);
  $$MaintenanceTicketsTableTableManager get maintenanceTickets =>
      $$MaintenanceTicketsTableTableManager(_db, _db.maintenanceTickets);
  $$MessageTemplatesTableTableManager get messageTemplates =>
      $$MessageTemplatesTableTableManager(_db, _db.messageTemplates);
  $$MessageLogsTableTableManager get messageLogs =>
      $$MessageLogsTableTableManager(_db, _db.messageLogs);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
  $$AuditLogsTableTableManager get auditLogs =>
      $$AuditLogsTableTableManager(_db, _db.auditLogs);
}
