import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../app/theme.dart';

class MilaakLogoMark extends StatelessWidget {
  const MilaakLogoMark({
    super.key,
    this.size = 54,
    this.showText = false,
    this.darkTile = false,
  });

  final double size;
  final bool showText;
  final bool darkTile;

  @override
  Widget build(BuildContext context) {
    final logo = ClipRRect(
      borderRadius: BorderRadius.circular(size * .22),
      child: Image.asset(
        darkTile
            ? 'assets/brand/milaak_logo_dark.png'
            : 'assets/brand/milaak_logo_light.png',
        width: size,
        height: size,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: MilaakColors.primarySoft,
            borderRadius: BorderRadius.circular(size * .22),
          ),
          child: Icon(
            Icons.apartment_rounded,
            color: MilaakColors.primary,
            size: size * .54,
          ),
        ),
      ),
    );

    if (!showText) return logo;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        logo,
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'مِلاك',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: MilaakColors.textPrimaryFor(context),
                fontSize: 17,
              ),
            ),
            SizedBox(height: 1),
            Text(
              'إدارة الإيجارات',
              style: TextStyle(
                color: MilaakColors.textSoftFor(context),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MilaakGlassPanel extends StatelessWidget {
  const MilaakGlassPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin,
    this.onTap,
    this.blurSigma = 0,
    this.radius = MilaakRadii.lg,
    this.fillColor,
    this.borderColor,
    this.shadowColor,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final double blurSigma;
  final double radius;
  final Color? fillColor;
  final Color? borderColor;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    final isDark = MilaakColors.isDark(context);
    final resolvedFill =
        fillColor ??
        (isDark ? MilaakColors.glassDark : MilaakColors.glassLight);
    final resolvedBorder = borderColor ?? MilaakColors.glassBorderFor(context);
    final resolvedShadow =
        shadowColor ?? (isDark ? Colors.black : const Color(0xFF0F172A));
    final borderRadius = BorderRadius.circular(radius);
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.lerp(resolvedFill, Colors.white, isDark ? .06 : .12) ??
            resolvedFill,
        Color.lerp(resolvedFill, Colors.black, isDark ? .04 : .02) ??
            resolvedFill,
      ],
    );

    Widget surface = Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
        border: Border.all(color: resolvedBorder),
      ),
      child: Material(
        color: Colors.transparent,
        child: onTap == null
            ? Padding(padding: padding, child: child)
            : InkWell(
                borderRadius: borderRadius,
                onTap: onTap,
                child: Padding(padding: padding, child: child),
              ),
      ),
    );

    if (blurSigma > 0) {
      surface = BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: surface,
      );
    }

    final boxShadows = resolvedShadow.a == 0
        ? const <BoxShadow>[]
        : MilaakShadows.soft(resolvedShadow);

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: boxShadows,
      ),
      child: ClipRRect(borderRadius: borderRadius, child: surface),
    );
  }
}

class MilaakSoftCard extends StatelessWidget {
  const MilaakSoftCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin,
    this.onTap,
    this.color = MilaakColors.surface,
    this.borderColor = MilaakColors.border,
    this.blurSigma = 6,
    this.glass = true,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final Color color;
  final Color borderColor;
  final double blurSigma;
  final bool glass;

  @override
  Widget build(BuildContext context) {
    final isDark = MilaakColors.isDark(context);
    final resolvedSurface = color == MilaakColors.surface
        ? MilaakColors.glassSurfaceFor(context)
        : color == MilaakColors.softSurface
        ? MilaakColors.glassSurfaceFor(context, strong: true)
        : color == MilaakColors.background
        ? MilaakColors.backgroundFor(context)
        : color;
    final resolvedBorder = borderColor == MilaakColors.border
        ? MilaakColors.glassBorderFor(context)
        : borderColor;
    return MilaakGlassPanel(
      margin: margin,
      padding: padding,
      onTap: onTap,
      blurSigma: glass ? blurSigma : 0,
      radius: MilaakRadii.lg,
      fillColor: resolvedSurface,
      borderColor: resolvedBorder,
      shadowColor: isDark ? Colors.black : const Color(0xFF0F172A),
      child: child,
    );
  }
}

class MilaakGlassBackground extends StatelessWidget {
  const MilaakGlassBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDark = MilaakColors.isDark(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark
              ? [MilaakColors.darkWarmBackground, MilaakColors.darkBackground]
              : [MilaakColors.warmBackground, MilaakColors.background],
        ),
      ),
      child: child,
    );
  }
}

class MilaakIconBadge extends StatelessWidget {
  const MilaakIconBadge({
    super.key,
    required this.icon,
    this.color = MilaakColors.primary,
    this.size = 48,
    this.background,
  });

  final IconData icon;
  final Color color;
  final double size;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    final isDark = MilaakColors.isDark(context);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: background ?? color.withValues(alpha: isDark ? .18 : .12),
        borderRadius: BorderRadius.circular(size * .36),
        border: Border.all(color: color.withValues(alpha: isDark ? .22 : .16)),
      ),
      child: Icon(icon, color: color, size: size * .52),
    );
  }
}

class MilaakStatusBadge extends StatelessWidget {
  const MilaakStatusBadge({
    super.key,
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final isDark = MilaakColors.isDark(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: isDark ? .16 : .12),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: isDark ? .26 : .18)),
      ),
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w900,
          fontSize: 12,
        ),
      ),
    );
  }
}

class MilaakStatCard extends StatelessWidget {
  const MilaakStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.color = MilaakColors.primary,
    this.subtitle,
    this.onTap,
  });

  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final String? subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return MilaakSoftCard(
      onTap: onTap,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: color.withValues(alpha: .12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: MilaakColors.textSoftFor(context),
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerRight,
            child: Text(
              value,
              maxLines: 1,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
                color: color,
              ),
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(
              subtitle!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: MilaakColors.textSoftFor(context),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class MilaakQuickButton extends StatelessWidget {
  const MilaakQuickButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.filled = false,
    this.color = MilaakColors.primary,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool filled;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final isDark = MilaakColors.isDark(context);
    final foreground = filled
        ? Colors.white
        : MilaakColors.textPrimaryFor(context);
    final iconBackground = filled
        ? Colors.white.withValues(alpha: .15)
        : color.withValues(alpha: .12);

    return SizedBox(
      width: 96,
      child: MilaakGlassPanel(
        blurSigma: 10,
        radius: MilaakRadii.lg,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        fillColor: filled
            ? color.withValues(alpha: isDark ? .82 : .88)
            : MilaakColors.glassSurfaceFor(context),
        borderColor: filled
            ? color.withValues(alpha: .54)
            : MilaakColors.glassBorderFor(context),
        shadowColor: filled
            ? color
            : (isDark ? Colors.black : const Color(0xFF0F172A)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(MilaakRadii.lg),
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: iconBackground,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: filled
                          ? Colors.white.withValues(alpha: .16)
                          : color.withValues(alpha: .14),
                    ),
                  ),
                  child: Icon(
                    icon,
                    color: filled ? Colors.white : color,
                    size: 20,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: foreground,
                    fontWeight: FontWeight.w900,
                    fontSize: 12,
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

class MilaakSectionHeader extends StatelessWidget {
  const MilaakSectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
  });

  final String title;
  final String? subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: MilaakColors.textPrimaryFor(context),
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: MilaakColors.textSoftFor(context),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ],
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}

class MilaakProgressBar extends StatelessWidget {
  const MilaakProgressBar({
    super.key,
    required this.value,
    this.color = MilaakColors.primary,
    this.backgroundColor,
  });

  final double value;
  final Color color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final isDark = MilaakColors.isDark(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: LinearProgressIndicator(
        minHeight: 8,
        value: value.clamp(0, 1),
        backgroundColor:
            backgroundColor ?? color.withValues(alpha: isDark ? .16 : .12),
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}

class MilaakPropertyCover extends StatelessWidget {
  const MilaakPropertyCover({super.key, required this.icon, this.height = 118});

  final IconData icon;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          colors: [MilaakColors.charcoal, MilaakColors.primaryDark],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Stack(
        children: [
          PositionedDirectional(
            end: 16,
            bottom: 12,
            child: Icon(
              icon,
              color: Colors.white.withValues(alpha: .9),
              size: 58,
            ),
          ),
          PositionedDirectional(
            start: 16,
            top: 14,
            child: Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: MilaakColors.primarySoft.withValues(alpha: .18),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Icon(Icons.home_work_rounded, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
