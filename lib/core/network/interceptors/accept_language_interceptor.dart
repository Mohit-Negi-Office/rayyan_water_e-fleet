import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/storage/key_value_storage.dart';
import 'package:rayyan_driver/core/storage/storage_keys.dart';

/// Sends the selected app language so the API returns localized content.
// TODO(backend): confirm the API honours Accept-Language.
@lazySingleton
final class AcceptLanguageInterceptor extends Interceptor {
  AcceptLanguageInterceptor(this._storage);

  static const String _fallbackLanguage = 'en';
  final KeyValueStorage _storage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final code = await _storage.readString(StorageKeys.languageCode);
    options.headers['Accept-Language'] = code ?? _fallbackLanguage;
    handler.next(options);
  }
}
