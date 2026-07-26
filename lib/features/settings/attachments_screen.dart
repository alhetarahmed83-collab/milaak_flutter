import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../app/theme.dart';
import '../../core/formatters.dart';
import '../../data/local/app_database.dart';
import '../../data/repositories/rental_repositories.dart';
import '../../shared/widgets/empty_state.dart';
import '../../shared/widgets/form_helpers.dart';
import '../../shared/widgets/milaak_ui.dart';
import '../../shared/widgets/screen_scaffold.dart';

class AttachmentsScreen extends ConsumerWidget {
  const AttachmentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attachments = ref.watch(attachmentsProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: const Text('المرفقات')),
      body: ScreenScaffold(
        title: 'المرفقات',
        subtitle: 'حفظ مسارات صور الهوية والعقود والإيصالات وملفات الوحدات.',
        action: IconButton.filled(
          tooltip: 'إضافة مرفق',
          onPressed: () => showMilaakSheet(context, const _AttachmentForm()),
          icon: const Icon(Icons.attach_file_rounded),
        ),
        child: attachments.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) =>
              Center(child: Text('تعذر جلب المرفقات: $error')),
          data: (items) => items.isEmpty
              ? const EmptyState(
                  icon: Icons.attach_file_rounded,
                  title: 'لا توجد مرفقات',
                  message:
                      'أضف صور الهوية أو العقود أو الإيصالات واربطها بالسجل المناسب.',
                )
              : ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) =>
                      _AttachmentTile(attachment: items[index]),
                ),
        ),
      ),
    );
  }
}

class _AttachmentTile extends StatelessWidget {
  const _AttachmentTile({required this.attachment});

  final AttachmentRecord attachment;

  @override
  Widget build(BuildContext context) {
    return MilaakSoftCard(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: ListTile(
        leading: const MilaakIconBadge(
          icon: Icons.insert_drive_file_outlined,
          color: MilaakColors.textSoft,
          size: 46,
        ),
        title: Text(
          attachment.label,
          style: const TextStyle(fontWeight: FontWeight.w900),
        ),
        subtitle: Text(
          '${_entityName(attachment.entityType)} #${attachment.entityId} | ${formatDate(attachment.createdAt)}\n${attachment.filePath}',
        ),
        isThreeLine: true,
        trailing: IconButton(
          tooltip: 'مشاركة',
          onPressed: () async {
            final messenger = ScaffoldMessenger.of(context);
            final file = File(attachment.filePath);
            if (!await file.exists()) {
              messenger.showSnackBar(
                const SnackBar(content: Text('الملف غير موجود في هذا المسار')),
              );
              return;
            }
            await Share.shareXFiles([
              XFile(attachment.filePath),
            ], text: attachment.label);
          },
          icon: const Icon(Icons.ios_share_rounded),
        ),
      ),
    );
  }
}

class _AttachmentForm extends ConsumerStatefulWidget {
  const _AttachmentForm();

  @override
  ConsumerState<_AttachmentForm> createState() => _AttachmentFormState();
}

class _AttachmentFormState extends ConsumerState<_AttachmentForm> {
  final _formKey = GlobalKey<FormState>();
  final _label = TextEditingController();
  String _entityType = 'tenants';
  int? _entityId;
  String? _filePath;
  bool _saving = false;

  @override
  void dispose() {
    _label.dispose();
    super.dispose();
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result?.files.single.path != null) {
      setState(() => _filePath = result!.files.single.path);
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate() ||
        _entityId == null ||
        _filePath == null) {
      return;
    }
    setState(() => _saving = true);
    final extension = _filePath!.split('.').last.toLowerCase();
    await ref
        .read(attachmentsRepositoryProvider)
        .addAttachment(
          entityType: _entityType,
          entityId: _entityId!,
          label: _label.text.trim(),
          filePath: _filePath!,
          fileType: extension,
        );
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final options = _entityOptions(ref);

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MilaakSectionHeader(
              title: 'إضافة مرفق',
              subtitle: 'اربط الملف بعقار أو مستأجر أو عقد أو سند.',
            ),
            const SizedBox(height: 16),
            const FieldTitle('اسم المرفق'),
            TextFormField(
              controller: _label,
              validator: (value) =>
                  value == null || value.trim().isEmpty ? 'مطلوب' : null,
            ),
            const SizedBox(height: 12),
            const FieldTitle('نوع السجل'),
            DropdownButtonFormField<String>(
              value: _entityType,
              items: const [
                DropdownMenuItem(value: 'tenants', child: Text('مستأجر')),
                DropdownMenuItem(value: 'properties', child: Text('عقار')),
                DropdownMenuItem(value: 'contracts', child: Text('عقد')),
                DropdownMenuItem(value: 'payments', child: Text('سند قبض')),
              ],
              onChanged: (value) {
                setState(() {
                  _entityType = value ?? 'tenants';
                  _entityId = null;
                });
              },
            ),
            const SizedBox(height: 12),
            const FieldTitle('السجل المرتبط'),
            DropdownButtonFormField<int>(
              value: _entityId,
              items: options
                  .map(
                    (item) => DropdownMenuItem(
                      value: item.id,
                      child: Text(item.label),
                    ),
                  )
                  .toList(),
              onChanged: (value) => setState(() => _entityId = value),
              validator: (value) => value == null ? 'اختر السجل' : null,
              decoration: const InputDecoration(hintText: 'اختر السجل'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: _pickFile,
              icon: const Icon(Icons.folder_open_rounded),
              label: Text(_filePath == null ? 'اختيار ملف' : 'تم اختيار ملف'),
            ),
            if (_filePath != null) ...[
              const SizedBox(height: 8),
              Text(
                _filePath!,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: MilaakColors.textSoft),
              ),
            ],
            const SizedBox(height: 18),
            FilledButton.icon(
              onPressed: _saving ? null : _save,
              icon: _saving
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.save_rounded),
              label: const Text('حفظ المرفق'),
            ),
          ],
        ),
      ),
    );
  }

  List<_EntityOption> _entityOptions(WidgetRef ref) {
    return switch (_entityType) {
      'properties' =>
        (ref.watch(propertiesProvider).value ?? <PropertyRecord>[])
            .map((item) => _EntityOption(item.id, item.name))
            .toList(),
      'contracts' =>
        (ref.watch(contractsProvider).value ?? <ContractRecord>[])
            .map(
              (item) => _EntityOption(
                item.id,
                '${item.contractNo.isEmpty ? 'عقد ${item.id}' : item.contractNo} - ${item.tenantName}',
              ),
            )
            .toList(),
      'payments' =>
        (ref.watch(paymentsProvider).value ?? <PaymentRecord>[])
            .map(
              (item) => _EntityOption(
                item.id,
                '${item.receiptNo} - ${item.tenantName}',
              ),
            )
            .toList(),
      _ =>
        (ref.watch(tenantsProvider).value ?? <TenantRecord>[])
            .map(
              (item) =>
                  _EntityOption(item.id, '${item.name} - ${item.propertyName}'),
            )
            .toList(),
    };
  }
}

class _EntityOption {
  const _EntityOption(this.id, this.label);

  final int id;
  final String label;
}

String _entityName(String entityType) {
  return switch (entityType) {
    'properties' => 'عقار',
    'contracts' => 'عقد',
    'payments' => 'سند قبض',
    _ => 'مستأجر',
  };
}
