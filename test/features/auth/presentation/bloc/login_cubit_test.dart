import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/auth/domain/entities/auth_error_codes.dart';
import 'package:rayyan_driver/features/auth/domain/entities/phone_number.dart';
import 'package:rayyan_driver/features/auth/domain/usecases/request_otp.dart';
import 'package:rayyan_driver/features/auth/presentation/bloc/login_cubit.dart';
import 'package:rayyan_driver/features/auth/presentation/bloc/login_state.dart';

class _MockRequestOtp extends Mock implements RequestOtp {}

void main() {
  late _MockRequestOtp requestOtp;

  setUpAll(() => registerFallbackValue(const PhoneNumber.qatar('')));
  setUp(() => requestOtp = _MockRequestOtp());

  LoginCubit build() => LoginCubit(requestOtp);

  group('LoginState', () {
    test('starts empty and cannot continue', () {
      final state = build().state;
      expect(state.digits, isEmpty);
      expect(state.canContinue, isFalse);
      expect(state.isNumberIncorrect, isFalse);
    });

    test('a partial number shows no error and cannot continue', () {
      const state = LoginState(digits: '5587');
      expect(state.isNumberIncorrect, isFalse);
      expect(state.canContinue, isFalse);
    });

    test('a full invalid number is incorrect', () {
      const state = LoginState(digits: '25628997');
      expect(state.isNumberIncorrect, isTrue);
      expect(state.canContinue, isFalse);
    });

    test('a valid number can continue', () {
      expect(const LoginState(digits: '55876543').canContinue, isTrue);
    });

    test('a number the server rejects is incorrect', () {
      const state = LoginState(
        digits: '55876543',
        failure: ServerFailure(code: AuthErrorCodes.invalidPhone),
      );
      expect(state.isNumberIncorrect, isTrue);
      expect(state.otherFailure, isNull);
      expect(state.canContinue, isFalse);
    });

    test('other failures are shown separately and allow a retry', () {
      const state = LoginState(digits: '55876543', failure: NetworkFailure());
      expect(state.isNumberIncorrect, isFalse);
      expect(state.otherFailure, const NetworkFailure());
      expect(state.canContinue, isTrue);
    });
  });

  blocTest<LoginCubit, LoginState>(
    'typing clears an earlier failure',
    build: build,
    seed: () => const LoginState(digits: '5587654', failure: NetworkFailure()),
    act: (cubit) => cubit.digitsChanged('55876543'),
    expect: () => [const LoginState(digits: '55876543')],
  );

  blocTest<LoginCubit, LoginState>(
    'submit sends the OTP and counts the request',
    build: () {
      when(
        () => requestOtp(any()),
      ).thenAnswer((_) async => const Success<void>(null));
      return build();
    },
    seed: () => const LoginState(digits: '55876543'),
    act: (cubit) => cubit.submit(),
    expect: () => [
      const LoginState(digits: '55876543', isSubmitting: true),
      const LoginState(digits: '55876543', otpSentCount: 1),
    ],
    verify: (_) =>
        verify(() => requestOtp(const PhoneNumber.qatar('55876543'))).called(1),
  );

  blocTest<LoginCubit, LoginState>(
    'submit keeps the failure',
    build: () {
      when(
        () => requestOtp(any()),
      ).thenAnswer((_) async => const Err<void>(NetworkFailure()));
      return build();
    },
    seed: () => const LoginState(digits: '55876543'),
    act: (cubit) => cubit.submit(),
    expect: () => [
      const LoginState(digits: '55876543', isSubmitting: true),
      const LoginState(digits: '55876543', failure: NetworkFailure()),
    ],
  );

  blocTest<LoginCubit, LoginState>(
    'submit does nothing for an incorrect number',
    build: build,
    seed: () => const LoginState(digits: '25628997'),
    act: (cubit) => cubit.submit(),
    expect: () => <LoginState>[],
    verify: (_) => verifyNever(() => requestOtp(any())),
  );
}
