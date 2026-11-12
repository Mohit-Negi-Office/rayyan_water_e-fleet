import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/error/app_exception.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/error/result.dart';

void main() {
  group('guard', () {
    test('wraps the value in Success', () async {
      expect(await guard(() async => 42), const Success(42));
    });

    final cases = <AppException, Failure>{
      const NetworkException('offline'): const NetworkFailure(),
      const ServerException('boom', statusCode: 500, code: 'slot_unavailable'):
          const ServerFailure(code: 'slot_unavailable'),
      const UnauthorizedException('expired'): const UnauthorizedFailure(),
      const ValidationException('bad', fieldErrors: {'email': 'invalid'}):
          const ValidationFailure({'email': 'invalid'}),
      const CacheException('disk'): const CacheFailure(),
      const DeviceException('no gps'): const UnexpectedFailure(),
    };

    for (final MapEntry(key: exception, value: failure) in cases.entries) {
      test('maps ${exception.runtimeType} to ${failure.runtimeType}', () async {
        final result = await guard<int>(() async => throw exception);
        expect(result, Err<int>(failure));
      });
    }

    test('maps any other error to UnexpectedFailure', () async {
      final result = await guard<int>(() async => throw StateError('x'));
      expect(result, const Err<int>(UnexpectedFailure()));
    });
  });

  group('Failure equality', () {
    test('ServerFailure compares codes', () {
      expect(const ServerFailure(code: 'a'), isNot(const ServerFailure()));
    });

    test('ValidationFailure compares field errors', () {
      expect(
        const ValidationFailure({'a': '1'}),
        isNot(const ValidationFailure({'a': '2'})),
      );
    });
  });
}
