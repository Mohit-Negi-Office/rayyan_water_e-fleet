import 'package:alice_dio/alice_dio_adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/debug/api_log_inspector.dart';

void main() {
  test('records Dio traffic only when logs are enabled', () {
    final dio = Dio();
    final alice = ApiLogInspector.create();

    ApiLogInspector.attach(dio, enabled: false, alice: alice);
    ApiLogInspector.attach(dio, enabled: true, alice: null);

    expect(dio.interceptors.whereType<AliceDioAdapter>(), isEmpty);

    ApiLogInspector.attach(dio, enabled: true, alice: alice);

    expect(dio.interceptors.whereType<AliceDioAdapter>(), hasLength(1));
  });
}
