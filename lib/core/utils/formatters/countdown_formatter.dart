/// Formats a countdown in seconds as "mm:ss" ("00:59").
abstract final class CountdownFormatter {
  static const int _secondsPerMinute = 60;

  static String format(int seconds) {
    final safe = seconds < 0 ? 0 : seconds;
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(safe ~/ _secondsPerMinute)}:${two(safe % _secondsPerMinute)}';
  }
}
