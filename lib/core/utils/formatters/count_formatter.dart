import 'package:intl/intl.dart';

/// Whole numbers with grouped thousands ("2,530 Points").
// TODO(design): confirm Western vs Eastern Arabic digits for Arabic.
abstract final class CountFormatter {
  static final NumberFormat _grouped = NumberFormat('#,##0', 'en');

  static String grouped(int value) => _grouped.format(value);
}
