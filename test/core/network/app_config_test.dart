import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/app/flavor.dart';
import 'package:rayyan_driver/core/network/app_config.dart';
import 'package:rayyan_driver/core/network/app_environment.dart';

void main() {
  tearDown(() => AppConfig.use(AppFlavor.dev));

  test('dev, qa, and staging enable logs; production does not', () {
    AppConfig.use(AppFlavor.dev);
    expect(AppConfig.enableLogs, isTrue);
    AppConfig.use(AppFlavor.qa);
    expect(AppConfig.enableLogs, isTrue);
    AppConfig.use(AppFlavor.staging);
    expect(AppConfig.enableLogs, isTrue);
    AppConfig.use(AppFlavor.production);
    expect(AppConfig.enableLogs, isFalse);
  });

  test('the loaded env file supplies the api base url', () {
    expect(AppConfig.apiBaseUrl, 'https://api-dev.rayyanwater.com');
  });

  test('sample data is only dev with an empty base url', () {
    expect(
      AppEnvironment.environmentFor(flavor: AppFlavor.dev, apiBaseUrl: ''),
      AppEnvironment.mock,
    );
    expect(
      AppEnvironment.environmentFor(
        flavor: AppFlavor.dev,
        apiBaseUrl: 'https://dev.example',
      ),
      AppEnvironment.prod,
    );
    expect(
      AppEnvironment.environmentFor(flavor: AppFlavor.qa, apiBaseUrl: ''),
      AppEnvironment.prod,
    );
    expect(
      AppEnvironment.environmentFor(flavor: AppFlavor.staging, apiBaseUrl: ''),
      AppEnvironment.prod,
    );
    expect(
      AppEnvironment.environmentFor(
        flavor: AppFlavor.production,
        apiBaseUrl: '',
      ),
      AppEnvironment.prod,
    );
  });

  test('an explicit APP_ENV value wins over the flavor', () {
    expect(
      AppEnvironment.environmentFor(
        flavor: AppFlavor.production,
        apiBaseUrl: 'https://production.example',
        fromDefine: AppEnvironment.mock,
      ),
      AppEnvironment.mock,
    );
  });
}
