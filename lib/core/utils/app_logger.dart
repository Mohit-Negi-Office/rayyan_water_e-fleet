import 'dart:developer' as developer;

/// Central logger. Never pass tokens, card data, phone numbers or addresses.
abstract final class AppLogger {
  /// Debug-level message.
  static void debug(String message) =>
      developer.log(message, name: 'rayyan_driver');

  /// Error with optional cause and stack trace.
  // TODO(team): forward to the crash reporter (Crashlytics or Sentry).
  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    developer.log(
      message,
      name: 'rayyan_driver',
      level: 1000,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
