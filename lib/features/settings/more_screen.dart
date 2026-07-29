import 'package:flutter/material.dart';

import '../../app/theme.dart';
import '../contracts/contracts_screen.dart';
import '../payments/payments_screen.dart';
import '../../shared/widgets/milaak_ui.dart';
import '../../shared/widgets/screen_scaffold.dart';
import '../reports/reports_screen.dart';
import 'attachments_screen.dart';
import 'audit_log_screen.dart';
import 'maintenance_screen.dart';
import 'messages_screen.dart';
import 'services_screen.dart';
import 'settings_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ScreenScaffold(
        title: 'المزيد',
        subtitle: 'التقارير والرسائل والصيانة والإعدادات.',
        child: ListView(
          padding: const EdgeInsets.only(
            bottom: MilaakSpacing.floatingDockBottomInset + 18,
          ),
          children: [
            _MoreTile(
              icon: Icons.bar_chart_rounded,
              title: 'التقارير',
              subtitle: 'الدخل والتحصيل والمتأخرات والمصروفات',
              color: MilaakColors.primary,
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const ReportsScreen())),
            ),
            const SizedBox(height: 12),
            _MoreTile(
              icon: Icons.description_rounded,
              title: 'العقود',
              subtitle: 'إنشاء ومتابعة واعتماد عقود الإيجار',
              color: MilaakColors.contractGold,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ContractsScreen()),
              ),
            ),
            const SizedBox(height: 12),
            _MoreTile(
              icon: Icons.receipt_long_rounded,
              title: 'المستحقات',
              subtitle: 'سندات القبض والتحصيل وإدارة الدفعات',
              color: MilaakColors.collected,
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const PaymentsScreen())),
            ),
            const SizedBox(height: 12),
            _MoreTile(
              icon: Icons.sms_outlined,
              title: 'الرسائل',
              subtitle: 'تذكيرات SMS وWhatsApp وسجل الإرسال',
              color: MilaakColors.utilityBlue,
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const MessagesScreen())),
            ),
            const SizedBox(height: 12),
            _MoreTile(
              icon: Icons.electrical_services_rounded,
              title: 'الخدمات والعدادات',
              subtitle: 'ماء وكهرباء وعدادات مالك أو مستأجر أو مشتركة',
              color: MilaakColors.utilityBlue,
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const ServicesScreen())),
            ),
            const SizedBox(height: 12),
            _MoreTile(
              icon: Icons.build_circle_outlined,
              title: 'الصيانة',
              subtitle: 'بلاغات الوحدات والتكاليف والحالات',
              color: MilaakColors.contractGold,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const MaintenanceScreen()),
              ),
            ),
            const SizedBox(height: 12),
            _MoreTile(
              icon: Icons.attach_file_rounded,
              title: 'المرفقات',
              subtitle: 'صور الهوية والعقود والإيصالات وملفات الوحدات',
              color: MilaakColors.charcoal,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AttachmentsScreen()),
              ),
            ),
            const SizedBox(height: 12),
            _MoreTile(
              icon: Icons.manage_history_rounded,
              title: 'سجل النشاط',
              subtitle: 'اعتماد العقود والسندات والرسائل والعمليات',
              color: MilaakColors.collected,
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const AuditLogScreen())),
            ),
            const SizedBox(height: 12),
            _MoreTile(
              icon: Icons.settings_rounded,
              title: 'الإعدادات والنسخ الاحتياطي',
              subtitle: 'اسم المكتب، القفل المحلي، وتصدير البيانات',
              color: MilaakColors.arrears,
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const SettingsScreen())),
            ),
          ],
        ),
      ),
    );
  }
}

class _MoreTile extends StatelessWidget {
  const _MoreTile({
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
