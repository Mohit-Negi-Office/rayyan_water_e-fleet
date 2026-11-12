/// Day-of-month ordinals ("Every Month, 12th").
abstract final class OrdinalFormatter {
  /// English gets a suffix; other languages show the plain number.
  static String format(int n, String locale) {
    if (!locale.startsWith('en')) return '$n';
    final lastTwo = n % 100;
    if (lastTwo >= 11 && lastTwo <= 13) return '${n}th';
    return switch (n % 10) {
      1 => '${n}st',
      2 => '${n}nd',
      3 => '${n}rd',
      _ => '${n}th',
    };
  }
}
