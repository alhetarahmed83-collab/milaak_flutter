import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/formatters.dart';
import '../../data/local/app_database.dart';
import '../../data/repositories/rental_repositories.dart';
import '../../shared/widgets/empty_state.dart';
import '../../shared/widgets/milaak_ui.dart';
import '../../shared/widgets/screen_scaffold.dart';

class AuditLogScreen extends ConsumerWidget {
  const AuditLogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logs = ref.watch(auditLogsProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: const Text('سجل النشاط')),
      body: ScreenScaffold(
        title: 'سجل النشاط',
        subtitle: 'أثر محلي للعمليات المالية والإدارية المهمة.',
        child: logs.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) =>
              Center(child: Text('تعذر جلب السجل: $error')),
          data: (items) => items.isEmpty
              ? const EmptyState(
                  icon: Icons.history_rounded,
                  title: 'لا يوجد نشاط',
                  message:
                      'سيظهر هنا اعتماد العقود والسندات والرسائل والعمليات المهمة.',
                )
              : ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) =>
                      _AuditTile(log: items[index]),
                ),
        ),
      ),
    );
  }
}

class _AuditTile extends StatelessWidget {
  const _AuditTile({required this.log});

  final AuditLogRecord log;

  @override
  Widget build(BuildContext context) {
    return MilaakSoftCard(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: ListTile(
        leading: const MilaakIconBadge(
          icon: Icons.manage_history_rounded,
          size: 46,
        ),
        title: Text(
          log.description,
          style: const TextStyle(fontWeight: FontWeight.w900),
        ),
        subtitle: Text('${log.entityType} | ${formatDate(log.createdAt)}'),
      ),
    );
  }
}
