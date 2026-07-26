String unitSingularFromUnitType(String unitType) {
  return switch (unitType) {
    'office' => 'مكتب',
    'shop' => 'محل',
    'villa' => 'فيلا',
    _ => 'شقة',
  };
}

String unitPluralFromPropertyType(String propertyType) {
  return propertyType == 'commercial' ? 'محلات' : 'شقق';
}

String unitSingularFromPropertyType(String propertyType) {
  return propertyType == 'commercial' ? 'محل' : 'شقة';
}

String formatUnitShort(
  String? propertyType,
  String? unitId, {
  String? unitType,
}) {
  if (unitId == null || unitId.trim().isEmpty) return '';
  // shop ids use S<number>
  if (unitId.startsWith('S')) {
    final num = unitId.substring(1);
    final label = unitType != null
        ? unitSingularFromUnitType(unitType)
        : unitSingularFromPropertyType(propertyType ?? 'residential');
    return '$label $num';
  }

  if (unitId.contains('-')) {
    final parts = unitId.split('-');
    if (parts.length >= 2) {
      final floor = parts[0];
      final index = parts[1];
      final label = unitType != null
          ? unitSingularFromUnitType(unitType)
          : unitSingularFromPropertyType(propertyType ?? 'residential');
      return '$label $index د$floor';
    }
  }

  final label = unitType != null
      ? unitSingularFromUnitType(unitType)
      : unitSingularFromPropertyType(propertyType ?? 'residential');
  return '$label $unitId';
}

String utilityBillTypeLabel(String type) {
  return switch (type) {
    'water' => 'ماء',
    'electricity' => 'كهرباء',
    'gas' => 'غاز',
    _ => 'خدمة',
  };
}

String servicePolicyLabel(String policy) {
  return switch (policy) {
    'inherit' => 'حسب إعداد العقار',
    'unavailable' => 'غير متوفرة',
    'owner_meter' => 'المكتب يدفع ويحصّل',
    'tenant_meter' => 'المستأجر يدفع للشركة',
    'shared_meter' => 'عداد مشترك',
    _ => policy,
  };
}

String effectiveServicePolicyLabel(String policy) {
  return policy == 'inherit' ? 'حسب العقار' : servicePolicyLabel(policy);
}

String meterOwnershipLabel(String ownership) {
  return switch (ownership) {
    'owner_meter' => 'عداد مالك',
    'tenant_meter' => 'عداد مستأجر',
    'shared_meter' => 'عداد مشترك',
    _ => ownership,
  };
}

String utilityBillStatusLabel(String status) {
  return switch (status) {
    'paid' => 'مدفوعة للمكتب',
    'paid_external' => 'مدفوعة خارج التطبيق',
    'cancelled' => 'ملغاة',
    _ => 'مفتوحة',
  };
}
