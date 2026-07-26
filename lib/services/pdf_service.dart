import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

import '../app/theme.dart';
import '../core/formatters.dart';
import '../core/labels.dart';
import '../data/local/app_database.dart';
import '../data/repositories/rental_repositories.dart';
import '../shared/widgets/milaak_ui.dart';

class PdfService {
  static pw.Font? _cachedFont;
  static pw.MemoryImage? _cachedLogo;

  Future<void> shareLines({
    BuildContext? context,
    required String title,
    required String filename,
    required List<String> lines,
    String? documentNo,
  }) async {
    var loadingShown = false;
    try {
      if (context != null && context.mounted) {
        loadingShown = true;
        _showPdfLoading(context);
      }
      final safeName = filename.endsWith('.pdf') ? filename : '$filename.pdf';
      final bytes = await _document(
        context: context,
        title: title,
        filename: safeName,
        lines: lines,
        documentNo: documentNo,
      );
      final directory = await getTemporaryDirectory();
      final file = _temporaryPdfFile(directory, safeName);
      await file.writeAsBytes(bytes, flush: true);

      if (context != null && context.mounted) {
        if (loadingShown) {
          Navigator.of(context, rootNavigator: true).pop();
          loadingShown = false;
        }
        await _showPdfReadySheet(
          context: context,
          title: title,
          filename: safeName,
          file: file,
          bytes: bytes,
        );
        return;
      }

      await _shareFile(
        file: file,
        title: title,
        bytes: bytes,
        filename: safeName,
      );
    } catch (error) {
      if (context != null && context.mounted) {
        if (loadingShown) {
          Navigator.of(context, rootNavigator: true).pop();
        }
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('تعذر إنشاء ملف PDF: $error')));
      } else {
        rethrow;
      }
    }
  }

  Future<void> shareDashboard({
    BuildContext? context,
    required List<PropertyRecord> properties,
    required List<TenantRecord> tenants,
    required List<PaymentRecord> payments,
    required List<ContractRecord> contracts,
    List<UtilityBillRecord> utilityBills = const [],
  }) async {
    final totalUnits = properties.fold<int>(0, (sum, item) => sum + item.units);
    final occupiedUnits = properties.fold<int>(
      0,
      (sum, item) => sum + item.occupiedUnits,
    );
    final occupancy = totalUnits == 0
        ? 0
        : ((occupiedUnits / totalUnits) * 100).round();
    final monthlyIncome = properties.fold<double>(
      0,
      (sum, item) => sum + item.monthlyIncome,
    );
    final arrears = tenants.fold<double>(
      0,
      (sum, item) =>
          sum +
          item.accumulatedDebt +
          item.balance +
          _utilityDebtForTenant(utilityBills, item.id),
    );
    final now = DateTime.now();
    final currentMonthPaid = payments
        .where(
          (p) =>
              p.status == 'paid' &&
              p.date.year == now.year &&
              p.date.month == now.month,
        )
        .fold<double>(0, (sum, item) => sum + item.amount);
    final closeContracts =
        contracts
            .where(
              (contract) =>
                  contract.endDate.isBefore(now.add(const Duration(days: 45))),
            )
            .toList()
          ..sort((a, b) => a.endDate.compareTo(b.endDate));

    await shareLines(
      context: context,
      title: 'تقرير لوحة التحكم',
      filename: 'milaak_dashboard.pdf',
      lines: [
        'تاريخ التقرير: ${formatDate(now)}',
        '',
        'إجمالي العقارات: ${properties.length}',
        'إجمالي الوحدات: $totalUnits',
        'الوحدات المشغولة: $occupiedUnits',
        'نسبة الإشغال: $occupancy%',
        'عدد المستأجرين: ${tenants.length}',
        'الدخل الشهري المتوقع: ${formatCurrency(monthlyIncome)}',
        'المتأخرات: ${formatCurrency(arrears)}',
        'تحصيل الشهر الحالي: ${formatCurrency(currentMonthPaid)}',
        '',
        'العقود القريبة:',
        if (closeContracts.isEmpty) 'لا توجد عقود قريبة من الانتهاء.',
        ...closeContracts
            .take(10)
            .map(
              (contract) =>
                  '- ${contract.tenantName} | ${contract.propertyName} | ${formatDate(contract.endDate)}',
            ),
      ],
    );
  }

  Future<void> shareProperties(
    List<PropertyRecord> properties, {
    BuildContext? context,
  }) async {
    await shareLines(
      context: context,
      title: 'تقرير العقارات',
      filename: 'milaak_properties.pdf',
      lines: [
        'عدد العقارات: ${properties.length}',
        '',
        if (properties.isEmpty) 'لا توجد عقارات مسجلة.',
        ...properties.expand((property) {
          final vacant = property.units - property.occupiedUnits;
          return [
            'العقار: ${property.name}',
            'العنوان: ${property.address}',
            'النوع: ${property.type == 'commercial' ? 'تجاري' : 'سكني'}',
            'الوحدات: ${property.occupiedUnits}/${property.units}',
            'الشاغرة: $vacant',
            'الدخل المتوقع: ${formatCurrency(property.monthlyIncome)}',
            '',
          ];
        }),
      ],
    );
  }

  Future<void> shareTenants(
    List<TenantRecord> tenants, {
    BuildContext? context,
    List<UtilityBillRecord> utilityBills = const [],
  }) async {
    await shareLines(
      context: context,
      title: 'تقرير المستأجرين',
      filename: 'milaak_tenants.pdf',
      lines: [
        'عدد المستأجرين: ${tenants.length}',
        '',
        if (tenants.isEmpty) 'لا يوجد مستأجرون مسجلون.',
        ...tenants.expand((tenant) {
          final debt =
              tenant.accumulatedDebt +
              tenant.balance +
              _utilityDebtForTenant(utilityBills, tenant.id);
          final tenantUtilities = utilityBills
              .where(
                (bill) =>
                    bill.tenantId == tenant.id &&
                    bill.status == 'open' &&
                    bill.chargeToTenant,
              )
              .toList();
          return [
            'المستأجر: ${tenant.name}',
            'الجوال: ${tenant.phone}',
            'العقار والوحدة: ${tenant.propertyName} - ${formatUnitShort(null, tenant.unitId)}',
            'الحالة: ${tenant.status == 'active' ? 'نشط' : tenant.status}',
            'المديونية: ${formatCurrency(debt)}',
            'التأمين: ${formatCurrency(tenant.securityDeposit)}',
            if (tenantUtilities.isNotEmpty) 'خدمات مفتوحة:',
            ...tenantUtilities.map(
              (bill) =>
                  '- ${utilityBillTypeLabel(bill.type)} | ${formatCurrency(bill.amount)} | ${formatDate(bill.periodEnd)}',
            ),
            '',
          ];
        }),
      ],
    );
  }

  Future<void> shareContracts(
    List<ContractRecord> contracts, {
    BuildContext? context,
  }) async {
    await shareLines(
      context: context,
      title: 'أرشيف العقود',
      filename: 'milaak_contracts.pdf',
      lines: [
        'عدد العقود: ${contracts.length}',
        '',
        if (contracts.isEmpty) 'لا توجد عقود مسجلة.',
        ...contracts.expand(
          (contract) => [
            'رقم العقد: ${contract.id}',
            'المستأجر: ${contract.tenantName}',
            'العقار: ${contract.propertyName}',
            'المدة: ${formatDate(contract.startDate)} - ${formatDate(contract.endDate)}',
            'الإيجار: ${formatCurrency(contract.rentAmount)}',
            'التأمين: ${formatCurrency(contract.securityDepositAmount)}',
            '',
          ],
        ),
      ],
    );
  }

  Future<void> sharePayments(
    List<PaymentRecord> payments, {
    BuildContext? context,
  }) async {
    final paid = payments
        .where((item) => item.status == 'paid')
        .fold<double>(0, (sum, item) => sum + item.amount);
    final pending = payments
        .where((item) => item.status != 'paid')
        .fold<double>(0, (sum, item) => sum + item.amount);
    await shareLines(
      context: context,
      title: 'تقرير التحصيل',
      filename: 'milaak_payments.pdf',
      lines: [
        'عدد السندات: ${payments.length}',
        'إجمالي المدفوع: ${formatCurrency(paid)}',
        'إجمالي المعلق: ${formatCurrency(pending)}',
        '',
        if (payments.isEmpty) 'لا توجد سندات قبض.',
        ...payments.expand(
          (payment) => [
            'السند: ${payment.receiptNo}',
            'المستأجر: ${payment.tenantName}',
            'العقار: ${payment.propertyName}',
            'المبلغ: ${formatCurrency(payment.amount)}',
            'التاريخ: ${formatDate(payment.date)}',
            'الحالة: ${payment.status == 'paid' ? 'مدفوع' : 'معلق'}',
            '',
          ],
        ),
      ],
    );
  }

  Future<void> shareFinancialReport({
    BuildContext? context,
    required List<PropertyRecord> properties,
    required List<TenantRecord> tenants,
    required List<PaymentRecord> payments,
    List<ExpenseRecord> expenses = const [],
    List<RentScheduleRecord> schedules = const [],
    List<UtilityBillRecord> utilityBills = const [],
  }) async {
    final income = properties.fold<double>(
      0,
      (sum, item) => sum + item.monthlyIncome,
    );
    final arrears = tenants.fold<double>(
      0,
      (sum, item) =>
          sum +
          item.accumulatedDebt +
          item.balance +
          _utilityDebtForTenant(utilityBills, item.id),
    );
    final paid = payments
        .where((p) => p.status == 'paid')
        .fold<double>(0, (sum, item) => sum + item.amount);
    final pending = payments
        .where((p) => p.status != 'paid')
        .fold<double>(0, (sum, item) => sum + item.amount);
    final expensesTotal = expenses.fold<double>(
      0,
      (sum, item) => sum + item.amount,
    );
    final schedulesDue = schedules
        .where((item) => item.status != 'paid')
        .fold<double>(0, (sum, item) => sum + item.amount - item.paidAmount);

    await shareLines(
      context: context,
      title: 'التقرير المالي',
      filename: 'milaak_financial_report.pdf',
      lines: [
        'الدخل الشهري المتوقع: ${formatCurrency(income)}',
        'إجمالي التحصيل: ${formatCurrency(paid)}',
        'المتأخرات: ${formatCurrency(arrears)}',
        'المبالغ المعلقة: ${formatCurrency(pending)}',
        'استحقاقات غير مسددة: ${formatCurrency(schedulesDue)}',
        'إجمالي المصروفات: ${formatCurrency(expensesTotal)}',
        'صافي التحصيل: ${formatCurrency(paid - expensesTotal)}',
        '',
        'مؤشرات عامة:',
        '- عدد العقارات: ${properties.length}',
        '- عدد المستأجرين: ${tenants.length}',
        '- عدد السندات: ${payments.length}',
        '- عدد المصروفات: ${expenses.length}',
      ],
    );
  }

  Future<void> shareContract(
    ContractRecord contract, {
    BuildContext? context,
  }) async {
    await shareLines(
      context: context,
      title: 'عقد إيجار',
      filename: 'contract_${contract.id}.pdf',
      lines: [
        'رقم العقد: ${contract.id}',
        'المستأجر: ${contract.tenantName}',
        'العقار: ${contract.propertyName}',
        'بداية العقد: ${formatDate(contract.startDate)}',
        'نهاية العقد: ${formatDate(contract.endDate)}',
        'قيمة الإيجار: ${formatCurrency(contract.rentAmount)}',
        'التأمين: ${formatCurrency(contract.securityDepositAmount)}',
        '',
        contract.content,
      ],
    );
  }

  Future<void> shareReceipt(
    PaymentRecord payment, {
    BuildContext? context,
    List<UtilityBillRecord> utilityBills = const [],
  }) async {
    await shareLines(
      context: context,
      title: 'سند قبض',
      filename: '${payment.receiptNo}.pdf',
      documentNo: payment.receiptNo,
      lines: [
        'رقم السند: ${payment.receiptNo}',
        'المستأجر: ${payment.tenantName}',
        'العقار: ${payment.propertyName}',
        'التاريخ: ${formatDate(payment.date)}',
        'المبلغ: ${formatCurrency(payment.amount)}',
        'طريقة الدفع: ${payment.method}',
        'الحالة: ${payment.status == 'paid' ? 'مدفوع' : 'معلق'}',
        if (payment.dueScheduleId != null) 'البند: إيجار',
        if (utilityBills.isNotEmpty) 'بنود الخدمات:',
        ...utilityBills.map(
          (bill) =>
              '- ${utilityBillTypeLabel(bill.type)} | ${formatCurrency(bill.amount)} | ${formatDate(bill.periodStart)} - ${formatDate(bill.periodEnd)}',
        ),
        if (payment.notes != null) 'ملاحظات: ${payment.notes}',
      ],
    );
  }

  double _utilityDebtForTenant(List<UtilityBillRecord> bills, int tenantId) {
    return bills
        .where(
          (bill) =>
              bill.tenantId == tenantId &&
              bill.status == 'open' &&
              bill.chargeToTenant,
        )
        .fold<double>(0, (sum, bill) => sum + bill.amount);
  }

  Future<pw.Font> _loadPdfFont() async {
    final cached = _cachedFont;
    if (cached != null) return cached;
    final fontData = await rootBundle.load('assets/fonts/NotoNaskhArabic.ttf');
    final font = pw.Font.ttf(fontData);
    _cachedFont = font;
    return font;
  }

  Future<pw.MemoryImage> _loadPdfLogo() async {
    final cached = _cachedLogo;
    if (cached != null) return cached;
    final logoData = await rootBundle.load(
      'assets/brand/milaak_logo_transparent.png',
    );
    final logo = pw.MemoryImage(logoData.buffer.asUint8List());
    _cachedLogo = logo;
    return logo;
  }

  Future<Uint8List> _document({
    BuildContext? context,
    required String title,
    required String filename,
    required List<String> lines,
    String? documentNo,
  }) async {
    final doc = pw.Document();
    final profile = _readPdfProfile(context);
    final font = await _loadPdfFont();
    final logo = await _loadPdfLogo();

    final labelStyle = pw.TextStyle(
      fontSize: 10,
      fontWeight: pw.FontWeight.bold,
      color: PdfColors.black,
    );
    final valueStyle = pw.TextStyle(
      fontSize: 10,
      color: PdfColors.black,
      lineSpacing: 1.4,
    );
    final generatedAt = DateTime.now();
    final effectiveNo =
        documentNo ??
        filename
            .replaceAll('.pdf', '')
            .replaceAll(RegExp(r'[^A-Za-z0-9_-]'), '_');

    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.fromLTRB(22, 26, 22, 28),
        theme: pw.ThemeData.withFont(base: font, bold: font),
        textDirection: pw.TextDirection.rtl,
        header: (_) => _buildHeader(
          logo: logo,
          profile: profile,
          title: title,
          documentNo: effectiveNo,
          generatedAt: generatedAt,
        ),
        footer: (pageContext) {
          return pw.Container(
            padding: const pw.EdgeInsets.only(top: 8),
            decoration: const pw.BoxDecoration(
              border: pw.Border(top: pw.BorderSide(width: .5)),
            ),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'تم الإنشاء بواسطة مِلاك | Milaak',
                  style: pw.TextStyle(fontSize: 8, color: PdfColors.grey700),
                ),
                pw.Text(
                  'صفحة ${pageContext.pageNumber} من ${pageContext.pagesCount}',
                  style: pw.TextStyle(fontSize: 8, color: PdfColors.grey700),
                ),
              ],
            ),
          );
        },
        build: (context) => [_buildDocumentBody(lines, labelStyle, valueStyle)],
      ),
    );

    return doc.save();
  }

  _PdfProfile _readPdfProfile(BuildContext? context) {
    var officeName = 'مكتب مِلاك العقاري';
    var officePhone = '';
    var currency = 'YER';

    if (context != null) {
      try {
        final container = ProviderScope.containerOf(context, listen: false);
        officeName =
            container.read(officeNameProvider).valueOrNull ?? officeName;
        officePhone =
            container.read(officePhoneProvider).valueOrNull ?? officePhone;
        currency = container.read(currencyProvider).valueOrNull ?? currency;
      } catch (_) {
        // Keep PDF generation independent from provider availability.
      }
    }

    return _PdfProfile(
      officeName: officeName.trim().isEmpty ? 'مكتب مِلاك العقاري' : officeName,
      officePhone: officePhone.trim(),
      currency: currency.trim().isEmpty ? 'YER' : currency,
    );
  }

  pw.Widget _buildHeader({
    required pw.MemoryImage logo,
    required _PdfProfile profile,
    required String title,
    required String documentNo,
    required DateTime generatedAt,
  }) {
    final gold = PdfColor.fromHex('#C98722');
    final ink = PdfColor.fromHex('#111827');
    final soft = PdfColor.fromHex('#6B7280');

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
      children: [
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Expanded(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    profile.officeName,
                    style: pw.TextStyle(
                      fontSize: 12,
                      fontWeight: pw.FontWeight.bold,
                      color: ink,
                    ),
                  ),
                  pw.SizedBox(height: 4),
                  pw.Text(
                    'إدارة الإيجارات والعقود والتحصيل',
                    style: pw.TextStyle(fontSize: 9, color: soft),
                  ),
                  if (profile.officePhone.isNotEmpty) ...[
                    pw.SizedBox(height: 3),
                    pw.Text(
                      'هاتف: ${profile.officePhone}',
                      style: pw.TextStyle(fontSize: 9, color: soft),
                    ),
                  ],
                ],
              ),
            ),
            pw.Container(
              width: 88,
              alignment: pw.Alignment.center,
              child: pw.Column(
                mainAxisSize: pw.MainAxisSize.min,
                children: [
                  pw.Image(logo, width: 54, height: 54, fit: pw.BoxFit.contain),
                  pw.SizedBox(height: 2),
                  pw.Text(
                    'Milaak',
                    style: pw.TextStyle(
                      fontSize: 10,
                      fontWeight: pw.FontWeight.bold,
                      color: gold,
                    ),
                  ),
                ],
              ),
            ),
            pw.Expanded(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text(
                    'رقم المستند: $documentNo',
                    style: pw.TextStyle(fontSize: 9, color: ink),
                  ),
                  pw.SizedBox(height: 4),
                  pw.Text(
                    'التاريخ: ${formatDate(generatedAt)}',
                    style: pw.TextStyle(fontSize: 9, color: ink),
                  ),
                  pw.SizedBox(height: 4),
                  pw.Text(
                    'العملة: ${profile.currency}',
                    style: pw.TextStyle(fontSize: 9, color: ink),
                  ),
                ],
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 10),
        pw.Container(height: 1, color: PdfColors.black),
        pw.SizedBox(height: 10),
        pw.Center(
          child: pw.Text(
            title,
            style: pw.TextStyle(
              fontSize: 14,
              fontWeight: pw.FontWeight.bold,
              color: ink,
            ),
          ),
        ),
        pw.SizedBox(height: 10),
      ],
    );
  }

  pw.Widget _buildDocumentBody(
    List<String> lines,
    pw.TextStyle labelStyle,
    pw.TextStyle valueStyle,
  ) {
    final rows = _parseReportLines(lines);
    final summaryRows = rows
        .where((row) => row.kind == _PdfRowKind.pair)
        .toList();
    final tableRows = rows
        .where((row) => row.kind == _PdfRowKind.item)
        .toList();
    final titleRows = rows
        .where((row) => row.kind == _PdfRowKind.title)
        .toList();
    final noteRows = rows.where((row) => row.kind == _PdfRowKind.note).toList();

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
      children: [
        if (summaryRows.isNotEmpty)
          _buildInfoPanel(summaryRows, labelStyle, valueStyle),
        if (tableRows.isNotEmpty) ...[
          pw.SizedBox(height: 14),
          _buildItemsTable(tableRows),
        ],
        if (titleRows.isNotEmpty || noteRows.isNotEmpty) ...[
          pw.SizedBox(height: 14),
          ...titleRows.map((row) => _buildSectionTitle(row.value)),
          ...noteRows.map((row) => _buildNote(row.value, valueStyle)),
        ],
      ],
    );
  }

  List<_PdfRow> _parseReportLines(List<String> lines) {
    final rows = <_PdfRow>[];
    for (final rawLine in lines) {
      final line = rawLine.trim();
      if (line.isEmpty) continue;
      if (line.endsWith(':') && !line.contains('|')) {
        rows.add(
          _PdfRow(_PdfRowKind.title, line.substring(0, line.length - 1)),
        );
        continue;
      }
      if (line.startsWith('- ')) {
        rows.add(_PdfRow(_PdfRowKind.item, line.substring(2).trim()));
        continue;
      }
      final parts = line.split(RegExp(r'\s*:\s*'));
      if (parts.length >= 2) {
        rows.add(
          _PdfRow(_PdfRowKind.pair, parts.sublist(1).join(': '), parts.first),
        );
        continue;
      }
      rows.add(_PdfRow(_PdfRowKind.note, line));
    }
    return rows;
  }

  pw.Widget _buildInfoPanel(
    List<_PdfRow> rows,
    pw.TextStyle labelStyle,
    pw.TextStyle valueStyle,
  ) {
    final border = PdfColor.fromHex('#D1D5DB');
    final bg = PdfColor.fromHex('#F9FAFB');

    return pw.Container(
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(
        color: bg,
        border: pw.Border.all(color: border, width: .7),
        borderRadius: pw.BorderRadius.circular(8),
      ),
      child: pw.Wrap(
        spacing: 12,
        runSpacing: 8,
        children: rows
            .map(
              (row) => pw.Container(
                width: 245,
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Container(
                      width: 86,
                      child: pw.Text('${row.label}:', style: labelStyle),
                    ),
                    pw.Expanded(child: pw.Text(row.value, style: valueStyle)),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  pw.Widget _buildItemsTable(List<_PdfRow> rows) {
    final headerBg = PdfColor.fromHex('#E5E7EB');
    final border = PdfColor.fromHex('#9CA3AF');
    final itemRows = rows.map((row) {
      final cells = row.value.split('|').map((cell) => cell.trim()).toList();
      return [
        cells.isNotEmpty ? cells[0] : row.value,
        cells.length > 1 ? cells.sublist(1).join(' | ') : '',
      ];
    }).toList();

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
      children: [
        pw.Center(
          child: pw.Text(
            'تفاصيل التقرير',
            style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
          ),
        ),
        pw.SizedBox(height: 6),
        pw.TableHelper.fromTextArray(
          headers: const ['البند', 'التفاصيل'],
          data: itemRows,
          border: pw.TableBorder.all(color: border, width: .5),
          headerDecoration: pw.BoxDecoration(color: headerBg),
          headerStyle: pw.TextStyle(
            fontSize: 9,
            fontWeight: pw.FontWeight.bold,
          ),
          cellStyle: const pw.TextStyle(fontSize: 9),
          cellAlignment: pw.Alignment.centerRight,
          headerAlignment: pw.Alignment.center,
          cellPadding: const pw.EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 5,
          ),
        ),
      ],
    );
  }

  pw.Widget _buildSectionTitle(String title) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 7),
      child: pw.Center(
        child: pw.Text(
          title,
          style: pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold),
        ),
      ),
    );
  }

  pw.Widget _buildNote(String text, pw.TextStyle style) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 7),
      child: pw.Text(text, style: style),
    );
  }

  void _showPdfLoading(BuildContext context) {
    showDialog<void>(
      context: context,
      useRootNavigator: true,
      barrierDismissible: false,
      builder: (dialogContext) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(24),
            child: MilaakGlassPanel(
              blurSigma: 18,
              radius: 26,
              padding: const EdgeInsets.all(18),
              fillColor: MilaakColors.glassSurfaceFor(
                dialogContext,
                strong: true,
              ),
              borderColor: MilaakColors.glassBorderFor(dialogContext),
              child: const Row(
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2.4),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      'جاري إنشاء ملف PDF...',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showPdfReadySheet({
    required BuildContext context,
    required String title,
    required String filename,
    required File file,
    required Uint8List bytes,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      barrierColor: MilaakColors.charcoal.withValues(alpha: .58),
      showDragHandle: true,
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: MilaakGlassPanel(
              blurSigma: 18,
              radius: 28,
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 18),
              fillColor: MilaakColors.glassSurfaceFor(
                sheetContext,
                strong: true,
              ),
              borderColor: MilaakColors.glassBorderFor(sheetContext),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'تم إنشاء ملف PDF',
                    style: Theme.of(sheetContext).textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    filename,
                    style: TextStyle(
                      color: MilaakColors.textSoftFor(sheetContext),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: () async {
                      Navigator.of(sheetContext).pop();
                      await _openPdfFile(
                        context: context,
                        title: title,
                        filename: filename,
                        file: file,
                        bytes: bytes,
                      );
                    },
                    icon: const Icon(Icons.picture_as_pdf_rounded),
                    label: const Text('فتح الملف'),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton.icon(
                    onPressed: () async {
                      Navigator.of(sheetContext).pop();
                      await _shareFile(
                        file: file,
                        title: title,
                        bytes: bytes,
                        filename: filename,
                      );
                    },
                    icon: const Icon(Icons.ios_share_rounded),
                    label: const Text('مشاركة أو حفظ الملف'),
                  ),
                  const SizedBox(height: 10),
                  TextButton.icon(
                    onPressed: () async {
                      Navigator.of(sheetContext).pop();
                      await _openPdfPreview(
                        context: context,
                        title: title,
                        filename: filename,
                        file: file,
                        bytes: bytes,
                      );
                    },
                    icon: const Icon(Icons.print_rounded),
                    label: const Text('معاينة الطباعة'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _openPdfFile({
    required BuildContext context,
    required String title,
    required String filename,
    required File file,
    required Uint8List bytes,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 180));
    try {
      final result = await OpenFilex.open(file.path, type: 'application/pdf');
      if (result.type == ResultType.done) return;
      throw StateError(result.message);
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('تعذر فتح الملف، سيتم فتح المشاركة: $error')),
        );
      }
      await _shareFile(
        file: file,
        title: title,
        bytes: bytes,
        filename: filename,
      );
    }
  }

  Future<void> _openPdfPreview({
    required BuildContext context,
    required String title,
    required String filename,
    required File file,
    required Uint8List bytes,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 180));
    try {
      await Printing.layoutPdf(name: filename, onLayout: (_) async => bytes);
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تعذر فتح معاينة PDF، سيتم فتح المشاركة: $error'),
          ),
        );
      }
      await _shareFile(
        file: file,
        title: title,
        bytes: bytes,
        filename: filename,
      );
    }
  }

  Future<void> _shareFile({
    required File file,
    required String title,
    required Uint8List bytes,
    required String filename,
  }) async {
    try {
      await Share.shareXFiles([
        XFile(file.path, mimeType: 'application/pdf', name: filename),
      ], text: title);
    } catch (_) {
      await Printing.sharePdf(bytes: bytes, filename: filename);
    }
  }

  File _temporaryPdfFile(Directory directory, String filename) {
    final stamp = DateTime.now().microsecondsSinceEpoch;
    final safeFilename = filename.replaceAll(RegExp(r'[\\/:*?"<>|]'), '_');
    return File('${directory.path}/milaak_${stamp}_$safeFilename');
  }
}

class _PdfProfile {
  const _PdfProfile({
    required this.officeName,
    required this.officePhone,
    required this.currency,
  });

  final String officeName;
  final String officePhone;
  final String currency;
}

enum _PdfRowKind { pair, item, title, note }

class _PdfRow {
  const _PdfRow(this.kind, this.value, [this.label = '']);

  final _PdfRowKind kind;
  final String value;
  final String label;
}
