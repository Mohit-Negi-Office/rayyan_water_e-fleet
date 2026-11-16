import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/error/app_exception.dart';
import 'package:rayyan_driver/core/network/api_client.dart';
import 'package:rayyan_driver/core/network/api_endpoints.dart';
import 'package:rayyan_driver/features/profile/data/datasources/profile_remote_data_source.dart';

import '../../../../helpers/fixture.dart';

void main() {
  late _CaptureAdapter adapter;
  late ProfileRemoteDataSourceImpl source;

  setUp(() {
    adapter = _CaptureAdapter();
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api-dev.rayyanwater.com',
        headers: const {Headers.acceptHeader: Headers.jsonContentType},
      ),
    );
    dio.httpClientAdapter = adapter;
    source = ProfileRemoteDataSourceImpl(ApiClient(dio));
  });

  test('gets the signed-in driver profile', () async {
    adapter.body = jsonEncode(fixture('driver_profile_success.json'));

    final driver = await source.requestProfile();

    expect(adapter.options?.method, 'GET');
    expect(
      adapter.options?.uri.toString(),
      'https://api-dev.rayyanwater.com${ApiEndpoints.profile}',
    );
    expect(
      adapter.options?.headers[Headers.acceptHeader],
      Headers.jsonContentType,
    );
    expect(driver['driverCode'], 'DRV1007');
    expect(driver['licenseNumber'], 'QL-28400322');
  });

  test('throws when the profile has no driver', () {
    adapter.body =
        '{"code":200,"status":"OK","timestamp":1,"data":{},"error":null}';

    expect(source.requestProfile(), throwsA(isA<ServerException>()));
  });
}

final class _CaptureAdapter implements HttpClientAdapter {
  RequestOptions? options;
  String body = '{}';

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    this.options = options;
    return ResponseBody.fromString(
      body,
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
