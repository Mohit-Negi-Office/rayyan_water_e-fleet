import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/network/interceptors/api_debug_log_interceptor.dart';

void main() {
  test('prints the request and the response', () async {
    final logs = <String>[];
    final adapter = _CaptureAdapter();
    final dio = Dio(BaseOptions(baseUrl: 'https://api-dev.rayyanwater.com'));
    dio.httpClientAdapter = adapter;
    dio.interceptors.add(ApiDebugLogInterceptor(write: logs.add));

    await dio.post<dynamic>(
      '/user-service/v1/otp/send',
      data: const {
        'countryCode': '974',
        'phoneNumber': '55876543',
        'type': 'LOGIN_DRIVER',
      },
      options: Options(
        headers: const {
          'device-id': 'device-123',
          'Authorization': 'Bearer static',
        },
      ),
    );

    expect(logs, hasLength(2));
    expect(logs[0], contains('API REQUEST'));
    expect(
      logs[0],
      contains('https://api-dev.rayyanwater.com/user-service/v1/otp/send'),
    );
    expect(logs[0], contains('"phoneNumber": "55876543"'));
    expect(logs[0], contains('device-123'));
    expect(logs[1], contains('API RESPONSE'));
    expect(logs[1], contains('Status: 200'));
    expect(logs[1], contains('"message": "OTP sent"'));
  });

  test('prints an error response', () async {
    final logs = <String>[];
    final adapter = _CaptureAdapter()
      ..statusCode = 400
      ..body = '{"message":"rejected"}';
    final dio = Dio(BaseOptions(baseUrl: 'https://api-dev.rayyanwater.com'));
    dio.httpClientAdapter = adapter;
    dio.interceptors.add(ApiDebugLogInterceptor(write: logs.add));

    await expectLater(
      dio.post<dynamic>('/user-service/v1/otp/send'),
      throwsA(isA<DioException>()),
    );

    expect(logs[1], contains('Status: 400'));
    expect(logs[1], contains('"message": "rejected"'));
  });
}

final class _CaptureAdapter implements HttpClientAdapter {
  int statusCode = 200;
  String body = '{"message":"OTP sent"}';

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
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
