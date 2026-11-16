import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/network/models/api_response_model.dart';

void main() {
  const errorJson = {
    'code': 400,
    'status': 'BAD_REQUEST',
    'timestamp': 1794810656970,
    'data': null,
    'error': {'type': 'INVALID_AUTHORIZATION_HEADER', 'data': null},
  };

  const successJson = {
    'code': 200,
    'status': 'OK',
    'timestamp': 1794810656970,
    'data': {'sent': true},
    'error': null,
  };

  test('reads an error envelope', () {
    final model = ApiResponseModel.fromJson(errorJson);

    expect(model.code, 400);
    expect(model.status, 'BAD_REQUEST');
    expect(model.timestamp, 1794810656970);
    expect(model.data, isNull);
    expect(model.hasError, isTrue);
    expect(model.error?.type, 'INVALID_AUTHORIZATION_HEADER');
    expect(model.error?.data, isNull);
  });

  test('reads a success envelope with a data object', () {
    final model = ApiResponseModel.fromJson(successJson);

    expect(model.code, 200);
    expect(model.data, {'sent': true});
    expect(model.error, isNull);
    expect(model.hasError, isFalse);
  });

  test('round-trips the error envelope', () {
    expect(ApiResponseModel.fromJson(errorJson).toJson(), errorJson);
  });

  test('round-trips the success envelope', () {
    expect(ApiResponseModel.fromJson(successJson).toJson(), successJson);
  });

  test('ignores a body that is not this envelope', () {
    expect(ApiResponseModel.tryFrom({'code': 'slot_unavailable'}), isNull);
    expect(ApiResponseModel.tryFrom('nope'), isNull);
  });
}
