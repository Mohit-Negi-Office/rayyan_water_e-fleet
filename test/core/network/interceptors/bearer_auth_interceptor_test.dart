import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/network/basic_authorization.dart';
import 'package:rayyan_driver/core/network/bearer_authorization.dart';
import 'package:rayyan_driver/core/network/interceptors/bearer_auth_interceptor.dart';
import 'package:rayyan_driver/core/storage/secure_storage.dart';
import 'package:rayyan_driver/core/storage/storage_keys.dart';

void main() {
  test('sends the stored access token as Bearer', () async {
    final adapter = _CaptureAdapter();
    final dio = Dio(BaseOptions(baseUrl: 'https://api-dev.rayyanwater.com'));
    dio.httpClientAdapter = adapter;
    dio.interceptors.add(
      BearerAuthInterceptor(
        _MemoryStorage({StorageKeys.accessToken: 'session-token'}),
      ),
    );

    await dio.get<Object>('/user-service/v1/profile/driver');

    expect(
      adapter.options?.headers[BasicAuthorization.header],
      BearerAuthorization.value('session-token'),
    );
  });

  test('leaves an Authorization header that the call already set', () async {
    final adapter = _CaptureAdapter();
    final dio = Dio(BaseOptions(baseUrl: 'https://api-dev.rayyanwater.com'));
    dio.httpClientAdapter = adapter;
    dio.interceptors.add(
      BearerAuthInterceptor(
        _MemoryStorage({StorageKeys.accessToken: 'session-token'}),
      ),
    );

    await dio.post<Object>(
      '/user-service/v1/otp/send',
      options: Options(headers: {BasicAuthorization.header: 'Basic abc'}),
    );

    expect(adapter.options?.headers[BasicAuthorization.header], 'Basic abc');
  });

  test('sends no Authorization when no access token is stored', () async {
    final adapter = _CaptureAdapter();
    final dio = Dio(BaseOptions(baseUrl: 'https://api-dev.rayyanwater.com'));
    dio.httpClientAdapter = adapter;
    dio.interceptors.add(BearerAuthInterceptor(_MemoryStorage(const {})));

    await dio.get<Object>('/user-service/v1/profile/driver');

    expect(adapter.options?.headers[BasicAuthorization.header], isNull);
  });
}

final class _MemoryStorage implements SecureStorage {
  _MemoryStorage(this._values);

  final Map<String, String> _values;

  @override
  Future<String?> read(String key) async => _values[key];

  @override
  Future<void> write(String key, String value) async => _values[key] = value;

  @override
  Future<void> delete(String key) async => _values.remove(key);
}

final class _CaptureAdapter implements HttpClientAdapter {
  RequestOptions? options;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    this.options = options;
    return ResponseBody.fromString(
      '{}',
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
