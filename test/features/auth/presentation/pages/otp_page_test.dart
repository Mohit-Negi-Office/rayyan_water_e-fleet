import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rayyan_driver/app/session/auth_state.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/utils/ticker.dart';
import 'package:rayyan_driver/core/widgets/buttons/app_button.dart';
import 'package:rayyan_driver/features/auth/domain/entities/auth_error_codes.dart';
import 'package:rayyan_driver/features/auth/domain/entities/phone_number.dart';
import 'package:rayyan_driver/features/auth/domain/usecases/request_otp.dart';
import 'package:rayyan_driver/features/auth/domain/usecases/verify_otp.dart';
import 'package:rayyan_driver/features/auth/presentation/bloc/otp_cubit.dart';
import 'package:rayyan_driver/features/auth/presentation/pages/otp_page.dart';

import '../../../../helpers/pump_app.dart';
import '../../../../helpers/session_scope.dart';

class _MockVerifyOtp extends Mock implements VerifyOtp {}

class _MockRequestOtp extends Mock implements RequestOtp {}

class _Still extends Ticker {
  const _Still();

  @override
  Stream<int> countdown(int seconds) => const Stream.empty();
}

const _phone = PhoneNumber.qatar('55876543');

AppButton _verify(WidgetTester tester) =>
    tester.widget<AppButton>(find.widgetWithText(AppButton, 'Verify'));

void main() {
  late _MockVerifyOtp verifyOtp;
  late SessionCubits session;

  setUpAll(
    () => registerFallbackValue(const VerifyOtpParams(phone: _phone, code: '')),
  );
  setUp(() {
    verifyOtp = _MockVerifyOtp();
    session = SessionCubits();
  });
  tearDown(() => session.close());

  Future<void> pump(WidgetTester tester) {
    final cubit = OtpCubit(verifyOtp, _MockRequestOtp(), const _Still(), _phone)
      ..start();
    addTearDown(cubit.close);
    return tester.pumpRouted(
      session.wrap(
        BlocProvider.value(
          value: cubit,
          child: const OtpView(phone: _phone),
        ),
      ),
    );
  }

  Future<void> enterCode(WidgetTester tester, String code) async {
    await tester.enterText(find.byType(TextField), code);
    await tester.pump();
  }

  testWidgets('shows the number, the countdown and empty boxes', (
    tester,
  ) async {
    await pump(tester);
    expect(find.text('Verify Mobile Number'), findsOneWidget);
    expect(find.text('Please enter the 4 digit OTP sent to'), findsOneWidget);
    expect(find.text('+974 55876543'), findsOneWidget);
    expect(find.text('EDIT'), findsOneWidget);
    expect(find.text('00:59'), findsOneWidget);
    expect(find.text('Resend'), findsNothing);
    expect(_verify(tester).onPressed, isNull);
  });

  testWidgets('fills the boxes and enables Verify', (tester) async {
    await pump(tester);
    await enterCode(tester, '2406');
    for (final digit in ['2', '4', '0', '6']) {
      expect(find.text(digit), findsOneWidget);
    }
    expect(_verify(tester).onPressed, isNotNull);
  });

  testWidgets('a wrong code shows "Incorrect OTP" in the form', (tester) async {
    when(() => verifyOtp(any())).thenAnswer(
      (_) async =>
          const Err<void>(ServerFailure(code: AuthErrorCodes.invalidOtp)),
    );
    await pump(tester);
    await enterCode(tester, '0000');
    await tester.tap(find.text('Verify'));
    await tester.pumpAndSettle();
    expect(find.text('Incorrect OTP'), findsOneWidget);
    expect(find.byType(SnackBar), findsNothing);
    expect(_verify(tester).onPressed, isNull);
  });

  testWidgets('a correct code signs the driver in', (tester) async {
    when(
      () => verifyOtp(any()),
    ).thenAnswer((_) async => const Success<void>(null));
    await pump(tester);
    await enterCode(tester, '2406');
    await tester.tap(find.text('Verify'));
    await tester.pumpAndSettle();
    expect(session.auth.state, const AuthState.authenticated());
  });
}
