import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../../data/repositories/rental_repositories.dart';
import '../../shared/widgets/milaak_ui.dart';

class SetupScreen extends ConsumerStatefulWidget {
  const SetupScreen({super.key});

  @override
  ConsumerState<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends ConsumerState<SetupScreen> {
  final _controller = TextEditingController(text: 'مكتب مِلاك العقاري');
  bool _saving = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    await ref.read(settingsRepositoryProvider).saveOfficeName(_controller.text);
    ref.invalidate(startupOfficeNameProvider);
    if (mounted) setState(() => _saving = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: MilaakGlassBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                const Spacer(),
                MilaakLogoMark(
                  size: 150,
                  darkTile: MilaakColors.isDark(context),
                ),
                const SizedBox(height: 24),
                Text(
                  'مرحباً بك في مِلاك',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'إدارة الإيجارات والعقود والتحصيل محلياً وبشكل سريع.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: MilaakColors.textSoftFor(context),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 28),
                MilaakGlassPanel(
                  blurSigma: 16,
                  radius: 28,
                  padding: const EdgeInsets.all(18),
                  fillColor: MilaakColors.glassSurfaceFor(
                    context,
                    strong: true,
                  ),
                  borderColor: MilaakColors.glassBorderFor(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'اسم المكتب أو المحفظة',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _controller,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.business_rounded),
                          hintText: 'مثال: مكتب مِلاك العقاري',
                        ),
                        onSubmitted: (_) => _save(),
                      ),
                      const SizedBox(height: 16),
                      FilledButton.icon(
                        onPressed: _saving ? null : _save,
                        icon: _saving
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.arrow_back_rounded),
                        label: const Text('بدء الاستخدام'),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
