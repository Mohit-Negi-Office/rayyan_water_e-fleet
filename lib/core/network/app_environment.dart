import 'package:rayyan_driver/core/network/app_config.dart';

/// DI environments. `mock` serves sample data; `prod` calls the API.
abstract final class AppEnvironment {
  static const String mock = 'mock';
  static const String prod = 'prod';

  /// From `--dart-define=APP_ENV=prod|mock`. Defaults to `mock` while no
  /// API base URL is configured.
  static String get current {
    const fromDefine = String.fromEnvironment('APP_ENV');
    if (fromDefine.isNotEmpty) return fromDefine;
    return AppConfig.apiBaseUrl.isEmpty ? mock : prod;
  }
}
