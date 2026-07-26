import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../../core/formatters.dart';
import '../../core/labels.dart';
import '../../data/local/app_database.dart';
import '../../data/repositories/rental_repositories.dart';
import '../../services/pdf_service.dart';
import '../../shared/widgets/metric_card.dart';
import '../../shared/widgets/milaak_ui.dart';
import '../../shared/widgets/screen_scaffold.dart';

class ReportsScreen extends ConsumerWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final properties =
        ref.watch(propertiesProvider).value ?? <PropertyRecord>[];
    final units = ref.watch(unitsProvider).value ?? <UnitRecord>[];
    final tenants = ref.watch(tenantsProvider).value ?? <TenantRecord>[];
    final payments = ref.watch(paymentsProvider).value ?? <PaymentRecord>[];
    final schedules =
        ref.watch(rentSchedulesProvider).value ?? <RentScheduleRecord>[];
    final expenses = ref.watch(expensesProvider).value ?? <ExpenseRecord>[];
    final utilityBills =
        ref.watch(chargeableUtilityBillsProvider).value ??
        <UtilityBillRecord>[];

    final income = properties.fold<double>(
      0,
      (sum, item) => sum + item.monthlyIncome,
    );
    final arrears = tenants.fold<double>(
      0,
      (sum, item) => sum + _tenantDebt(item, utilityBills),
    );
    final paid = payments
        .where((p) => p.status == 'paid')
        .fold<double>(0, (sum, item) => sum + item.amount);
    final pending = schedules
        .where((p) => p.status != 'paid')
        .fold<double>(0, (sum, item) => sum + item.amount - item.paidAmount);
    final expenseTotal = expenses.fold<double>(
      0,
      (sum, item) => sum + item.amount,
    );
    final net = paid - expenseTotal;
    final leasedUnits = units.where((item) => item.status == 'leased').length;
    final vacantUnits = units.where((item) => item.status == 'vacant').length;
    final maintenanceUnits = units
        .where((item) => item.status == 'maintenance')
        .length;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: const Text('التقارير')),
      body: ScreenScaffold(
        title: 'التقارير المالية',
        subtitle: 'دخل، مصروفات، استحقاقات، وإشغال الوحدات.',
        actions: [
          IconButton.outlined(
            tooltip: 'تصدير PDF',
            onPressed: () => PdfService().shareFinancialReport(
              context: context,
              properties: properties,
              tenants: tenants,
              payments: payments,
              expenses: expenses,
              schedules: schedules,
              utilityBills: utilityBills,
            ),
            icon: const Icon(Icons.picture_as_pdf_rounded),
          ),
        ],
        child: ListView(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: constraints.maxWidth > 620 ? 4 : 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: constraints.maxWidth < 390 ? .95 : 1.08,
                  children: [
                    MetricCard(
                      title: 'الدخل المتوقع',
                      value: formatCurrency(income),
                      icon: Icons.trending_up_rounded,
                    ),
                    MetricCard(
                      title: 'إجمالي التحصيل',
                      value: formatCurrency(paid),
                      icon: Icons.payments_rounded,
                      color: MilaakColors.collected,
                    ),
                    MetricCard(
                      title: 'المتأخرات',
                      value: formatCurrency(arrears + pending),
                      icon: Icons.warning_rounded,
                      color: MilaakColors.arrears,
                    ),
                    MetricCard(
                      title: 'صافي الدخل',
                      value: formatCurrency(net),
                      icon: Icons.account_balance_wallet_rounded,
                      color: net >= 0
                          ? MilaakColors.collected
                          : MilaakColors.arrears,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 12),
            MilaakSoftCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'التحصيل والمصروفات',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    height: 220,
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 3,
                        centerSpaceRadius: 46,
                        sections: [
                          PieChartSectionData(
                            value: paid <= 0 ? 1 : paid,
                            title: 'محصل',
                            color: MilaakColors.collected,
                            radius: 68,
                          ),
                          PieChartSectionData(
                            value: expenseTotal <= 0 ? 1 : expenseTotal,
                            title: 'مصروف',
                            color: MilaakColors.arrears,
                            radius: 68,
                          ),
                          if (pending > 0)
                            PieChartSectionData(
                              value: pending,
                              title: 'مستحق',
                              color: MilaakColors.contractGold,
                              radius: 68,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            MilaakSoftCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'إشغال الوحدات',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _ReportLine(
                    label: 'مؤجرة',
                    value: '$leasedUnits',
                    color: MilaakColors.collected,
                  ),
                  _ReportLine(
                    label: 'شاغرة',
                    value: '$vacantUnits',
                    color: MilaakColors.contractGold,
                  ),
                  _ReportLine(
                    label: 'صيانة',
                    value: '$maintenanceUnits',
                    color: MilaakColors.arrears,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            MilaakSoftCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'أعلى المستأجرين مديونية',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...([...tenants]..sort(
                        (a, b) => _tenantDebt(
                          b,
                          utilityBills,
                        ).compareTo(_tenantDebt(a, utilityBills)),
                      ))
                      .take(5)
                      .map(
                        (tenant) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(
                            Icons.warning_amber_rounded,
                            color: MilaakColors.arrears,
                          ),
                          title: Text(
                            tenant.name,
                            style: const TextStyle(fontWeight: FontWeight.w900),
                          ),
                          subtitle: Text(
                            '${tenant.propertyName} - ${formatUnitShort((properties.where((p) => p.id == tenant.propertyId).isNotEmpty ? properties.where((p) => p.id == tenant.propertyId).first.type : 'residential'), tenant.unitId)}',
                          ),
                          trailing: Text(
                            formatCurrency(_tenantDebt(tenant, utilityBills)),
                            style: const TextStyle(fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                  if (tenants.isEmpty)
                    const Text(
                      'لا توجد بيانات مستأجرين.',
                      style: TextStyle(color: MilaakColors.textSoft),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReportLine extends StatelessWidget {
  const _ReportLine({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w900)),
        ],
      ),
    );
  }
}

double _tenantDebt(TenantRecord tenant, List<UtilityBillRecord> utilityBills) {
  final utilities = utilityBills
      .where(
        (bill) =>
            bill.tenantId == tenant.id &&
            bill.status == 'open' &&
            bill.chargeToTenant,
      )
      .fold<double>(0, (sum, bill) => sum + bill.amount);
  return tenant.accumulatedDebt + tenant.balance + utilities;
}
