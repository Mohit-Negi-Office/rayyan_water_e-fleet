import 'package:rayyan_driver/app/flavor.dart';
import 'package:rayyan_driver/core/network/app_config.dart';

/// DI environments. `mock` serves sample data; `prod` calls the API.
abstract final class AppEnvironment {
  static const String mock = 'mock';
  static const String prod = 'prod';

  /// From `--dart-define=APP_ENV=prod|mock` when set. Otherwise dev with an
  /// empty base URL stays on sample data, and a flavor with a base URL
  /// calls the API.
  static String get current => environmentFor(
    flavor: AppConfig.flavor,
    apiBaseUrl: AppConfig.apiBaseUrl,
    fromDefine: const String.fromEnvironment('APP_ENV'),
  );

  /// Resolves the injectable environment for [flavor].
  static String environmentFor({
    required AppFlavor flavor,
    required String apiBaseUrl,
    String fromDefine = '',
  }) {
    if (fromDefine.isNotEmpty) return fromDefine;
    final talksToApi = flavor != AppFlavor.dev || apiBaseUrl.isNotEmpty;
    return talksToApi ? prod : mock;
  }
}
