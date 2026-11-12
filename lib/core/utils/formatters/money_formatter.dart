import 'package:intl/intl.dart';

/// Formats Qatari Riyal amounts as "QAR 96.00".
// TODO(design): confirm Western vs Eastern Arabic digits for Arabic.
abstract final class MoneyFormatter {
  static const String _currency = 'QAR';
  static const int _minorPerMajor = 100;
  static final NumberFormat _number = NumberFormat('#,##0.00', 'en');

  /// Formats a major-unit [amount]. [locale] is accepted for a future
  /// Arabic-digit decision; digits are Western for now.
  static String format(num amount, {String? locale}) =>
      formatMinor((amount * _minorPerMajor).round(), locale: locale);

  /// Formats an amount given in minor units (dirhams).
  static String formatMinor(int minorUnits, {String? locale}) {
    final sign = minorUnits < 0 ? '-' : '';
    final major = minorUnits.abs() / _minorPerMajor;
    return '$sign$_currency ${_number.format(major)}';
  }
}
