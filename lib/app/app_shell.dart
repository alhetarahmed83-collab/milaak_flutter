import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../features/contracts/contracts_screen.dart';
import '../features/dashboard/dashboard_screen.dart';
import '../features/payments/payments_screen.dart';
import '../features/properties/properties_screen.dart';
import '../features/settings/more_screen.dart';
import '../features/tenants/tenants_screen.dart';
import '../shared/widgets/form_helpers.dart';
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
    _NavItem(
      icon: Icons.dashboard_outlined,
      selectedIcon: Icons.dashboard_rounded,
      label: 'الرئيسية',
    ),
    _NavItem(
      icon: Icons.apartment_outlined,
      selectedIcon: Icons.apartment_rounded,
      label: 'العقارات',
    ),
    _NavItem(
      icon: Icons.groups_outlined,
      selectedIcon: Icons.groups_rounded,
      label: 'المستأجرون',
    ),
    _NavItem(
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
              child: _FloatingGlassDock(
                index: _index,
                items: _items,
                onSelected: _selectTab,
                onAdd: _showQuickAddSheet,
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

  void _openPage(Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }
}

class _FloatingGlassDock extends StatelessWidget {
  const _FloatingGlassDock({
    required this.index,
    required this.items,
    required this.onSelected,
    required this.onAdd,
  });

  final int index;
  final List<_NavItem> items;
  final ValueChanged<int> onSelected;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = math.min(constraints.maxWidth - 24, 336.0);
        const addButtonSize = 60.0;
        const gap = 8.0;
        final dockWidth = math.max(0.0, totalWidth - addButtonSize - gap);
        return SizedBox(
          width: totalWidth,
          height: 76,
          child: Row(
            textDirection: TextDirection.ltr,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: dockWidth,
                height: 72,
                child: _GlassDockSurface(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        textDirection: TextDirection.ltr,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _DockNavButton(
                            item: items[0],
                            selected: index == 0,
                            onTap: () => onSelected(0),
                          ),
                          const SizedBox(width: 6),
                          _DockNavButton(
                            item: items[1],
                            selected: index == 1,
                            onTap: () => onSelected(1),
                          ),
                          const SizedBox(width: 6),
                          _DockNavButton(
                            item: items[2],
                            selected: index == 2,
                            onTap: () => onSelected(2),
                          ),
                          const SizedBox(width: 6),
                          _DockNavButton(
                            item: items[3],
                            selected: index == 3,
                            onTap: () => onSelected(3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: gap),
              _DockAddButton(onTap: onAdd),
            ],
          ),
        );
      },
    );
  }
}

class _GlassDockSurface extends StatelessWidget {
  const _GlassDockSurface({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDark = MilaakColors.isDark(context);
    final fill = isDark
        ? Colors.white.withValues(alpha: .08)
        : Colors.white.withValues(alpha: .24);
    final border = Colors.white.withValues(alpha: isDark ? .12 : .20);
    return ClipRRect(
      borderRadius: BorderRadius.circular(36),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 34, sigmaY: 34),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: fill,
            borderRadius: BorderRadius.circular(36),
            border: Border.all(color: border),
            boxShadow: [
              BoxShadow(
                color: (isDark ? Colors.black : const Color(0xFF0F172A))
                    .withValues(alpha: .12),
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withValues(alpha: isDark ? .22 : .32),
                          Colors.white.withValues(alpha: .04),
                          Colors.transparent,
                        ],
                        stops: const [0, .35, 1],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withValues(alpha: isDark ? .06 : .16),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

class _DockNavButton extends StatelessWidget {
  const _DockNavButton({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final _NavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = MilaakColors.isDark(context);
    final selectedFill = isDark
        ? Colors.white.withValues(alpha: .72)
        : Colors.white.withValues(alpha: .84);
    final selectedBorder = isDark
        ? Colors.white.withValues(alpha: .20)
        : Colors.white.withValues(alpha: .34);
    final iconColor = selected
        ? MilaakColors.charcoal
        : MilaakColors.textSoftFor(context);

    return Tooltip(
      message: item.label,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(19),
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 240),
            curve: Curves.easeOutCubic,
            height: 40,
            width: selected ? 78 : 42,
            padding: EdgeInsets.symmetric(horizontal: selected ? 8 : 0),
            decoration: BoxDecoration(
              color: selected ? selectedFill : Colors.transparent,
              borderRadius: BorderRadius.circular(19),
              border: selected ? Border.all(color: selectedBorder) : null,
              boxShadow: selected
                  ? [
                      BoxShadow(
                        color: (isDark ? Colors.black : const Color(0xFF0F172A))
                            .withValues(alpha: .08),
                        blurRadius: 12,
                        offset: const Offset(0, 5),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              textDirection: TextDirection.ltr,
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedScale(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOutCubic,
                  scale: selected ? 1 : .96,
                  child: Icon(
                    selected ? item.selectedIcon : item.icon,
                    color: iconColor,
                    size: 20,
                  ),
                ),
                if (selected)
                  Flexible(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      switchInCurve: Curves.easeOutCubic,
                      switchOutCurve: Curves.easeInCubic,
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(.16, 0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          ),
                        );
                      },
                      child: Padding(
                        key: ValueKey(item.label),
                        padding: const EdgeInsetsDirectional.only(start: 6),
                        child: Text(
                          item.label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: TextStyle(
                            color: MilaakColors.charcoal,
                            fontWeight: FontWeight.w900,
                            fontSize: 9.5,
                            height: 1,
                          ),
                        ),
                      ),
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

class _DockAddButton extends StatelessWidget {
  const _DockAddButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [MilaakColors.primary, MilaakColors.primaryDark],
            ),
            border: Border.all(color: Colors.white.withValues(alpha: .22)),
            boxShadow: MilaakShadows.lift(MilaakColors.primaryDark),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: .10),
                  ),
                ),
              ),
              const Center(
                child: Icon(Icons.add_rounded, color: Colors.white, size: 30),
              ),
            ],
          ),
        ),
      ),
    );
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

class _NavItem {
  const _NavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
}
