import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../app/theme.dart';

class GlassDockItem {
  const GlassDockItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
}

/// The app-wide floating navigation dock. It deliberately overlays content
/// instead of reserving a bottom-navigation area in the page layout.
class GlassBottomDock extends StatelessWidget {
  const GlassBottomDock({
    super.key,
    required this.index,
    required this.items,
    required this.onSelected,
    required this.onAdd,
  });

  final int index;
  final List<GlassDockItem> items;
  final ValueChanged<int> onSelected;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = math.min(constraints.maxWidth - 8, 344.0);
        const addButtonSize = 60.0;
        const gap = 6.0;
        final dockWidth = math.max(0.0, totalWidth - addButtonSize - gap);
        return Align(
          alignment: Alignment.center,
          child: Transform.translate(
            offset: const Offset(4, 0),
            child: SizedBox(
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
                          horizontal: 4,
                          vertical: 10,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            textDirection: TextDirection.ltr,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              for (
                                var itemIndex = 0;
                                itemIndex < items.length;
                                itemIndex++
                              ) ...[
                                if (itemIndex > 0) const SizedBox(width: 4),
                                _DockNavButton(
                                  item: items[itemIndex],
                                  selected: index == itemIndex,
                                  onTap: () => onSelected(itemIndex),
                                ),
                              ],
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
            ),
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

  final GlassDockItem item;
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
            width: selected ? 104 : 40,
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
              mainAxisSize: MainAxisSize.max,
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
                if (selected) ...[
                  const SizedBox(width: 6),
                  Expanded(
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
                      child: Text(
                        item.label,
                        key: ValueKey(item.label),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: const TextStyle(
                          color: MilaakColors.charcoal,
                          fontWeight: FontWeight.w900,
                          fontSize: 9.5,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ],
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
