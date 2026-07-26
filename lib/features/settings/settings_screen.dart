import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../../data/repositories/rental_repositories.dart';
import '../../services/lock_service.dart';
import '../../shared/widgets/form_helpers.dart';
import '../../shared/widgets/milaak_ui.dart';
import '../../shared/widgets/screen_scaffold.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final _name = TextEditingController();
  final _phone = TextEditingController();
  String _currency = 'YER';
  String _themeMode = 'system';
  bool _busy = false;

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final officeName =
        ref.watch(officeNameProvider).valueOrNull ?? 'مكتب مِلاك العقاري';
    final officePhone = ref.watch(officePhoneProvider).valueOrNull ?? '';
    final currency = ref.watch(currencyProvider).valueOrNull ?? 'YER';
    final themeMode = ref.watch(themeModeProvider).valueOrNull ?? 'system';
    if (_name.text.isEmpty) _name.text = officeName;
    if (_phone.text.isEmpty) _phone.text = officePhone;
    if (_currency != currency && !_busy) _currency = currency;
    if (_themeMode != themeMode && !_busy) _themeMode = themeMode;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: const Text('الإعدادات')),
      body: ScreenScaffold(
        title: 'الإعدادات',
        subtitle: 'إدارة بيانات المكتب والنسخ الاحتياطي والقفل المحلي.',
        child: ListView(
          padding: const EdgeInsets.only(bottom: 18),
          children: [
            MilaakSoftCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MilaakSectionHeader(
                    title: 'بيانات المكتب',
                    subtitle: 'تظهر في التقارير والرسائل وسندات القبض.',
                  ),
                  const SizedBox(height: 16),
                  const FieldTitle('اسم المكتب'),
                  TextField(controller: _name),
                  const SizedBox(height: 12),
                  const FieldTitle('رقم المكتب'),
                  TextField(
                    controller: _phone,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: 'اختياري للرسائل والتقارير',
                    ),
                  ),
                  const SizedBox(height: 12),
                  const FieldTitle('العملة'),
                  DropdownButtonFormField<String>(
                    value: _currency,
                    items: const [
                      DropdownMenuItem(
                        value: 'YER',
                        child: Text('ريال يمني YER'),
                      ),
                      DropdownMenuItem(
                        value: 'SAR',
                        child: Text('ريال سعودي SAR'),
                      ),
                      DropdownMenuItem(
                        value: 'AED',
                        child: Text('درهم إماراتي AED'),
                      ),
                      DropdownMenuItem(
                        value: 'KWD',
                        child: Text('دينار كويتي KWD'),
                      ),
                      DropdownMenuItem(value: 'USD', child: Text('دولار USD')),
                    ],
                    onChanged: (value) =>
                        setState(() => _currency = value ?? 'YER'),
                  ),
                  const SizedBox(height: 16),
                  const FieldTitle('ثيم التطبيق'),
                  SegmentedButton<String>(
                    segments: const [
                      ButtonSegment(
                        value: 'system',
                        label: Text('النظام'),
                        icon: Icon(Icons.brightness_auto_rounded),
                      ),
                      ButtonSegment(
                        value: 'light',
                        label: Text('نهاري'),
                        icon: Icon(Icons.light_mode_rounded),
                      ),
                      ButtonSegment(
                        value: 'dark',
                        label: Text('داكن'),
                        icon: Icon(Icons.dark_mode_rounded),
                      ),
                    ],
                    selected: {_themeMode},
                    showSelectedIcon: false,
                    emptySelectionAllowed: false,
                    onSelectionChanged: (selection) async {
                      if (selection.isEmpty) return;
                      final value = selection.first;
                      setState(() => _themeMode = value);
                      await ref
                          .read(settingsRepositoryProvider)
                          .saveThemeMode(value);
                    },
                  ),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: _busy
                        ? null
                        : () async {
                            final messenger = ScaffoldMessenger.of(context);
                            setState(() => _busy = true);
                            await ref
                                .read(settingsRepositoryProvider)
                                .saveOfficeName(_name.text);
                            await ref
                                .read(settingsRepositoryProvider)
                                .saveCurrency(_currency);
                            await ref
                                .read(settingsRepositoryProvider)
                                .saveThemeMode(_themeMode);
                            await ref
                                .read(settingsRepositoryProvider)
                                .saveSetting(
                                  'office_phone',
                                  _phone.text.trim(),
                                );
                            if (!mounted) return;
                            setState(() => _busy = false);
                            messenger.showSnackBar(
                              const SnackBar(content: Text('تم حفظ الإعدادات')),
                            );
                          },
                    icon: const Icon(Icons.save_rounded),
                    label: const Text('حفظ الإعدادات'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            _SettingsAction(
              icon: Icons.backup_rounded,
              color: MilaakColors.primary,
              title: 'تصدير نسخة احتياطية',
              subtitle: 'ملف JSON يحتوي بيانات التطبيق المحلية',
              onTap: () => ref.read(backupRepositoryProvider).exportBackup(),
            ),
            const SizedBox(height: 10),
            _SettingsAction(
              icon: Icons.lock_outline_rounded,
              color: MilaakColors.charcoal,
              title: 'اختبار قفل الجهاز',
              subtitle: 'ميزة اختيارية بدون تسجيل دخول',
              onTap: () async {
                final ok = await LockService().authenticate();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        ok ? 'تم التحقق بنجاح' : 'القفل غير متاح أو تم الإلغاء',
                      ),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 10),
            _SettingsAction(
              icon: Icons.upload_file_rounded,
              color: MilaakColors.utilityBlue,
              title: 'اختيار ملف نسخة احتياطية',
              subtitle:
                  'تم تجهيز اختيار الملف، والاستيراد التفصيلي يضاف بأمان عند اعتماد صيغة النسخة',
              onTap: () => ref.read(backupRepositoryProvider).pickBackupFile(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsAction extends StatelessWidget {
  const _SettingsAction({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MilaakSoftCard(
      onTap: onTap,
      child: Row(
        children: [
          MilaakIconBadge(icon: icon, color: color, size: 50),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: MilaakColors.textSoft,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_left_rounded, color: MilaakColors.textSoft),
        ],
      ),
    );
  }
}
