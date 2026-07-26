import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../app/theme.dart';
import '../../core/formatters.dart';
import '../../core/labels.dart';
import '../../data/local/app_database.dart';
import '../../data/repositories/rental_repositories.dart';
import '../../services/message_service.dart';
import '../../shared/widgets/empty_state.dart';
import '../../shared/widgets/milaak_ui.dart';
import '../../shared/widgets/screen_scaffold.dart';

class MessagesScreen extends ConsumerStatefulWidget {
  const MessagesScreen({super.key});

  @override
  ConsumerState<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends ConsumerState<MessagesScreen> {
  String _view = 'overdue';

  @override
  Widget build(BuildContext context) {
    final tenants = ref.watch(tenantsProvider).value ?? <TenantRecord>[];
    final templates =
        ref.watch(messageTemplatesProvider).value ?? <MessageTemplateRecord>[];
    final logs = ref.watch(messageLogsProvider).value ?? <MessageLogRecord>[];
    final utilityBills =
        ref.watch(chargeableUtilityBillsProvider).value ??
        <UtilityBillRecord>[];
    final overdue = tenants
        .where(
          (tenant) =>
              _tenantDebt(
                tenant,
                _chargeableUtilityDebt(utilityBills, tenant.id),
              ) >
              0,
        )
        .toList();

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: const Text('الرسائل')),
      body: ScreenScaffold(
        title: 'مركز الرسائل',
        subtitle: 'قوالب جاهزة، تذكيرات للمتأخرين، وسجل إرسال محلي.',
        action: _view == 'overdue' && overdue.isNotEmpty
            ? IconButton.filled(
                tooltip: 'تذكير جماعي',
                onPressed: () => _sendGroupReminder(context, ref, overdue),
                icon: const Icon(Icons.campaign_rounded),
              )
            : null,
        child: Column(
          children: [
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(
                  value: 'overdue',
                  label: Text('المتأخرون'),
                  icon: Icon(Icons.warning_amber_rounded),
                ),
                ButtonSegment(
                  value: 'templates',
                  label: Text('القوالب'),
                  icon: Icon(Icons.article_outlined),
                ),
                ButtonSegment(
                  value: 'logs',
                  label: Text('السجل'),
                  icon: Icon(Icons.history_rounded),
                ),
              ],
              selected: {_view},
              onSelectionChanged: (value) =>
                  setState(() => _view = value.first),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: switch (_view) {
                'templates' => _TemplatesList(templates: templates),
                'logs' => _LogsList(logs: logs),
                _ => _OverdueList(tenants: overdue, utilityBills: utilityBills),
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _OverdueList extends ConsumerWidget {
  const _OverdueList({required this.tenants, required this.utilityBills});

  final List<TenantRecord> tenants;
  final List<UtilityBillRecord> utilityBills;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (tenants.isEmpty) {
      return const EmptyState(
        icon: Icons.verified_rounded,
        title: 'كل المستأجرين ملتزمون بالسداد',
        message: 'لا توجد مديونيات حالياً تحتاج إلى تذكير.',
      );
    }
    return ListView.separated(
      itemCount: tenants.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final tenant = tenants[index];
        final debt = _tenantDebt(
          tenant,
          _chargeableUtilityDebt(utilityBills, tenant.id),
        );
        return MilaakSoftCard(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ListTile(
            leading: const Icon(
              Icons.warning_amber_rounded,
              color: MilaakColors.arrears,
            ),
            title: Text(
              tenant.name,
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
            subtitle: Text(
              '${tenant.propertyName} - ${formatUnitShort((ref.watch(propertiesProvider).value ?? <PropertyRecord>[]).where((p) => p.id == tenant.propertyId).map((p) => p.type).cast<String>().firstWhere((_) => true, orElse: () => 'residential'), tenant.unitId)} | ${formatCurrency(debt)}',
            ),
            trailing: Wrap(
              spacing: 4,
              children: [
                IconButton(
                  tooltip: 'WhatsApp',
                  onPressed: () =>
                      _sendLateReminder(context, ref, tenant, 'whatsapp'),
                  icon: const Icon(Icons.chat_bubble_outline_rounded),
                ),
                IconButton(
                  tooltip: 'SMS',
                  onPressed: () =>
                      _sendLateReminder(context, ref, tenant, 'sms'),
                  icon: const Icon(Icons.sms_outlined),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TemplatesList extends ConsumerWidget {
  const _TemplatesList({required this.templates});

  final List<MessageTemplateRecord> templates;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (templates.isEmpty) {
      return const EmptyState(
        icon: Icons.article_outlined,
        title: 'لا توجد قوالب',
        message: 'سيتم إنشاء القوالب الافتراضية عند تهيئة قاعدة البيانات.',
      );
    }
    return ListView.separated(
      itemCount: templates.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final item = templates[index];
        return MilaakSoftCard(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ListTile(
            title: Text(
              item.title,
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
            subtitle: Text(item.body),
            isThreeLine: true,
            trailing: IconButton(
              tooltip: 'تعديل',
              onPressed: () => _editTemplate(context, ref, item),
              icon: const Icon(Icons.edit_outlined),
            ),
          ),
        );
      },
    );
  }
}

Future<void> _editTemplate(
  BuildContext context,
  WidgetRef ref,
  MessageTemplateRecord template,
) async {
  final controller = TextEditingController(text: template.body);
  final body = await showDialog<String>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: Text('تعديل ${template.title}'),
      content: TextField(
        controller: controller,
        minLines: 5,
        maxLines: 8,
        decoration: const InputDecoration(
          hintText:
              'استخدم المتغيرات مثل {tenantName} و {amount} و {officeName}',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(),
          child: const Text('إلغاء'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(dialogContext).pop(controller.text),
          child: const Text('حفظ'),
        ),
      ],
    ),
  );
  controller.dispose();
  if (body == null || body.trim().isEmpty) return;
  await ref.read(messagesRepositoryProvider).updateTemplate(template, body);
  if (context.mounted) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('تم تعديل القالب')));
  }
}

class _LogsList extends StatelessWidget {
  const _LogsList({required this.logs});

  final List<MessageLogRecord> logs;

  @override
  Widget build(BuildContext context) {
    if (logs.isEmpty) {
      return const EmptyState(
        icon: Icons.history_rounded,
        title: 'لا يوجد سجل رسائل',
        message: 'أي رسالة SMS أو WhatsApp أو مشاركة ستظهر هنا.',
      );
    }
    return ListView.separated(
      itemCount: logs.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final log = logs[index];
        return MilaakSoftCard(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ListTile(
            leading: Icon(
              log.channel == 'sms'
                  ? Icons.sms_outlined
                  : Icons.chat_bubble_outline_rounded,
            ),
            title: Text(
              '${messageTypeName(log.type)} - ${log.tenantName}',
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
            subtitle: Text(
              '${messageChannelName(log.channel)} | ${formatDate(log.createdAt)}\n${log.body}',
            ),
            isThreeLine: true,
          ),
        );
      },
    );
  }
}

Future<void> _sendLateReminder(
  BuildContext context,
  WidgetRef ref,
  TenantRecord tenant,
  String channel,
) async {
  final messenger = ScaffoldMessenger.of(context);
  final officeName =
      ref.read(officeNameProvider).valueOrNull ?? 'مكتب مِلاك العقاري';
  final template = await ref
      .read(messagesRepositoryProvider)
      .templateByType('late_payment');
  final properties = ref.read(propertiesProvider).value ?? <PropertyRecord>[];
  final matched = properties.where((p) => p.id == tenant.propertyId).toList();
  final PropertyRecord? property = matched.isNotEmpty ? matched.first : null;
  final unitLabel = formatUnitShort(property?.type, tenant.unitId);
  final systemCurrency = ref
      .read(currencyProvider)
      .maybeWhen(data: (v) => v, orElse: () => 'YER');
  final utilityBills =
      ref.read(chargeableUtilityBillsProvider).value ?? <UtilityBillRecord>[];
  final debt = _tenantDebt(
    tenant,
    _chargeableUtilityDebt(utilityBills, tenant.id),
  );
  final body = MessageService().latePaymentMessage(
    tenant: tenant,
    officeName: officeName,
    template: template?.body,
    unitLabel: unitLabel,
    currency: systemCurrency,
    debtAmount: debt,
  );
  final status = await MessageService().sendToTenant(
    repository: ref.read(messagesRepositoryProvider),
    tenant: tenant,
    type: 'late_payment',
    channel: channel,
    body: body,
  );
  messenger.showSnackBar(
    SnackBar(
      content: Text(
        status == 'opened' ? 'تم فتح الرسالة' : 'تعذر فتح قناة الإرسال',
      ),
    ),
  );
}

Future<void> _sendGroupReminder(
  BuildContext context,
  WidgetRef ref,
  List<TenantRecord> tenants,
) async {
  final messenger = ScaffoldMessenger.of(context);
  final officeName =
      ref.read(officeNameProvider).valueOrNull ?? 'مكتب مِلاك العقاري';
  final template = await ref
      .read(messagesRepositoryProvider)
      .templateByType('late_payment');
  final service = MessageService();
  final properties = ref.read(propertiesProvider).value ?? <PropertyRecord>[];
  final utilityBills =
      ref.read(chargeableUtilityBillsProvider).value ?? <UtilityBillRecord>[];
  final messages = tenants.map((tenant) {
    final matched = properties.where((p) => p.id == tenant.propertyId).toList();
    final PropertyRecord? property = matched.isNotEmpty ? matched.first : null;
    final unitLabel = formatUnitShort(property?.type, tenant.unitId);
    final systemCurrency = ref
        .read(currencyProvider)
        .maybeWhen(data: (v) => v, orElse: () => 'YER');
    return service.latePaymentMessage(
      tenant: tenant,
      officeName: officeName,
      template: template?.body,
      unitLabel: unitLabel,
      currency: systemCurrency,
      debtAmount: _tenantDebt(
        tenant,
        _chargeableUtilityDebt(utilityBills, tenant.id),
      ),
    );
  }).toList();
  await Share.share(messages.join('\n\n'));
  for (var index = 0; index < tenants.length; index++) {
    await ref
        .read(messagesRepositoryProvider)
        .logMessage(
          tenant: tenants[index],
          tenantName: tenants[index].name,
          tenantPhone: tenants[index].phone,
          type: 'late_payment',
          channel: 'share',
          body: messages[index],
          status: 'opened',
        );
  }
  messenger.showSnackBar(
    SnackBar(
      content: Text('تم تجهيز تذكير جماعي لعدد ${tenants.length} مستأجر'),
    ),
  );
}

double _tenantDebt(TenantRecord tenant, [double utilityDebt = 0]) {
  return tenant.accumulatedDebt + tenant.balance + utilityDebt;
}

double _chargeableUtilityDebt(List<UtilityBillRecord> bills, int tenantId) {
  return bills
      .where(
        (bill) =>
            bill.tenantId == tenantId &&
            bill.status == 'open' &&
            bill.chargeToTenant,
      )
      .fold<double>(0, (sum, bill) => sum + bill.amount);
}
