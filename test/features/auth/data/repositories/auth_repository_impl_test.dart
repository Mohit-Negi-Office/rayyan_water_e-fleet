import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rayyan_driver/core/error/app_exception.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:rayyan_driver/features/auth/data/datasources/auth_token_local_data_source.dart';
import 'package:rayyan_driver/features/auth/data/models/auth_session_model.dart';
import 'package:rayyan_driver/features/auth/data/models/verify_otp_result_model.dart';
import 'package:rayyan_driver/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:rayyan_driver/features/auth/domain/entities/phone_number.dart';

class _MockRemote extends Mock implements AuthRemoteDataSource {}

class _MockTokens extends Mock implements AuthTokenLocalDataSource {}

const _phone = PhoneNumber.qatar('55876543');
const _session = AuthSessionModel(
  sessionId: 'sess',
  token: 'a',
  publicKey: 'pk',
  refreshToken: 'r',
);
const _driver = {'name': 'Suresh Nair', 'driverCode': 'DRV1007'};
const _result = VerifyOtpResultModel(session: _session, driver: _driver);

void main() {
  late _MockRemote remote;
  late _MockTokens tokens;
  late AuthRepositoryImpl repository;

  setUpAll(() {
    registerFallbackValue(_session);
    registerFallbackValue(<String, dynamic>{});
  });

  setUp(() {
    remote = _MockRemote();
    tokens = _MockTokens();
    repository = AuthRepositoryImpl(remote, tokens);
    when(
      () => tokens.save(
        session: any(named: 'session'),
        driver: any(named: 'driver'),
      ),
    ).thenAnswer((_) async {});
  });

  test('requestOtp sends the digits the driver typed', () async {
    when(() => remote.requestOtp(any())).thenAnswer((_) async {});
    expect(await repository.requestOtp(_phone), const Success<void>(null));
    verify(() => remote.requestOtp('55876543')).called(1);
  });

  test('verifyOtp keeps the session and the driver', () async {
    when(
      () => remote.verifyOtp(phone: '55876543', code: '2406'),
    ).thenAnswer((_) async => _result);
    expect(
      await repository.verifyOtp(_phone, '2406'),
      const Success<void>(null),
    );
    verify(() => tokens.save(session: _session, driver: _driver)).called(1);
  });

  test('verifyOtp keeps the server code of a wrong OTP', () async {
    when(
      () => remote.verifyOtp(
        phone: any(named: 'phone'),
        code: any(named: 'code'),
      ),
    ).thenThrow(const ServerException('wrong', code: 'OTP_INVALID'));
    expect(
      await repository.verifyOtp(_phone, '0000'),
      const Err<void>(ServerFailure(code: 'OTP_INVALID')),
    );
    verifyNever(
      () => tokens.save(
        session: any(named: 'session'),
        driver: any(named: 'driver'),
      ),
    );
  });

  test('verifyOtp fails when the session cannot be kept', () async {
    when(
      () => remote.verifyOtp(
        phone: any(named: 'phone'),
        code: any(named: 'code'),
      ),
    ).thenAnswer((_) async => _result);
    when(
      () => tokens.save(
        session: any(named: 'session'),
        driver: any(named: 'driver'),
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
