/// Build-time configuration passed with `--dart-define`.
abstract final class AppConfig {
  /// API base URL, e.g. `--dart-define=API_BASE_URL=https://api.example.com`.
  // TODO(backend): provide the base URL per flavour.
  static const String apiBaseUrl = String.fromEnvironment('API_BASE_URL');

  /// Fleet support line behind "Contact Us" and "Contact Support":
  /// `--dart-define=SUPPORT_PHONE=+974...`.
  // TODO(team): confirm the fleet support number.
  static const String supportPhone = String.fromEnvironment(
    'SUPPORT_PHONE',
    defaultValue: '+97444444444',
  );

  static const Duration connectTimeout = Duration(seconds: 20);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
