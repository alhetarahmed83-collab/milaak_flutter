import 'package:intl/intl.dart';

final _currency = NumberFormat.currency(
  locale: 'ar_YE',
  symbol: 'ر.ي',
  decimalDigits: 0,
);

final _date = DateFormat.yMMMd('ar_SA');

String formatCurrency(num value) => _currency.format(value);

String formatCurrencyWithCode(num value, String currency) {
  switch (currency) {
    case 'YER':
      return NumberFormat.currency(
        locale: 'ar_YE',
        symbol: 'ر.ي',
        decimalDigits: 0,
      ).format(value);
    case 'SAR':
      return NumberFormat.currency(
        locale: 'ar_SA',
        symbol: 'ر.س',
        decimalDigits: 0,
      ).format(value);
    case 'USD':
      return NumberFormat.currency(
        locale: 'en_US',
        symbol: '\$',
        decimalDigits: 2,
      ).format(value);
    default:
      return NumberFormat.currency(
        locale: 'en_US',
        symbol: currency,
        decimalDigits: 0,
      ).format(value);
  }
}

String formatDate(DateTime value) => _date.format(value);

String receiptNumber() =>
    'PAY-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
