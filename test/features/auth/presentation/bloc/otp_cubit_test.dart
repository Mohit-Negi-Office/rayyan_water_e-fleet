import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/utils/ticker.dart';
import 'package:rayyan_driver/features/auth/domain/entities/auth_error_codes.dart';
import 'package:rayyan_driver/features/auth/domain/entities/phone_number.dart';
import 'package:rayyan_driver/features/auth/domain/usecases/request_otp.dart';
import 'package:rayyan_driver/features/auth/domain/usecases/verify_otp.dart';
import 'package:rayyan_driver/features/auth/presentation/bloc/otp_cubit.dart';
import 'package:rayyan_driver/features/auth/presentation/bloc/otp_state.dart';

class _MockVerifyOtp extends Mock implements VerifyOtp {}

class _MockRequestOtp extends Mock implements RequestOtp {}

class _MockTicker extends Mock implements Ticker {}

const _phone = PhoneNumber.qatar('55876543');
const _wrongOtp = ServerFailure(code: AuthErrorCodes.invalidOtp);

void main() {
  late _MockVerifyOtp verifyOtp;
  late _MockRequestOtp requestOtp;
  late _MockTicker ticker;
  late StreamController<int> ticks;

  setUpAll(() {
    registerFallbackValue(const VerifyOtpParams(phone: _phone, code: ''));
    registerFallbackValue(_phone);
  });

  setUp(() {
    verifyOtp = _MockVerifyOtp();
    requestOtp = _MockRequestOtp();
    ticker = _MockTicker();
    ticks = StreamController<int>.broadcast();
    when(() => ticker.countdown(any())).thenAnswer((_) => ticks.stream);
  });
  tearDown(() => ticks.close());

  OtpCubit build() => OtpCubit(verifyOtp, requestOtp, ticker, _phone);

  group('OtpState', () {
    test('verify needs every digit and no unresolved failure', () {
      expect(const OtpState(phone: _phone, code: '240').canVerify, isFalse);
      expect(const OtpState(phone: _phone, code: '2406').canVerify, isTrue);
      expect(
        const OtpState(
          phone: _phone,
          code: '2406',
          failure: _wrongOtp,
        ).canVerify,
        isFalse,
      );
    });

    test('resend waits for the countdown', () {
      expect(const OtpState(phone: _phone, secondsLeft: 3).canResend, isFalse);
      expect(const OtpState(phone: _phone).canResend, isTrue);
    });

    test('only a wrong code reads as "Incorrect OTP"', () {
      expect(
        const OtpState(phone: _phone, failure: _wrongOtp).isIncorrect,
        isTrue,
      );
      expect(
        const OtpState(phone: _phone, failure: NetworkFailure()).isIncorrect,
        isFalse,
      );
    });
  });

  blocTest<OtpCubit, OtpState>(
    'start counts down to Resend',
    build: build,
    act: (cubit) async {
      cubit.start();
      ticks
        ..add(58)
        ..add(0);
      await Future<void>.delayed(Duration.zero);
    },
    expect: () => const [
      OtpState(phone: _phone, secondsLeft: 59),
      OtpState(phone: _phone, secondsLeft: 58),
      OtpState(phone: _phone),
    ],
    verify: (_) => verify(() => ticker.countdown(59)).called(1),
  );

  blocTest<OtpCubit, OtpState>(
    'editing the code clears "Incorrect OTP"',
    build: build,
    seed: () => const OtpState(phone: _phone, code: '2406', failure: _wrongOtp),
    act: (cubit) => cubit.codeChanged('240'),
    expect: () => const [OtpState(phone: _phone, code: '240')],
  );

  blocTest<OtpCubit, OtpState>(
    'a correct code verifies the driver',
    build: () {
      when(
        () => verifyOtp(any()),
      ).thenAnswer((_) async => const Success<void>(null));
      return build();
    },
    seed: () => const OtpState(phone: _phone, code: '2406'),
    act: (cubit) => cubit.verify(),
    expect: () => const [
      OtpState(phone: _phone, code: '2406', isVerifying: true),
      OtpState(phone: _phone, code: '2406', isVerified: true),
    ],
    verify: (_) => verify(
      () => verifyOtp(const VerifyOtpParams(phone: _phone, code: '2406')),
    ).called(1),
  );

  blocTest<OtpCubit, OtpState>(
    'a wrong code shows "Incorrect OTP"',
    build: () {
      when(
        () => verifyOtp(any()),
      ).thenAnswer((_) async => const Err<void>(_wrongOtp));
      return build();
    },
    seed: () => const OtpState(phone: _phone, code: '2406'),
    act: (cubit) => cubit.verify(),
    expect: () => const [
      OtpState(phone: _phone, code: '2406', isVerifying: true),
      OtpState(phone: _phone, code: '2406', failure: _wrongOtp),
    ],
  );

  blocTest<OtpCubit, OtpState>(
    'verify waits for every digit',
    build: build,
    seed: () => const OtpState(phone: _phone, code: '24'),
    act: (cubit) => cubit.verify(),
    expect: () => <OtpState>[],
  );

  blocTest<OtpCubit, OtpState>(
    'resend sends a new code, clears the boxes and restarts the countdown',
    build: () {
      when(
        () => requestOtp(any()),
      ).thenAnswer((_) async => const Success<void>(null));
      return build();
    },
    seed: () => const OtpState(phone: _phone, code: '2406', failure: _wrongOtp),
    act: (cubit) => cubit.resend(),
    expect: () => const [
      OtpState(
        phone: _phone,
        code: '2406',
        failure: _wrongOtp,
        isResending: true,
      ),
      OtpState(phone: _phone, secondsLeft: 59),
    ],
    verify: (_) => verify(() => requestOtp(_phone)).called(1),
  );

  blocTest<OtpCubit, OtpState>(
    'a failed resend keeps the failure',
    build: () {
      when(
        () => requestOtp(any()),
      ).thenAnswer((_) async => const Err<void>(NetworkFailure()));
      return build();
    },
    seed: () => const OtpState(phone: _phone),
    act: (cubit) => cubit.resend(),
    expect: () => const [
      OtpState(phone: _phone, isResending: true),
      OtpState(phone: _phone, failure: NetworkFailure()),
    ],
  );

  blocTest<OtpCubit, OtpState>(
    'resend is ignored during the countdown',
    build: build,
    seed: () => const OtpState(phone: _phone, secondsLeft: 30),
    act: (cubit) => cubit.resend(),
    expect: () => <OtpState>[],
  );
}
