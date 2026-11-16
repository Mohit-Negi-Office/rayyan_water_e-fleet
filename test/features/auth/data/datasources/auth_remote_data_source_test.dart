import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/error/app_exception.dart';
import 'package:rayyan_driver/core/network/api_client.dart';
import 'package:rayyan_driver/core/network/api_endpoints.dart';
import 'package:rayyan_driver/core/network/app_config.dart';
import 'package:rayyan_driver/core/network/basic_authorization.dart';
import 'package:rayyan_driver/core/network/bearer_authorization.dart';
import 'package:rayyan_driver/core/network/device_id_store.dart';
import 'package:rayyan_driver/core/network/device_type.dart';
import 'package:rayyan_driver/core/network/interceptors/bearer_auth_interceptor.dart';
import 'package:rayyan_driver/core/network/interceptors/device_id_interceptor.dart';
import 'package:rayyan_driver/core/storage/secure_storage.dart';
import 'package:rayyan_driver/core/storage/storage_keys.dart';
import 'package:rayyan_driver/features/auth/data/datasources/auth_remote_data_source.dart';

import '../../../../helpers/fixture.dart';

void main() {
  late _CaptureAdapter adapter;
  late AuthRemoteDataSourceImpl source;

  setUp(() {
    adapter = _CaptureAdapter();
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api-dev.rayyanwater.com',
        contentType: Headers.jsonContentType,
        headers: const {Headers.acceptHeader: Headers.jsonContentType},
      ),
    );
    dio.httpClientAdapter = adapter;
    dio.interceptors.add(DeviceIdInterceptor(const _FixedDeviceId()));
    dio.interceptors.add(
      BearerAuthInterceptor(
        _MemoryStorage({StorageKeys.accessToken: 'session-token'}),
      ),
    );
    source = AuthRemoteDataSourceImpl(ApiClient(dio), const _FixedDeviceType());
  });

  test('posts the login otp payload', () async {
    await source.requestOtp('55876543');
    final options = adapter.options!;

    expect(options.method, 'POST');
    expect(
      options.uri.toString(),
      'https://api-dev.rayyanwater.com/user-service/v1/otp/send',
    );
    expect(options.data, {
      'countryCode': '974',
      'phoneNumber': '55876543',
      'type': 'LOGIN_DRIVER',
    });
    expect(options.headers['device-id'], 'device-123');
    expect(
      options.headers[BasicAuthorization.header],
      BasicAuthorization.value(
        username: AppConfig.basicAuthUsername,
        password: AppConfig.basicAuthPassword,
      ),
    );
    expect(options.headers[Headers.acceptHeader], Headers.jsonContentType);
  });

  test('accepts an empty success body', () async {
    adapter.body = '';
    await source.requestOtp('55876543');
  });

  test('posts the verify otp payload and reads the session', () async {
    adapter.body = jsonEncode(fixture('verify_otp_success.json'));

    final result = await source.verifyOtp(phone: '55876543', code: '2406');
    final options = adapter.options!;

    expect(result.session.token, 'session-token');
    expect(result.session.refreshToken, 'refresh-token');
    expect(result.session.sessionId, 'sess_01drv');
    expect(result.driver['driverCode'], 'DRV1007');
    expect(options.method, 'POST');
    expect(
      options.uri.toString(),
      'https://api-dev.rayyanwater.com/user-service/v1/otp/verify',
    );
    expect(options.data, {
      'countryCode': '974',
      'phoneNumber': '55876543',
      'otp': '2406',
      'type': 'LOGIN_DRIVER',
    });
    expect(options.headers['device-id'], 'device-123');
    expect(options.headers[ApiEndpoints.deviceTypeHeader], 'ANDROID');
    expect(options.headers[ApiEndpoints.aesKeyHeader], ApiEndpoints.aesKey);
    expect(
      options.headers[ApiEndpoints.deviceTokenHeader],
      ApiEndpoints.deviceToken,
    );
    expect(
      options.headers[BasicAuthorization.header],
      BasicAuthorization.value(
        username: AppConfig.basicAuthUsername,
        password: AppConfig.basicAuthPassword,
      ),
    );
  });

  test('throws when verify otp has no session', () {
    adapter.body = '''
{
  "status": "success",
  "code": 200,
  "timestamp": 1739289600000,
  "data": {},
  "error": null
}
''';

    expect(
      source.verifyOtp(phone: '55876543', code: '2406'),
      throwsA(isA<ServerException>()),
    );
  });

  test('posts an empty logout with the bearer token', () async {
    adapter.body = '';
    await source.logout();
    final options = adapter.options!;

    expect(options.method, 'POST');
    expect(
      options.uri.toString(),
      'https://api-dev.rayyanwater.com${ApiEndpoints.driverLogout}',
    );
    expect(options.data, '');
    expect(options.headers['device-id'], 'device-123');
    expect(options.headers[Headers.acceptHeader], Headers.jsonContentType);
    expect(
      options.headers[BasicAuthorization.header],
      BearerAuthorization.value('session-token'),
    );
  });

  test('throws when the server rejects the number', () {
    adapter.statusCode = 400;
    adapter.body = '{"code":"invalid_phone"}';

    expect(
      source.requestOtp('55876543'),
      throwsA(
        isA<ServerException>().having(
          (error) => error.code,
          'code',
          'invalid_phone',
        ),
      ),
    );
  });
}

final class _FixedDeviceId implements DeviceIdStore {
  const _FixedDeviceId();

  @override
  Future<String> fetch() async => 'device-123';
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

final class _FixedDeviceType implements DeviceTypeReader {
  const _FixedDeviceType();

  @override
  String read() => 'ANDROID';
}

final class _CaptureAdapter implements HttpClientAdapter {
  RequestOptions? options;
  int statusCode = 200;
  String body = '{"ok":true}';

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    this.options = options;
    return ResponseBody.fromString(
      body,
      statusCode,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
