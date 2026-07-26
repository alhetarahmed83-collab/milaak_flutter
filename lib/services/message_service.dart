import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/formatters.dart';
import '../data/local/app_database.dart';
import '../data/repositories/rental_repositories.dart';

class MessageService {
  String renderTemplate(String template, Map<String, String> values) {
    var output = template;
    for (final entry in values.entries) {
      output = output.replaceAll('{${entry.key}}', entry.value);
    }
    return output;
  }

  Map<String, String> tenantVariables({
    required TenantRecord tenant,
    required String officeName,
    num? amount,
    String? receiptNo,
    DateTime? dueDate,
    String unitLabel = 'شقة',
    String? currency,
  }) {
    return {
      'tenantName': tenant.name,
      'amount': amount == null
          ? ''
          : formatCurrencyWithCode(amount, currency ?? 'YER'),
      'propertyName': tenant.propertyName,
      'unitId': tenant.unitId,
      'unitLabel': unitLabel,
      'receiptNo': receiptNo ?? '',
      'dueDate': dueDate == null ? '' : formatDate(dueDate),
      'officeName': officeName,
    };
  }

  String paymentReceiptMessage({
    required TenantRecord tenant,
    required PaymentRecord payment,
    required String officeName,
    String? template,
    String unitLabel = 'شقة',
    String? currency,
  }) {
    final body =
        template ??
        'مرحباً {tenantName}، تم استلام مبلغ {amount} عن {propertyName} - {unitLabel} {unitId}. رقم السند: {receiptNo}. شكراً لكم، {officeName}.';
    return renderTemplate(
      body,
      tenantVariables(
        tenant: tenant,
        officeName: officeName,
        amount: payment.amount,
        currency: currency ?? payment.currency,
        receiptNo: payment.receiptNo,
        dueDate: payment.date,
        unitLabel: unitLabel,
      ),
    );
  }

  String latePaymentMessage({
    required TenantRecord tenant,
    required String officeName,
    String? template,
    String unitLabel = 'شقة',
    String? currency,
    double? debtAmount,
  }) {
    final debt = debtAmount ?? tenant.accumulatedDebt + tenant.balance;
    final body =
        template ??
        'مرحباً {tenantName}، يوجد مبلغ متأخر قدره {amount} للعقار {propertyName} - {unitLabel} {unitId}. نأمل السداد في أقرب وقت. {officeName}.';
    return renderTemplate(
      body,
      tenantVariables(
        tenant: tenant,
        officeName: officeName,
        amount: debt,
        currency: currency,
        unitLabel: unitLabel,
      ),
    );
  }

  Future<String> sendToTenant({
    required MessagesRepository repository,
    required TenantRecord tenant,
    required String type,
    required String channel,
    required String body,
  }) async {
    var status = 'opened';
    try {
      final launched = await _open(
        channel: channel,
        phone: tenant.phone,
        body: body,
      );
      status = launched ? 'opened' : 'failed';
    } catch (_) {
      status = 'failed';
    }

    await repository.logMessage(
      tenant: tenant,
      tenantName: tenant.name,
      tenantPhone: tenant.phone,
      type: type,
      channel: channel,
      body: body,
      status: status,
    );
    return status;
  }

  Future<bool> _open({
    required String channel,
    required String phone,
    required String body,
  }) async {
    if (channel == 'share') {
      await Share.share(body);
      return true;
    }

    final normalized = phone.replaceAll(RegExp(r'[^0-9]'), '');
    if (normalized.isEmpty) {
      await Share.share(body);
      return true;
    }

    final whatsappPhone = _normalizeWhatsAppPhone(normalized);
    final uri = channel == 'sms'
        ? Uri(scheme: 'sms', path: normalized, queryParameters: {'body': body})
        : Uri.parse(
            'https://wa.me/$whatsappPhone?text=${Uri.encodeComponent(body)}',
          );

    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (launched) return true;
    } catch (_) {
      // Fall back to the system share sheet below.
    }

    await Share.share(body);
    return true;
  }

  String _normalizeWhatsAppPhone(String phone) {
    if (phone.startsWith('00')) return phone.substring(2);
    if (phone.startsWith('967') && phone.length >= 12) return phone;
    if (phone.startsWith('966') && phone.length >= 12) return phone;
    if (phone.startsWith('05') && phone.length == 10) {
      return '966${phone.substring(1)}';
    }
    if (phone.startsWith('5') && phone.length == 9) return '966$phone';
    if (phone.startsWith('07') && phone.length == 10) {
      return '967${phone.substring(1)}';
    }
    if (phone.startsWith('7') && phone.length == 9) return '967$phone';
    if (phone.startsWith('01') && phone.length == 10) {
      return '967${phone.substring(1)}';
    }
    return phone;
  }
}
