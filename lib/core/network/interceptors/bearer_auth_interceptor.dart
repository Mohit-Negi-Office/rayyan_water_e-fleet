import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/network/basic_authorization.dart';
import 'package:rayyan_driver/core/network/bearer_authorization.dart';
import 'package:rayyan_driver/core/storage/secure_storage.dart';
import 'package:rayyan_driver/core/storage/storage_keys.dart';

/// Adds `Authorization: Bearer` from the saved access token.
///
/// A call that already set [BasicAuthorization.header] keeps that value,
/// so OTP can stay on basic auth.
@lazySingleton
final class BearerAuthInterceptor extends Interceptor {
  BearerAuthInterceptor(this._storage);

  final SecureStorage _storage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final existing = options.headers[BasicAuthorization.header];
    if (existing == null || existing.toString().isEmpty) {
      final token = await _storage.read(StorageKeys.accessToken);
      if (token != null && token.isNotEmpty) {
        options.headers[BasicAuthorization.header] = BearerAuthorization.value(
          token,
        );
      }
    }
    handler.next(options);
  }
}
