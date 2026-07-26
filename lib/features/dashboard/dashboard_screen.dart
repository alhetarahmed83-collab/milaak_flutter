import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../../core/formatters.dart';
import '../../data/local/app_database.dart';
import '../../data/repositories/rental_repositories.dart';
import '../../services/pdf_service.dart';
import '../../shared/widgets/form_helpers.dart';
import '../../shared/widgets/milaak_ui.dart';
import '../contracts/contracts_screen.dart';
import '../settings/audit_log_screen.dart';
import '../payments/payments_screen.dart';
import '../properties/properties_screen.dart';
import '../settings/more_screen.dart';
import '../tenants/tenants_screen.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final officeName =
        ref.watch(officeNameProvider).value ?? 'مكتب مِلاك العقاري';
    final properties =
        ref.watch(propertiesProvider).value ?? <PropertyRecord>[];
    final tenants = ref.watch(tenantsProvider).value ?? <TenantRecord>[];
    final payments = ref.watch(paymentsProvider).value ?? <PaymentRecord>[];
    final contracts = ref.watch(contractsProvider).value ?? <ContractRecord>[];
    final maintenanceTickets =
        ref.watch(maintenanceTicketsProvider).value ??
        <MaintenanceTicketRecord>[];
    final auditLogs = ref.watch(auditLogsProvider).value ?? <AuditLogRecord>[];
    final utilityBills =
        ref.watch(chargeableUtilityBillsProvider).value ??
        <UtilityBillRecord>[];

    final totalUnits = properties.fold<int>(0, (sum, item) => sum + item.units);
    final occupiedUnits = properties.fold<int>(
      0,
      (sum, item) => sum + item.occupiedUnits,
    );
    final monthlyIncome = properties.fold<double>(
      0,
      (sum, item) => sum + item.monthlyIncome,
    );
    final arrears = tenants.fold<double>(
      0,
      (sum, item) =>
          sum +
          item.accumulatedDebt +
          item.balance +
          _utilityDebtForTenant(utilityBills, item.id),
    );
    final now = DateTime.now();
    final occupiedRatio = totalUnits == 0 ? 0.0 : occupiedUnits / totalUnits;
    final currentMonthPaid = payments
        .where(
          (p) =>
              p.status == 'paid' &&
              p.date.year == now.year &&
              p.date.month == now.month,
        )
        .fold<double>(0, (sum, item) => sum + item.amount);
    final closeContracts =
        contracts
            .where(
              (contract) =>
                  contract.endDate.isBefore(now.add(const Duration(days: 45))),
            )
            .toList()
          ..sort((a, b) => a.endDate.compareTo(b.endDate));
    final openMaintenance = maintenanceTickets
        .where((ticket) => ticket.status != 'closed')
        .toList();
    final arrearsTenants = tenants.where((tenant) {
      return tenant.accumulatedDebt +
              tenant.balance +
              _utilityDebtForTenant(utilityBills, tenant.id) >
          0;
    }).length;
    final notificationsCount =
        closeContracts.length + openMaintenance.length + arrearsTenants;
    final monthlySeries = _monthlyCollections(payments, now);
    final monthlyTotal = monthlySeries.fold<double>(
      0,
      (sum, item) => sum + item,
    );
    final recentLogs = auditLogs.take(5).toList();
    final vacantUnits = (totalUnits - occupiedUnits)
        .clamp(0, totalUnits)
        .toInt();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: MilaakGlassBackground(
        child: SafeArea(
          top: true,
          bottom: false,
          child: RefreshIndicator(
            onRefresh: () => _refreshDashboard(ref),
            color: MilaakColors.primary,
            backgroundColor: MilaakColors.surfaceFor(context),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(
                16,
                10,
                16,
                MilaakSpacing.floatingDockBottomInset + 24,
              ),
              children: [
                _DashboardHeader(
                  officeName: officeName,
                  alertsCount: notificationsCount,
                  onNotifications: () => _showNotificationsSheet(
                    context,
                    officeName: officeName,
                    properties: properties,
                    openMaintenance: openMaintenance,
                    closeContracts: closeContracts,
                    recentLogs: recentLogs,
                    arrears: arrears,
                  ),
                  onPdf: () => _showPdfSheet(
                    context,
                    properties: properties,
                    tenants: tenants,
                    payments: payments,
                    contracts: contracts,
                    utilityBills: utilityBills,
                  ),
                  onMore: () => Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (_) => const MoreScreen())),
                ),
                const SizedBox(height: 14),
                _OccupancyHero(
                  occupancy: occupiedRatio,
                  occupiedUnits: occupiedUnits,
                  vacantUnits: vacantUnits,
                  totalUnits: totalUnits,
                  monthlyIncome: currentMonthPaid,
                ),
                const SizedBox(height: 14),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _QuickActionTile(
                        icon: Icons.bar_chart_rounded,
                        title: 'تقرير',
                        color: MilaakColors.utilityBlue,
                        onTap: () => _showPdfSheet(
                          context,
                          properties: properties,
                          tenants: tenants,
                          payments: payments,
                          contracts: contracts,
                          utilityBills: utilityBills,
                        ),
                      ),
                      const SizedBox(width: 10),
                      _QuickActionTile(
                        icon: Icons.receipt_long_rounded,
                        title: 'تحصيل',
                        color: MilaakColors.collected,
                        onTap: () => _openPage(context, const PaymentsScreen()),
                      ),
                      const SizedBox(width: 10),
                      _QuickActionTile(
                        icon: Icons.description_rounded,
                        title: 'عقد',
                        color: MilaakColors.contractGold,
                        onTap: () =>
                            _openPage(context, const ContractsScreen()),
                      ),
                      const SizedBox(width: 10),
                      _QuickActionTile(
                        icon: Icons.groups_rounded,
                        title: 'مستأجر',
                        color: MilaakColors.charcoal,
                        onTap: () => _openPage(context, const TenantsScreen()),
                      ),
                      const SizedBox(width: 10),
                      _QuickActionTile(
                        icon: Icons.apartment_rounded,
                        title: 'عقار',
                        color: MilaakColors.primaryDark,
                        onTap: () =>
                            _openPage(context, const PropertiesScreen()),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                MilaakSectionHeader(
                  title: 'أهم المؤشرات',
                  subtitle: 'بطاقات عملية تكشف الوضع العام بسرعة.',
                  trailing: MilaakStatusBadge(
                    label: '$notificationsCount تنبيه',
                    color: notificationsCount > 0
                        ? MilaakColors.arrears
                        : MilaakColors.collected,
                  ),
                ),
                const SizedBox(height: 10),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final wide = constraints.maxWidth > 700;
                    final crossAxisCount = wide ? 4 : 2;
                    return GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: wide ? 1.14 : 1.05,
                      children: [
                        MilaakStatCard(
                          title: 'المستأجرون',
                          value: '${tenants.length}',
                          icon: Icons.groups_rounded,
                          color: MilaakColors.charcoal,
                          subtitle: '+$arrearsTenants متأخرين',
                        ),
                        MilaakStatCard(
                          title: 'العقارات',
                          value: '${properties.length}',
                          icon: Icons.apartment_rounded,
                          color: MilaakColors.primaryDark,
                          subtitle: '$totalUnits وحدة',
                        ),
                        MilaakStatCard(
                          title: 'التحصيل',
                          value: formatCurrency(currentMonthPaid),
                          icon: Icons.payments_rounded,
                          color: MilaakColors.collected,
                          subtitle: 'هذا الشهر',
                        ),
                        MilaakStatCard(
                          title: 'المتأخرات',
                          value: formatCurrency(arrears),
                          icon: Icons.warning_rounded,
                          color: MilaakColors.arrears,
                          subtitle: '$arrearsTenants مستأجر',
                        ),
                        MilaakStatCard(
                          title: 'العقود القريبة',
                          value: '${closeContracts.length}',
                          icon: Icons.event_note_rounded,
                          color: MilaakColors.contractGold,
                          subtitle: 'خلال 45 يوم',
                        ),
                        MilaakStatCard(
                          title: 'الوحدات الشاغرة',
                          value: '$vacantUnits',
                          icon: Icons.home_work_outlined,
                          color: MilaakColors.textSoft,
                          subtitle: 'جاهزة للتأجير',
                        ),
                        MilaakStatCard(
                          title: 'الصيانة المفتوحة',
                          value: '${openMaintenance.length}',
                          icon: Icons.build_circle_rounded,
                          color: MilaakColors.utilityBlue,
                          subtitle: 'تحتاج متابعة',
                        ),
                        MilaakStatCard(
                          title: 'الدخل المتوقع',
                          value: formatCurrency(monthlyIncome),
                          icon: Icons.trending_up_rounded,
                          color: MilaakColors.primaryDark,
                          subtitle: 'شهرياً',
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 14),
                _RevenueChartCard(
                  series: monthlySeries,
                  currentMonthTotal: currentMonthPaid,
                  monthlyTotal: monthlyTotal,
                ),
                const SizedBox(height: 14),
                _ActivityCard(
                  logs: recentLogs,
                  onOpenAll: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const AuditLogScreen()),
                  ),
                ),
                const SizedBox(height: 14),
                _UpcomingContractsCard(contracts: closeContracts),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openPage(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }

  void _showPdfSheet(
    BuildContext context, {
    required List<PropertyRecord> properties,
    required List<TenantRecord> tenants,
    required List<PaymentRecord> payments,
    required List<ContractRecord> contracts,
    required List<UtilityBillRecord> utilityBills,
  }) {
    showMilaakSheet<void>(
      context,
      _ReportSheet(
        onToday: () => _exportDashboardPdf(
          context,
          properties: properties,
          tenants: tenants,
          payments: payments,
          contracts: contracts,
          utilityBills: utilityBills,
        ),
        onMonth: () => _exportDashboardPdf(
          context,
          properties: properties,
          tenants: tenants,
          payments: payments,
          contracts: contracts,
          utilityBills: utilityBills,
        ),
        onYear: () => _exportDashboardPdf(
          context,
          properties: properties,
          tenants: tenants,
          payments: payments,
          contracts: contracts,
          utilityBills: utilityBills,
        ),
      ),
    );
  }

  void _showNotificationsSheet(
    BuildContext context, {
    required String officeName,
    required List<PropertyRecord> properties,
    required List<MaintenanceTicketRecord> openMaintenance,
    required List<ContractRecord> closeContracts,
    required List<AuditLogRecord> recentLogs,
    required double arrears,
  }) {
    showMilaakSheet<void>(
      context,
      _NotificationsSheet(
        officeName: officeName,
        propertiesCount: properties.length,
        openMaintenance: openMaintenance,
        closeContracts: closeContracts,
        recentLogs: recentLogs,
        arrears: arrears,
      ),
    );
  }

  Future<void> _exportDashboardPdf(
    BuildContext context, {
    required List<PropertyRecord> properties,
    required List<TenantRecord> tenants,
    required List<PaymentRecord> payments,
    required List<ContractRecord> contracts,
    required List<UtilityBillRecord> utilityBills,
  }) async {
    await PdfService().shareDashboard(
      context: context,
      properties: properties,
      tenants: tenants,
      payments: payments,
      contracts: contracts,
      utilityBills: utilityBills,
    );
  }
}

Future<void> _refreshDashboard(WidgetRef ref) async {
  ref.invalidate(propertiesProvider);
  ref.invalidate(tenantsProvider);
  ref.invalidate(paymentsProvider);
  ref.invalidate(contractsProvider);
  ref.invalidate(chargeableUtilityBillsProvider);
  await Future<void>.delayed(const Duration(milliseconds: 250));
}

double _utilityDebtForTenant(List<UtilityBillRecord> bills, int tenantId) {
  return bills
      .where(
        (bill) =>
            bill.tenantId == tenantId &&
            bill.status == 'open' &&
            bill.chargeToTenant,
      )
      .fold<double>(0, (sum, bill) => sum + bill.amount);
}

List<double> _monthlyCollections(List<PaymentRecord> payments, DateTime now) {
  final start = DateTime(now.year, now.month, 1);
  return List<double>.generate(6, (index) {
    final month = DateTime(start.year, start.month - 5 + index, 1);
    return payments
        .where(
          (payment) =>
              payment.status == 'paid' &&
              payment.date.year == month.year &&
              payment.date.month == month.month,
        )
        .fold<double>(0, (sum, item) => sum + item.amount);
  });
}

String _monthShortLabel(int month) {
  switch (month) {
    case 1:
      return 'ينا';
    case 2:
      return 'فبر';
    case 3:
      return 'مار';
    case 4:
      return 'أبر';
    case 5:
      return 'ماي';
    case 6:
      return 'يون';
    case 7:
      return 'يول';
    case 8:
      return 'أغس';
    case 9:
      return 'سبت';
    case 10:
      return 'أكت';
    case 11:
      return 'نوف';
    case 12:
      return 'ديس';
    default:
      return '';
  }
}

String _relativeTime(DateTime value) {
  final now = DateTime.now();
  final diff = now.difference(value);
  if (diff.inMinutes < 1) return 'الآن';
  if (diff.inHours < 1) return 'قبل ${diff.inMinutes} د';
  if (diff.inHours < 24) return 'قبل ${diff.inHours} س';
  if (diff.inDays == 1) return 'أمس';
  if (diff.inDays < 7) return 'قبل ${diff.inDays} أيام';
  return formatDate(value);
}

String _compactCurrency(double value) {
  if (value >= 1000000) {
    return '${(value / 1000000).toStringAsFixed(value % 1000000 == 0 ? 0 : 1)}م';
  }
  if (value >= 1000) {
    return '${(value / 1000).toStringAsFixed(value % 1000 == 0 ? 0 : 1)}أ';
  }
  return value.toStringAsFixed(0);
}

IconData _auditIcon(String action) {
  switch (action) {
    case 'approve_contract':
      return Icons.description_rounded;
    case 'record_payment':
      return Icons.receipt_long_rounded;
    case 'send_message':
      return Icons.sms_rounded;
    case 'create_maintenance_ticket':
      return Icons.build_circle_rounded;
    case 'update_maintenance_status':
      return Icons.tune_rounded;
    case 'create_property':
      return Icons.apartment_rounded;
    case 'create_tenant':
      return Icons.groups_rounded;
    default:
      return Icons.manage_history_rounded;
  }
}

Color _auditColor(String action) {
  switch (action) {
    case 'record_payment':
      return MilaakColors.collected;
    case 'approve_contract':
      return MilaakColors.contractGold;
    case 'send_message':
      return MilaakColors.utilityBlue;
    case 'create_maintenance_ticket':
    case 'update_maintenance_status':
      return MilaakColors.primaryDark;
    case 'create_property':
      return MilaakColors.primary;
    case 'create_tenant':
      return MilaakColors.charcoal;
    default:
      return MilaakColors.textSoft;
  }
}

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader({
    required this.officeName,
    required this.alertsCount,
    required this.onNotifications,
    required this.onPdf,
    required this.onMore,
  });

  final String officeName;
  final int alertsCount;
  final VoidCallback onNotifications;
  final VoidCallback onPdf;
  final VoidCallback onMore;

  @override
  Widget build(BuildContext context) {
    return MilaakGlassPanel(
      blurSigma: 16,
      radius: 30,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      fillColor: MilaakColors.glassSurfaceFor(context, strong: true),
      borderColor: MilaakColors.glassBorderFor(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            textDirection: TextDirection.ltr,
            children: [
              _HeaderIconButton(
                icon: Icons.notifications_none_rounded,
                badgeCount: alertsCount,
                onTap: onNotifications,
              ),
              const SizedBox(width: 8),
              _HeaderPillButton(
                icon: Icons.picture_as_pdf_rounded,
                label: 'تقرير',
                onTap: onPdf,
              ),
              const SizedBox(width: 8),
              _HeaderAvatar(onTap: onMore),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            'صباح الخير، $officeName',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: MilaakColors.textPrimaryFor(context),
              fontWeight: FontWeight.w900,
              height: 1.05,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'إدارة جميع عقاراتك من مكان واحد.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: MilaakColors.textSoftFor(context),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  const _HeaderIconButton({
    required this.icon,
    required this.onTap,
    this.badgeCount,
  });

  final IconData icon;
  final VoidCallback onTap;
  final int? badgeCount;

  @override
  Widget build(BuildContext context) {
    return MilaakGlassPanel(
      blurSigma: 10,
      radius: 16,
      padding: EdgeInsets.zero,
      fillColor: MilaakColors.glassSurfaceFor(context),
      borderColor: MilaakColors.glassBorderFor(context),
      child: SizedBox(
        width: 44,
        height: 44,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: onTap,
                child: SizedBox(
                  width: 44,
                  height: 44,
                  child: Icon(
                    icon,
                    color: MilaakColors.textPrimaryFor(context),
                    size: 21,
                  ),
                ),
              ),
            ),
            if (badgeCount != null && badgeCount! > 0)
              PositionedDirectional(
                top: -2,
                end: -2,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 1.5,
                  ),
                  decoration: BoxDecoration(
                    color: MilaakColors.arrears,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    badgeCount! > 9 ? '9+' : '$badgeCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _HeaderPillButton extends StatelessWidget {
  const _HeaderPillButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MilaakGlassPanel(
      blurSigma: 10,
      radius: 16,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      fillColor: MilaakColors.glassSurfaceFor(context),
      borderColor: MilaakColors.primary.withValues(alpha: .24),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: SizedBox(
            height: 44,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: MilaakColors.primaryDark, size: 20),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    color: MilaakColors.textPrimaryFor(context),
                    fontWeight: FontWeight.w900,
                    fontSize: 12.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderAvatar extends StatelessWidget {
  const _HeaderAvatar({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MilaakGlassPanel(
      blurSigma: 10,
      radius: 22,
      padding: const EdgeInsets.all(5),
      fillColor: MilaakColors.glassSurfaceFor(context),
      borderColor: MilaakColors.glassBorderFor(context),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: SizedBox(
            width: 34,
            height: 34,
            child: MilaakLogoMark(
              size: 34,
              darkTile: MilaakColors.isDark(context),
            ),
          ),
        ),
      ),
    );
  }
}

class _OccupancyHero extends StatelessWidget {
  const _OccupancyHero({
    required this.occupancy,
    required this.occupiedUnits,
    required this.vacantUnits,
    required this.totalUnits,
    required this.monthlyIncome,
  });

  final double occupancy;
  final int occupiedUnits;
  final int vacantUnits;
  final int totalUnits;
  final double monthlyIncome;

  @override
  Widget build(BuildContext context) {
    return MilaakGlassPanel(
      blurSigma: 18,
      radius: 28,
      padding: const EdgeInsets.all(18),
      fillColor: MilaakColors.isDark(context)
          ? MilaakColors.glassDarkStrong
          : MilaakColors.glassLightStrong,
      borderColor: MilaakColors.isDark(context)
          ? Colors.white.withValues(alpha: .12)
          : Colors.white.withValues(alpha: .42),
      shadowColor: MilaakColors.primaryDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: MilaakColors.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: MilaakColors.primary.withValues(alpha: .22),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.apartment_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'إشغال العقارات',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '$occupiedUnits من $totalUnits وحدة مشغولة',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withValues(alpha: .78),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '${(occupancy * 100).round()}%',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: MilaakColors.primary,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          MilaakProgressBar(
            value: occupancy,
            color: MilaakColors.primary,
            backgroundColor: Colors.white.withValues(alpha: .08),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _HeroStat(
                title: 'مشغولة',
                value: '$occupiedUnits',
                color: MilaakColors.primary,
              ),
              const SizedBox(width: 10),
              _HeroStat(
                title: 'شاغرة',
                value: '$vacantUnits',
                color: MilaakColors.textSoftFor(context),
              ),
              const SizedBox(width: 10),
              _HeroStat(
                title: 'هذا الشهر',
                value: formatCurrency(monthlyIncome),
                color: MilaakColors.collected,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroStat extends StatelessWidget {
  const _HeroStat({
    required this.title,
    required this.value,
    required this.color,
  });

  final String title;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: .04),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: .08)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white.withValues(alpha: .68),
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerRight,
              child: Text(
                value,
                maxLines: 1,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickActionTile extends StatelessWidget {
  const _QuickActionTile({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96,
      child: MilaakSoftCard(
        onTap: onTap,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: color.withValues(alpha: .12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class _RevenueChartCard extends StatelessWidget {
  const _RevenueChartCard({
    required this.series,
    required this.currentMonthTotal,
    required this.monthlyTotal,
  });

  final List<double> series;
  final double currentMonthTotal;
  final double monthlyTotal;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final maxValue = series.fold<double>(
      0,
      (sum, item) => item > sum ? item : sum,
    );
    final maxY = maxValue <= 0 ? 1000.0 : maxValue * 1.25;
    final interval = maxY <= 0 ? 1000.0 : maxY / 4;

    return MilaakSoftCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MilaakSectionHeader(
            title: 'التحصيل الشهري',
            subtitle: 'مخطط سريع لآخر 6 أشهر.',
            trailing: MilaakStatusBadge(
              label: formatCurrency(currentMonthTotal),
              color: MilaakColors.collected,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _InfoPill(
                  label: 'هذا الشهر',
                  value: formatCurrency(currentMonthTotal),
                  color: MilaakColors.collected,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _InfoPill(
                  label: 'إجمالي 6 أشهر',
                  value: formatCurrency(monthlyTotal),
                  color: MilaakColors.primaryDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 240,
            child: BarChart(
              BarChartData(
                maxY: maxY,
                alignment: BarChartAlignment.spaceAround,
                barTouchData: BarTouchData(enabled: false),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: interval,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: MilaakColors.borderFor(context),
                    strokeWidth: 1,
                  ),
                ),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 44,
                      interval: interval,
                      getTitlesWidget: (value, meta) {
                        if (value <= 0) {
                          return const SizedBox.shrink();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Text(
                            _compactCurrency(value),
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: MilaakColors.textSoftFor(context),
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 32,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index < 0 || index >= series.length) {
                          return const SizedBox.shrink();
                        }
                        final month = DateTime(
                          now.year,
                          now.month - 5 + index,
                          1,
                        );
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            _monthShortLabel(month.month),
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: MilaakColors.textSoftFor(context),
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                barGroups: List.generate(series.length, (index) {
                  final value = series[index];
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: value <= 0 ? .1 : value,
                        width: 18,
                        borderRadius: BorderRadius.circular(10),
                        color: index == series.length - 1
                            ? MilaakColors.primary
                            : MilaakColors.primaryDark,
                        backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: maxY,
                          color: MilaakColors.primarySoft.withValues(
                            alpha: .16,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoPill extends StatelessWidget {
  const _InfoPill({
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withValues(alpha: .14)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: MilaakColors.textSoftFor(context),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  const _ActivityCard({required this.logs, required this.onOpenAll});

  final List<AuditLogRecord> logs;
  final VoidCallback onOpenAll;

  @override
  Widget build(BuildContext context) {
    return MilaakSoftCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MilaakSectionHeader(
            title: 'آخر العمليات',
            subtitle: 'سجل مختصر للحركة اليومية داخل التطبيق.',
            trailing: TextButton(
              onPressed: onOpenAll,
              child: const Text('سجل كامل'),
            ),
          ),
          const SizedBox(height: 12),
          if (logs.isEmpty)
            Text(
              'لا توجد عمليات حديثة بعد.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: MilaakColors.textSoftFor(context),
                fontWeight: FontWeight.w700,
              ),
            )
          else
            ...logs.map((log) => _ActivityTile(log: log)),
        ],
      ),
    );
  }
}

class _ActivityTile extends StatelessWidget {
  const _ActivityTile({required this.log});

  final AuditLogRecord log;

  @override
  Widget build(BuildContext context) {
    final color = _auditColor(log.action);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          MilaakIconBadge(icon: _auditIcon(log.action), color: color, size: 46),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  log.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 2),
                Text(
                  '${log.entityType} · ${_relativeTime(log.createdAt)}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: MilaakColors.textSoftFor(context),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: color.withValues(alpha: .10),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: color.withValues(alpha: .16)),
            ),
            child: Text(
              log.action,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w800,
                fontSize: 10.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _UpcomingContractsCard extends StatelessWidget {
  const _UpcomingContractsCard({required this.contracts});

  final List<ContractRecord> contracts;

  @override
  Widget build(BuildContext context) {
    return MilaakSoftCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MilaakSectionHeader(
            title: 'العقود القريبة',
            subtitle: 'العقود التي تحتاج متابعة أو تجديد قريباً.',
          ),
          const SizedBox(height: 12),
          if (contracts.isEmpty)
            Text(
              'لا توجد عقود قريبة من الانتهاء.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: MilaakColors.textSoftFor(context),
                fontWeight: FontWeight.w700,
              ),
            )
          else
            ...contracts
                .take(4)
                .map((contract) => _ContractReminderTile(contract: contract)),
        ],
      ),
    );
  }
}

class _ReportSheet extends StatelessWidget {
  const _ReportSheet({
    required this.onToday,
    required this.onMonth,
    required this.onYear,
  });

  final VoidCallback onToday;
  final VoidCallback onMonth;
  final VoidCallback onYear;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'تقرير لوحة التحكم',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 6),
        Text(
          'اختر نوع الملخص الذي تريد إخراجه.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: MilaakColors.textSoftFor(context),
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        _SheetAction(
          icon: Icons.today_rounded,
          title: 'تقرير اليوم',
          subtitle: 'التحصيل والنشاط الحالي',
          color: MilaakColors.primaryDark,
          onTap: onToday,
        ),
        const SizedBox(height: 10),
        _SheetAction(
          icon: Icons.date_range_rounded,
          title: 'تقرير الشهر',
          subtitle: 'ملخص تحصيل وديون الشهر',
          color: MilaakColors.collected,
          onTap: onMonth,
        ),
        const SizedBox(height: 10),
        _SheetAction(
          icon: Icons.calendar_month_rounded,
          title: 'تقرير السنة',
          subtitle: 'نظرة عامة على الأداء السنوي',
          color: MilaakColors.contractGold,
          onTap: onYear,
        ),
      ],
    );
  }
}

class _NotificationsSheet extends StatelessWidget {
  const _NotificationsSheet({
    required this.officeName,
    required this.propertiesCount,
    required this.openMaintenance,
    required this.closeContracts,
    required this.recentLogs,
    required this.arrears,
  });

  final String officeName;
  final int propertiesCount;
  final List<MaintenanceTicketRecord> openMaintenance;
  final List<ContractRecord> closeContracts;
  final List<AuditLogRecord> recentLogs;
  final double arrears;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'تنبيهات $officeName',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 6),
          Text(
            'أهم ما يحتاج متابعة حالياً.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: MilaakColors.textSoftFor(context),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _InfoPill(
                  label: 'العقارات',
                  value: '$propertiesCount',
                  color: MilaakColors.primaryDark,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _InfoPill(
                  label: 'الصيانة',
                  value: '${openMaintenance.length}',
                  color: MilaakColors.utilityBlue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _InfoPill(
                  label: 'العقود القريبة',
                  value: '${closeContracts.length}',
                  color: MilaakColors.contractGold,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _InfoPill(
                  label: 'المستحقات',
                  value: formatCurrency(arrears),
                  color: MilaakColors.arrears,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'أحدث السجلات',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 10),
          if (recentLogs.isEmpty)
            Text(
              'لا يوجد نشاط حديث.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: MilaakColors.textSoftFor(context),
                fontWeight: FontWeight.w700,
              ),
            )
          else
            ...recentLogs.map((log) => _ActivityTile(log: log)),
        ],
      ),
    );
  }
}

class _SheetAction extends StatelessWidget {
  const _SheetAction({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MilaakSoftCard(
      onTap: onTap,
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          MilaakIconBadge(icon: icon, color: color, size: 48),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: MilaakColors.textSoftFor(context),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_left_rounded,
            color: MilaakColors.textSoftFor(context),
          ),
        ],
      ),
    );
  }
}

class _ContractReminderTile extends StatelessWidget {
  const _ContractReminderTile({required this.contract});

  final ContractRecord contract;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const MilaakIconBadge(
            icon: Icons.description_rounded,
            color: MilaakColors.contractGold,
            size: 44,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contract.tenantName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 2),
                Text(
                  '${contract.propertyName} - ينتهي ${formatDate(contract.endDate)}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: MilaakColors.textSoftFor(context),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Text(
            formatCurrency(contract.rentAmount),
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              color: MilaakColors.primaryDark,
            ),
          ),
        ],
      ),
    );
  }
}
