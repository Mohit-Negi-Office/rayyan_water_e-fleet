import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/debug/api_log_inspector.dart';
import 'package:rayyan_driver/core/network/app_config.dart';
import 'package:rayyan_driver/core/network/interceptors/accept_language_interceptor.dart';
import 'package:rayyan_driver/core/network/interceptors/api_debug_log_interceptor.dart';
import 'package:rayyan_driver/core/network/interceptors/bearer_auth_interceptor.dart';
import 'package:rayyan_driver/core/network/interceptors/device_id_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Third-party instances that can't be annotated directly.
@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @lazySingleton
  Dio dio(
    AcceptLanguageInterceptor acceptLanguage,
    DeviceIdInterceptor deviceId,
    BearerAuthInterceptor bearerAuth,
  ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.apiBaseUrl,
        connectTimeout: AppConfig.connectTimeout,
        receiveTimeout: AppConfig.receiveTimeout,
        contentType: Headers.jsonContentType,
        headers: const {Headers.acceptHeader: Headers.jsonContentType},
      ),
    );
    // TODO(backend): refresh the session token when it expires.
    // Login OTP sends basic auth from the env file.
    dio.interceptors.add(acceptLanguage);
    dio.interceptors.add(deviceId);
    dio.interceptors.add(bearerAuth);
    if (AppConfig.enableLogs) {
      dio.interceptors.add(ApiDebugLogInterceptor());
    }
    final getIt = GetIt.instance;
    ApiLogInspector.attach(
      dio,
      enabled: AppConfig.enableLogs,
      alice: getIt.isRegistered<Alice>() ? getIt<Alice>() : null,
    );
    return dio;
  }
}
