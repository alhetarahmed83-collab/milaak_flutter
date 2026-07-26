import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../../core/formatters.dart';
import '../../core/labels.dart';
import '../../data/local/app_database.dart';
import '../../data/repositories/rental_repositories.dart';
import '../../services/message_service.dart';
import '../../services/pdf_service.dart';
import '../../shared/widgets/empty_state.dart';
import '../../shared/widgets/form_helpers.dart';
import '../../shared/widgets/milaak_ui.dart';
import '../../shared/widgets/screen_scaffold.dart';

class PaymentsScreen extends ConsumerWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final payments = ref.watch(paymentsProvider);

    return ScreenScaffold(
      title: 'المستحقات والتحصيل',
      subtitle: 'سندات قبض وتحديث فوري للمديونيات.',
      actions: [
        IconButton.outlined(
          tooltip: 'تصدير تقرير التحصيل',
          onPressed: () => PdfService().sharePayments(
            payments.valueOrNull ?? <PaymentRecord>[],
            context: context,
          ),
          icon: const Icon(Icons.picture_as_pdf_rounded),
        ),
      ],
      action: IconButton.filled(
        onPressed: () => showMilaakSheet(context, const _PaymentForm()),
        icon: const Icon(Icons.add_card_rounded),
      ),
      child: payments.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            Center(child: Text('تعذر جلب السندات: $error')),
        data: (items) {
          final paidTotal = items
              .where((item) => item.status == 'paid')
              .fold<double>(0, (sum, item) => sum + item.amount);
          final pendingTotal = items
              .where((item) => item.status != 'paid')
              .fold<double>(0, (sum, item) => sum + item.amount);

          if (items.isEmpty) {
            return const EmptyState(
              icon: Icons.payments_rounded,
              title: 'لا توجد سندات',
              message: 'سجل أول سند قبض لتبدأ متابعة التحصيل.',
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.only(bottom: 24),
            itemCount: items.length + 1,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              if (index == 0) {
                return Row(
                  children: [
                    Expanded(
                      child: MilaakStatCard(
                        title: 'المحصل',
                        value: formatCurrency(paidTotal),
                        icon: Icons.account_balance_wallet_rounded,
                        color: MilaakColors.collected,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: MilaakStatCard(
                        title: 'المعلق',
                        value: formatCurrency(pendingTotal),
                        icon: Icons.pending_actions_rounded,
                        color: MilaakColors.contractGold,
                      ),
                    ),
                  ],
                );
              }
              return _PaymentCard(payment: items[index - 1]);
            },
          );
        },
      ),
    );
  }
}

class _PaymentCard extends ConsumerWidget {
  const _PaymentCard({required this.payment});

  final PaymentRecord payment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paid = payment.status == 'paid';
    final utilityBills =
        (ref.watch(allUtilityBillsProvider).value ?? <UtilityBillRecord>[])
            .where((bill) => bill.paymentId == payment.id)
            .toList();
    return MilaakSoftCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              MilaakIconBadge(
                icon: Icons.receipt_long_rounded,
                color: paid
                    ? MilaakColors.collected
                    : MilaakColors.contractGold,
                size: 52,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      payment.receiptNo,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      '${payment.tenantName} - ${payment.propertyName}',
                      style: const TextStyle(color: MilaakColors.textSoft),
                    ),
                  ],
                ),
              ),
              IconButton.outlined(
                tooltip: 'PDF',
                onPressed: () => PdfService().shareReceipt(
                  payment,
                  context: context,
                  utilityBills: utilityBills,
                ),
                icon: const Icon(Icons.picture_as_pdf_rounded),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                formatCurrency(payment.amount),
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: MilaakColors.primaryDark,
                ),
              ),
              const Spacer(),
              MilaakStatusBadge(
                label: paid ? 'مدفوع' : 'معلق',
                color: paid
                    ? MilaakColors.collected
                    : MilaakColors.contractGold,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: Text(
                  '${formatDate(payment.date)} - ${_methodName(payment.method)}',
                  style: const TextStyle(color: MilaakColors.textSoft),
                ),
              ),
              TextButton.icon(
                onPressed: paid
                    ? () => _sendReceipt(context, ref, payment, 'whatsapp')
                    : null,
                icon: const Icon(Icons.chat_bubble_outline_rounded),
                label: const Text('تأكيد'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PaymentForm extends ConsumerStatefulWidget {
  const _PaymentForm();

  @override
  ConsumerState<_PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends ConsumerState<_PaymentForm> {
  final _formKey = GlobalKey<FormState>();
  final _amount = TextEditingController();
  final _notes = TextEditingController();
  int? _tenantId;
  int? _scheduleId;
  final Set<int> _utilityBillIds = <int>{};
  DateTime _date = DateTime.now();
  String _method = 'bank_transfer';
  String _status = 'paid';
  String _currency = 'YER';
  bool _saving = false;

  @override
  void dispose() {
    _amount.dispose();
    _notes.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final value = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (value != null) setState(() => _date = value);
  }

  void _syncAmount(
    RentScheduleRecord? schedule,
    List<UtilityBillRecord> utilityBills,
  ) {
    final remaining = schedule == null
        ? 0.0
        : schedule.amount - schedule.paidAmount;
    final rentAmount = remaining > 0 ? remaining : 0.0;
    final utilityAmount = utilityBills
        .where((bill) => _utilityBillIds.contains(bill.id))
        .fold<double>(0, (sum, bill) => sum + bill.amount);
    final total = rentAmount + utilityAmount;
    if (total > 0) _amount.text = total.toStringAsFixed(0);
  }

  Future<void> _save() async {
    final tenants = ref.read(tenantsProvider).value ?? <TenantRecord>[];
    final schedules =
        ref.read(rentSchedulesProvider).value ?? <RentScheduleRecord>[];
    final tenant = _tenantById(tenants, _tenantId);
    final schedule = _scheduleById(schedules, _scheduleId);
    if (!_formKey.currentState!.validate() || tenant == null) return;
    final amount = double.tryParse(_amount.text) ?? 0;
    final utilityBills = await ref
        .read(utilityBillsRepositoryProvider)
        .openChargeableBillsForTenant(tenant.id);
    if (!mounted) return;
    final selectedUtilityBills = utilityBills
        .where((bill) => _utilityBillIds.contains(bill.id))
        .toList();
    final selectedUtilityTotal = selectedUtilityBills.fold<double>(
      0,
      (sum, bill) => sum + bill.amount,
    );
    final rentDue = schedule == null
        ? 0.0
        : math.max<double>(schedule.amount - schedule.paidAmount, 0);
    final expectedTotal = rentDue + selectedUtilityTotal;
    if (_status == 'paid' &&
        selectedUtilityBills.isNotEmpty &&
        amount + .01 < expectedTotal) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'المبلغ لا يغطي البنود المختارة. المطلوب ${formatCurrency(expectedTotal)}',
          ),
        ),
      );
      return;
    }
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('معاينة سند القبض'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('المستأجر: ${tenant.name}'),
            Text('العقار: ${tenant.propertyName}'),
            Text('المبلغ: ${formatCurrency(amount)}'),
            Text('التاريخ: ${formatDate(_date)}'),
            Text('الحالة: ${_status == 'paid' ? 'مدفوع' : 'معلق'}'),
            if (schedule != null)
              Text('مرتبط باستحقاق: ${formatDate(schedule.dueDate)}'),
            if (selectedUtilityBills.isNotEmpty)
              Text(
                'خدمات محددة: ${selectedUtilityBills.length} | ${formatCurrency(selectedUtilityTotal)}',
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('تعديل'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('تأكيد الحفظ'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    if (!mounted) return;
    setState(() => _saving = true);
    final paymentId = await ref
        .read(paymentsRepositoryProvider)
        .addPayment(
          tenant: tenant,
          amount: amount,
          currency: _currency,
          date: _date,
          method: _method,
          status: _status,
          dueScheduleId: schedule?.id,
          utilityBillIds: _utilityBillIds.toList(),
          notes: _notes.text.trim(),
        );
    final payment = await ref
        .read(paymentsRepositoryProvider)
        .findPayment(paymentId);
    if (!mounted) return;
    if (_status == 'paid' && payment != null) {
      await _askToSendReceipt(context, ref, tenant, payment);
    }
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final tenants = ref.watch(tenantsProvider).value ?? <TenantRecord>[];
    final schedules =
        ref.watch(rentSchedulesProvider).value ?? <RentScheduleRecord>[];
    final selectedTenant = _tenantById(tenants, _tenantId);
    final tenantSchedules = selectedTenant == null
        ? <RentScheduleRecord>[]
        : schedules
              .where(
                (item) =>
                    item.tenantId == selectedTenant.id && item.status != 'paid',
              )
              .toList();
    final selectedSchedule = _scheduleById(tenantSchedules, _scheduleId);
    final utilityBills = selectedTenant == null
        ? <UtilityBillRecord>[]
        : ref.watch(tenantUtilityBillsProvider(selectedTenant.id)).value ??
              <UtilityBillRecord>[];
    final chargeableUtilityBills = utilityBills
        .where((bill) => bill.status == 'open' && bill.chargeToTenant)
        .toList();

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MilaakSectionHeader(
              title: 'سند قبض جديد',
              subtitle: 'اختر المستأجر والمبلغ وطريقة الدفع.',
            ),
            const SizedBox(height: 16),
            const FieldTitle('المستأجر'),
            DropdownButtonFormField<int>(
              value: _tenantId,
              items: tenants
                  .map(
                    (item) => DropdownMenuItem(
                      value: item.id,
                      child: Text('${item.name} - ${item.propertyName}'),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _tenantId = value;
                  _scheduleId = null;
                  _utilityBillIds.clear();
                  _amount.clear();
                });
              },
              validator: (value) => value == null ? 'اختر مستأجراً' : null,
              decoration: const InputDecoration(hintText: 'اختر المستأجر'),
            ),
            const SizedBox(height: 12),
            if (tenantSchedules.isNotEmpty) ...[
              const FieldTitle('ربط باستحقاق'),
              DropdownButtonFormField<int>(
                value: selectedSchedule?.id,
                items: tenantSchedules.map((item) {
                  final remaining = item.amount - item.paidAmount;
                  return DropdownMenuItem(
                    value: item.id,
                    child: Text(
                      '${formatDate(item.dueDate)} - ${formatCurrency(remaining)}',
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  final schedule = _scheduleById(tenantSchedules, value);
                  setState(() {
                    _scheduleId = value;
                    _syncAmount(schedule, chargeableUtilityBills);
                  });
                },
                decoration: const InputDecoration(hintText: 'اختياري'),
              ),
              const SizedBox(height: 12),
            ],
            if (chargeableUtilityBills.isNotEmpty) ...[
              const FieldTitle('فواتير خدمات مفتوحة'),
              ...chargeableUtilityBills.map((bill) {
                final selected = _utilityBillIds.contains(bill.id);
                return CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  value: selected,
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        _utilityBillIds.add(bill.id);
                      } else {
                        _utilityBillIds.remove(bill.id);
                      }
                      _syncAmount(selectedSchedule, chargeableUtilityBills);
                    });
                  },
                  title: Text(
                    '${utilityBillTypeLabel(bill.type)} - ${formatCurrency(bill.amount)}',
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                    '${formatDate(bill.periodStart)} - ${formatDate(bill.periodEnd)}',
                  ),
                );
              }),
              const SizedBox(height: 12),
            ],
            const FieldTitle('المبلغ'),
            TextFormField(
              controller: _amount,
              keyboardType: TextInputType.number,
              validator: (value) => (double.tryParse(value ?? '') ?? 0) <= 0
                  ? 'أدخل مبلغاً صحيحاً'
                  : null,
            ),
            const SizedBox(height: 12),
            const FieldTitle('العملة'),
            DropdownButtonFormField<String>(
              value: _currency,
              items: const [
                DropdownMenuItem(value: 'YER', child: Text('ريال يمني YER')),
                DropdownMenuItem(value: 'SAR', child: Text('ريال سعودي SAR')),
                DropdownMenuItem(value: 'USD', child: Text('دولار USD')),
              ],
              onChanged: (value) => setState(() => _currency = value ?? 'YER'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: _pickDate,
              icon: const Icon(Icons.event_rounded),
              label: Text('التاريخ: ${formatDate(_date)}'),
            ),
            const SizedBox(height: 12),
            const FieldTitle('طريقة الدفع'),
            DropdownButtonFormField<String>(
              value: _method,
              items: const ['bank_transfer', 'mada', 'cash', 'check']
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: Text(_methodName(item)),
                    ),
                  )
                  .toList(),
              onChanged: (value) =>
                  setState(() => _method = value ?? 'bank_transfer'),
            ),
            const SizedBox(height: 12),
            const FieldTitle('الحالة'),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'paid', label: Text('مدفوع')),
                ButtonSegment(value: 'pending', label: Text('معلق')),
              ],
              selected: {_status},
              onSelectionChanged: (value) =>
                  setState(() => _status = value.first),
            ),
            const SizedBox(height: 12),
            const FieldTitle('ملاحظات'),
            TextFormField(controller: _notes, minLines: 2, maxLines: 4),
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
              label: const Text('حفظ السند'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _askToSendReceipt(
  BuildContext context,
  WidgetRef ref,
  TenantRecord tenant,
  PaymentRecord payment,
) async {
  await showDialog<void>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: const Text('إرسال تأكيد السداد؟'),
      content: Text(
        'تم حفظ السند ${payment.receiptNo}. هل تريد إرسال رسالة للمستأجر الآن؟',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(),
          child: const Text('لاحقاً'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(dialogContext).pop();
            _sendReceipt(context, ref, payment, 'sms');
          },
          child: const Text('SMS'),
        ),
        FilledButton(
          onPressed: () {
            Navigator.of(dialogContext).pop();
            _sendReceipt(context, ref, payment, 'whatsapp');
          },
          child: const Text('WhatsApp'),
        ),
      ],
    ),
  );
}

Future<void> _sendReceipt(
  BuildContext context,
  WidgetRef ref,
  PaymentRecord payment,
  String channel,
) async {
  final messenger = ScaffoldMessenger.of(context);
  final tenants = ref.read(tenantsProvider).value ?? <TenantRecord>[];
  final tenant = tenants
      .where((item) => item.id == payment.tenantId)
      .firstOrNull;
  if (tenant == null) {
    messenger.showSnackBar(
      const SnackBar(content: Text('تعذر العثور على ملف المستأجر')),
    );
    return;
  }
  final officeName =
      ref.read(officeNameProvider).valueOrNull ?? 'مكتب مِلاك العقاري';
  final template = await ref
      .read(messagesRepositoryProvider)
      .templateByType('payment_receipt');
  final body = MessageService().paymentReceiptMessage(
    tenant: tenant,
    payment: payment,
    officeName: officeName,
    template: template?.body,
    currency: _currencyOrDefault(ref),
  );
  final status = await MessageService().sendToTenant(
    repository: ref.read(messagesRepositoryProvider),
    tenant: tenant,
    type: 'payment_receipt',
    channel: channel,
    body: body,
  );
  await ref
      .read(paymentsRepositoryProvider)
      .updateMessageStatus(payment.id, status);
  messenger.showSnackBar(
    SnackBar(
      content: Text(
        status == 'opened' ? 'تم فتح رسالة التأكيد' : 'تعذر فتح قناة الإرسال',
      ),
    ),
  );
}

String _currencyOrDefault(WidgetRef ref) {
  return ref
      .read(currencyProvider)
      .maybeWhen(data: (value) => value, orElse: () => 'YER');
}

TenantRecord? _tenantById(List<TenantRecord> items, int? id) {
  if (id == null) return null;
  for (final item in items) {
    if (item.id == id) return item;
  }
  return null;
}

RentScheduleRecord? _scheduleById(List<RentScheduleRecord> items, int? id) {
  if (id == null) return null;
  for (final item in items) {
    if (item.id == id) return item;
  }
  return null;
}

String _methodName(String method) {
  return switch (method) {
    'mada' => 'مدى',
    'cash' => 'نقدي',
    'check' => 'شيك',
    _ => 'تحويل بنكي',
  };
}
