import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/error/app_exception.dart';
import 'package:rayyan_driver/core/network/dio_exception_mapper.dart';

DioException _badResponse(int status, [Object? data]) {
  final options = RequestOptions(path: '/x');
  return DioException.badResponse(
    statusCode: status,
    requestOptions: options,
    response: Response<Object?>(
      requestOptions: options,
      statusCode: status,
      data: data,
    ),
  );
}

void main() {
  final options = RequestOptions(path: '/x');

  test('timeouts and connection errors become NetworkException', () {
    for (final type in [
      DioExceptionType.connectionTimeout,
      DioExceptionType.sendTimeout,
      DioExceptionType.receiveTimeout,
      DioExceptionType.connectionError,
    ]) {
      final e = DioException(requestOptions: options, type: type);
      expect(e.toAppException(), isA<NetworkException>(), reason: '$type');
    }
  });

  test('401 becomes UnauthorizedException', () {
    expect(_badResponse(401).toAppException(), isA<UnauthorizedException>());
  });

  test('422 becomes ValidationException with field errors', () {
    final e = _badResponse(422, {
      'errors': {
        'email': ['is invalid', 'is taken'],
        'name': 'is required',
      },
    }).toAppException();
    expect(e, isA<ValidationException>());
    expect((e as ValidationException).fieldErrors, {
      'email': 'is invalid\nis taken',
      'name': 'is required',
    });
  });

  test('a rejected OTP keeps OTP_INVALID', () {
    final error = _badResponse(400, {
      'code': 400,
      'status': 'BAD_REQUEST',
      'timestamp': 1794816703130,
      'data': null,
      'error': {
        'message': 'The code you entered is not valid. Please try again.',
        'type': 'OTP_INVALID',
        'data': null,
      },
    }).toAppException();

    expect(error, isA<ServerException>());
    final server = error as ServerException;
    expect(server.statusCode, 400);
    expect(server.code, 'OTP_INVALID');
  });

  test('an error envelope keeps the error type', () {
    final error = _badResponse(400, {
      'code': 400,
      'status': 'BAD_REQUEST',
      'timestamp': 1794810656970,
      'data': null,
      'error': {'type': 'INVALID_AUTHORIZATION_HEADER', 'data': null},
    }).toAppException();

    expect(error, isA<ServerException>());
    final server = error as ServerException;
    expect(server.statusCode, 400);
    expect(server.code, 'INVALID_AUTHORIZATION_HEADER');
  });

  test('other statuses become ServerException with status and code', () {
    final e = _badResponse(409, {'code': 'slot_unavailable'}).toAppException();
    expect(e, isA<ServerException>());
    final server = e as ServerException;
    expect(server.statusCode, 409);
    expect(server.code, 'slot_unavailable');
  });

  test('unknown errors become ServerException', () {
    final e = DioException(requestOptions: options);
    expect(e.toAppException(), isA<ServerException>());
  });
}
