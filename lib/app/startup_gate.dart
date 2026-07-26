import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme.dart';
import '../data/repositories/rental_repositories.dart';
import '../features/settings/setup_screen.dart';
import '../shared/widgets/milaak_ui.dart';
import 'app_shell.dart';

class StartupGate extends ConsumerWidget {
  const StartupGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final officeName = ref.watch(startupOfficeNameProvider);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: officeName.when(
        loading: () => Scaffold(
          backgroundColor: Colors.transparent,
          body: MilaakGlassBackground(
            child: Center(
              child: MilaakGlassPanel(
                blurSigma: 20,
                radius: 30,
                padding: const EdgeInsets.fromLTRB(26, 28, 26, 24),
                fillColor: MilaakColors.glassSurfaceFor(context, strong: true),
                borderColor: MilaakColors.glassBorderFor(context),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MilaakLogoMark(
                      size: 132,
                      darkTile: MilaakColors.isDark(context),
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: 140,
                      child: LinearProgressIndicator(
                        color: MilaakColors.primary,
                        backgroundColor: MilaakColors.primary.withValues(
                          alpha: .14,
                        ),
                        minHeight: 6,
                        borderRadius: BorderRadius.circular(99),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        error: (error, stackTrace) => Scaffold(
          backgroundColor: Colors.transparent,
          body: MilaakGlassBackground(
            child: Center(
              child: MilaakGlassPanel(
                blurSigma: 16,
                radius: 26,
                padding: const EdgeInsets.all(20),
                fillColor: MilaakColors.glassSurfaceFor(context, strong: true),
                borderColor: MilaakColors.glassBorderFor(context),
                child: Text('تعذر فتح قاعدة البيانات: $error'),
              ),
            ),
          ),
        ),
        data: (name) => (name == null || name.trim().isEmpty)
            ? const SetupScreen()
            : AppShell(officeName: name),
      ),
    );
  }
}
