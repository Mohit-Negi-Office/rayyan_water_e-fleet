import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/debug/api_log_inspector.dart';
import 'package:rayyan_driver/core/network/app_config.dart';
import 'package:rayyan_driver/core/network/interceptors/accept_language_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Third-party instances that can't be annotated directly.
@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @lazySingleton
  Dio dio(AcceptLanguageInterceptor acceptLanguage) {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.apiBaseUrl,
        connectTimeout: AppConfig.connectTimeout,
        receiveTimeout: AppConfig.receiveTimeout,
        contentType: Headers.jsonContentType,
      ),
    );
    // TODO(backend): add the auth header and token refresh interceptor.
    dio.interceptors.add(acceptLanguage);
    final getIt = GetIt.instance;
    ApiLogInspector.attach(
      dio,
      enabled: AppConfig.enableLogs,
      alice: getIt.isRegistered<Alice>() ? getIt<Alice>() : null,
    );
    return dio;
  }
}
