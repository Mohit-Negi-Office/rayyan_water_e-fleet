import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rayyan_driver/core/error/app_exception.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:rayyan_driver/features/auth/data/datasources/auth_token_local_data_source.dart';
import 'package:rayyan_driver/features/auth/data/models/auth_tokens_model.dart';
import 'package:rayyan_driver/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:rayyan_driver/features/auth/domain/entities/phone_number.dart';

class _MockRemote extends Mock implements AuthRemoteDataSource {}

class _MockTokens extends Mock implements AuthTokenLocalDataSource {}

const _phone = PhoneNumber.qatar('55876543');
const _tokens = AuthTokensModel(accessToken: 'a', refreshToken: 'r');

void main() {
  late _MockRemote remote;
  late _MockTokens tokens;
  late AuthRepositoryImpl repository;

  setUp(() {
    remote = _MockRemote();
    tokens = _MockTokens();
    repository = AuthRepositoryImpl(remote, tokens);
    when(
      () => tokens.save(
        accessToken: any(named: 'accessToken'),
        refreshToken: any(named: 'refreshToken'),
      ),
    ).thenAnswer((_) async {});
  });

  test('requestOtp sends the number in E.164 form', () async {
    when(() => remote.requestOtp(any())).thenAnswer((_) async {});
    expect(await repository.requestOtp(_phone), const Success<void>(null));
    verify(() => remote.requestOtp('+97455876543')).called(1);
  });

  test('verifyOtp keeps the tokens', () async {
    when(
      () => remote.verifyOtp(phone: '+97455876543', code: '2406'),
    ).thenAnswer((_) async => _tokens);
    expect(
      await repository.verifyOtp(_phone, '2406'),
      const Success<void>(null),
    );
    verify(() => tokens.save(accessToken: 'a', refreshToken: 'r')).called(1);
  });

  test('verifyOtp keeps the server code of a wrong OTP', () async {
    when(
      () => remote.verifyOtp(
        phone: any(named: 'phone'),
        code: any(named: 'code'),
      ),
    ).thenThrow(const ServerException('wrong', code: 'invalid_otp'));
    expect(
      await repository.verifyOtp(_phone, '0000'),
      const Err<void>(ServerFailure(code: 'invalid_otp')),
    );
    verifyNever(
      () => tokens.save(
        accessToken: any(named: 'accessToken'),
        refreshToken: any(named: 'refreshToken'),
      ),
    );
  });

  test('verifyOtp fails when the tokens cannot be kept', () async {
    when(
      () => remote.verifyOtp(
        phone: any(named: 'phone'),
        code: any(named: 'code'),
      ),
    ).thenAnswer((_) async => _tokens);
    when(
      () => tokens.save(
        accessToken: any(named: 'accessToken'),
        refreshToken: any(named: 'refreshToken'),
      ),
    ).thenThrow(const CacheException('locked'));
    expect(
      await repository.verifyOtp(_phone, '2406'),
      const Err<void>(CacheFailure()),
    );
  });

  test('logout forgets the tokens', () async {
    when(() => tokens.clear()).thenAnswer((_) async {});
    expect(await repository.logout(), const Success<void>(null));
    verify(() => tokens.clear()).called(1);
  });

  test('hasSession is true while a token is kept', () async {
    when(() => tokens.hasAccessToken()).thenAnswer((_) async => true);
    expect(await repository.hasSession(), const Success(true));
  });

  test('hasSession maps an unreadable store', () async {
    when(() => tokens.hasAccessToken()).thenThrow(const CacheException('x'));
    expect(await repository.hasSession(), const Err<bool>(CacheFailure()));
  });

  final cases = <AppException, Failure>{
    const NetworkException('offline'): const NetworkFailure(),
    const ServerException('boom'): const ServerFailure(),
    const ValidationException('bad', fieldErrors: {'email': 'taken'}):
        const ValidationFailure({'email': 'taken'}),
  };
  for (final MapEntry(key: exception, value: failure) in cases.entries) {
    test('requestOtp maps ${exception.runtimeType}', () async {
      when(() => remote.requestOtp(any())).thenThrow(exception);
      expect(await repository.requestOtp(_phone), Err<void>(failure));
    });
  }
}
