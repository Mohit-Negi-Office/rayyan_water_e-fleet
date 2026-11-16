import 'package:rayyan_driver/app/flavor.dart';
import 'package:rayyan_driver/core/utils/env.dart';

/// Build-time configuration for the running [AppFlavor].
///
/// [apiBaseUrl] comes from `BASE_URL` in the active `.env`. `make run-<flavor>`
/// copies `.env.dev`, `.env.qa`, `.env.staging`, or `.env.prod` into `.env`
/// and regenerates that value.
abstract final class AppConfig {
  static AppFlavor _flavor = AppFlavor.dev;

  /// Flavor selected by [use]. Defaults to [AppFlavor.dev].
  static AppFlavor get flavor => _flavor;

  /// Selects the running flavor. Called once from bootstrap.
  static void use(AppFlavor flavor) => _flavor = flavor;

  /// API inspector is available on every flavor except production.
  static bool get enableLogs => switch (_flavor) {
    AppFlavor.production => false,
    AppFlavor.dev || AppFlavor.qa || AppFlavor.staging => true,
  };

  /// API base URL from the loaded env file.
  static String get apiBaseUrl => Env.baseUrl;

  /// Basic-auth user for the login OTP call.
  static String get basicAuthUsername => Env.basicAuthUsername;

  /// Basic-auth password for the login OTP call.
  static String get basicAuthPassword => Env.basicAuthPassword;

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
