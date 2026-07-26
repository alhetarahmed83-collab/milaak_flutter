import 'package:flutter/material.dart';

import '../../app/theme.dart';
import 'milaak_ui.dart';

class ScreenScaffold extends StatelessWidget {
  const ScreenScaffold({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    this.action,
    this.actions = const [],
    this.footer,
    this.showLogo = true,
  });

  final String title;
  final String subtitle;
  final Widget child;
  final Widget? action;
  final List<Widget> actions;
  final Widget? footer;
  final bool showLogo;

  @override
  Widget build(BuildContext context) {
    return MilaakGlassBackground(
      child: SafeArea(
        top: true,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            MilaakSpacing.page,
            8,
            MilaakSpacing.page,
            12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MilaakGlassPanel(
                blurSigma: 16,
                radius: 30,
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                fillColor: MilaakColors.glassSurfaceFor(context, strong: true),
                borderColor: MilaakColors.glassBorderFor(context),
                child: _PageHeader(
                  title: title,
                  subtitle: subtitle,
                  action: action,
                  actions: actions,
                  showLogo: showLogo,
                ),
              ),
              const SizedBox(height: 14),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: MilaakSpacing.floatingDockBottomInset,
                  ),
                  child: child,
                ),
              ),
              if (footer != null) ...[const SizedBox(height: 12), footer!],
            ],
          ),
        ),
      ),
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader({
    required this.title,
    required this.subtitle,
    required this.action,
    required this.actions,
    required this.showLogo,
  });

  final String title;
  final String subtitle;
  final Widget? action;
  final List<Widget> actions;
  final bool showLogo;

  @override
  Widget build(BuildContext context) {
    final titleBlock = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
            height: 1.08,
            color: MilaakColors.textPrimaryFor(context),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: MilaakColors.textSoftFor(context),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );

    final actionBlock = Wrap(
      spacing: 9,
      runSpacing: 9,
      children: [...actions, if (action != null) action!],
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 390;
        if (compact) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (showLogo) ...[
                    MilaakLogoMark(
                      size: 48,
                      darkTile: MilaakColors.isDark(context),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(child: titleBlock),
                ],
              ),
              if (action != null || actions.isNotEmpty) ...[
                const SizedBox(height: 12),
                actionBlock,
              ],
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (showLogo) ...[
              MilaakLogoMark(size: 50, darkTile: MilaakColors.isDark(context)),
              const SizedBox(width: 12),
            ],
            Expanded(child: titleBlock),
            if (action != null || actions.isNotEmpty) actionBlock,
          ],
        );
      },
    );
  }
}
