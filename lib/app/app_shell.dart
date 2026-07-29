import 'package:flutter/material.dart';

import '../features/contracts/contracts_screen.dart';
import '../features/dashboard/dashboard_screen.dart';
import '../features/payments/payments_screen.dart';
import '../features/properties/properties_screen.dart';
import '../features/settings/more_screen.dart';
import '../features/tenants/tenants_screen.dart';
import '../shared/widgets/form_helpers.dart';
import '../shared/widgets/glass_bottom_dock.dart';
import '../shared/widgets/milaak_ui.dart';
import 'theme.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.officeName});

  final String officeName;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _index = 0;
  final Set<int> _visitedTabs = {0};

  late final _pages = const [
    DashboardScreen(),
    PropertiesScreen(),
    TenantsScreen(),
    MoreScreen(),
  ];

  static const _items = [
    GlassDockItem(
      icon: Icons.dashboard_outlined,
      selectedIcon: Icons.dashboard_rounded,
      label: 'الرئيسية',
    ),
    GlassDockItem(
      icon: Icons.apartment_outlined,
      selectedIcon: Icons.apartment_rounded,
      label: 'العقارات',
    ),
    GlassDockItem(
      icon: Icons.groups_outlined,
      selectedIcon: Icons.groups_rounded,
      label: 'المستأجرون',
    ),
    GlassDockItem(
      icon: Icons.grid_view_outlined,
      selectedIcon: Icons.grid_view_rounded,
      label: 'المزيد',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: MilaakGlassBackground(
              child: Stack(
                children: [
                  for (final index in _visitedTabs)
                    Positioned.fill(
                      child: Offstage(
                        offstage: _index != index,
                        child: TickerMode(
                          enabled: _index == index,
                          child: _pages[index],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          PositionedDirectional(
            start: 0,
            end: 0,
            bottom: 20,
            child: SafeArea(
              top: false,
              bottom: true,
              child: GlassBottomDock(
                index: _index,
                items: _items,
                onSelected: _selectTab,
                onAdd: _showContextualAdd,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _selectTab(int value) {
    setState(() {
      _index = value;
      _visitedTabs.add(value);
    });
  }

  void _showQuickAddSheet() {
    showMilaakSheet<void>(
      context,
      _QuickAddSheet(
        onProperty: () => _openPage(const PropertiesScreen()),
        onTenant: () => _openPage(const TenantsScreen()),
        onContract: () => _openPage(const ContractsScreen()),
        onPayment: () => _openPage(const PaymentsScreen()),
        onMore: () => _openPage(const MoreScreen()),
      ),
    );
  }

  void _showContextualAdd() {
    switch (_index) {
      case 1:
        showMilaakSheet<void>(context, const PropertyForm());
        return;
      case 2:
        showMilaakSheet<void>(context, const TenantForm());
        return;
      default:
        _showQuickAddSheet();
    }
  }

  void _openPage(Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }
}

class _QuickAddSheet extends StatelessWidget {
  const _QuickAddSheet({
    required this.onProperty,
    required this.onTenant,
    required this.onContract,
    required this.onPayment,
    required this.onMore,
  });

  final VoidCallback onProperty;
  final VoidCallback onTenant;
  final VoidCallback onContract;
  final VoidCallback onPayment;
  final VoidCallback onMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'إضافة سريعة',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 6),
        Text(
          'اختر العملية التي تريد البدء بها الآن.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: MilaakColors.textSoftFor(context),
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        _QuickAddTile(
          icon: Icons.apartment_rounded,
          title: 'إضافة عقار',
          subtitle: 'فتح شاشة العقارات',
          color: MilaakColors.primaryDark,
          onTap: onProperty,
        ),
        const SizedBox(height: 10),
        _QuickAddTile(
          icon: Icons.groups_rounded,
          title: 'إضافة مستأجر',
          subtitle: 'فتح شاشة المستأجرين',
          color: MilaakColors.charcoal,
          onTap: onTenant,
        ),
        const SizedBox(height: 10),
        _QuickAddTile(
          icon: Icons.description_rounded,
          title: 'إنشاء عقد',
          subtitle: 'الانتقال إلى العقود',
          color: MilaakColors.contractGold,
          onTap: onContract,
        ),
        const SizedBox(height: 10),
        _QuickAddTile(
          icon: Icons.receipt_long_rounded,
          title: 'سند قبض',
          subtitle: 'الانتقال إلى التحصيل',
          color: MilaakColors.collected,
          onTap: onPayment,
        ),
        const SizedBox(height: 10),
        _QuickAddTile(
          icon: Icons.grid_view_rounded,
          title: 'المزيد',
          subtitle: 'فتح الخدمات والإعدادات',
          color: MilaakColors.utilityBlue,
          onTap: onMore,
        ),
      ],
    );
  }
}

class _QuickAddTile extends StatelessWidget {
  const _QuickAddTile({
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
