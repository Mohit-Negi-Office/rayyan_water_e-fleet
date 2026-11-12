import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rayyan_driver/app/router/app_routes.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/widgets/buttons/app_button.dart';
import 'package:rayyan_driver/core/widgets/feedback/app_inline_banner.dart';
import 'package:rayyan_driver/features/auth/domain/entities/phone_number.dart';
import 'package:rayyan_driver/features/auth/domain/usecases/request_otp.dart';
import 'package:rayyan_driver/features/auth/presentation/bloc/login_cubit.dart';
import 'package:rayyan_driver/features/auth/presentation/pages/login_page.dart';

import '../../../../helpers/pump_app.dart';

class _MockRequestOtp extends Mock implements RequestOtp {}

AppButton _continue(WidgetTester tester) =>
    tester.widget<AppButton>(find.widgetWithText(AppButton, 'Continue'));

void main() {
  late _MockRequestOtp requestOtp;

  setUpAll(() => registerFallbackValue(const PhoneNumber.qatar('')));
  setUp(() {
    requestOtp = _MockRequestOtp();
    when(
      () => requestOtp(any()),
    ).thenAnswer((_) async => const Success<void>(null));
  });

  Future<void> pump(WidgetTester tester, {Locale locale = const Locale('en')}) {
    final cubit = LoginCubit(requestOtp);
    addTearDown(cubit.close);
    return tester.pumpRouted(
      BlocProvider.value(value: cubit, child: const LoginView()),
      locale: locale,
      extraRoutes: [
        GoRoute(
          name: AppRoutes.otp.name,
          path: '/otp',
          builder: (_, state) {
            final query = state.uri.queryParameters;
            return Text('otp ${query['phone']}');
          },
        ),
      ],
    );
  }

  testWidgets('shows the empty form with Continue disabled', (tester) async {
    await pump(tester);
    expect(find.text('Enter Mobile Number'), findsOneWidget);
    expect(find.text('Login with a valid local Mobile Number'), findsOneWidget);
    expect(find.text('+974'), findsOneWidget);
    expect(find.text('Mobile Number'), findsOneWidget);
    expect(find.text('Need Help?'), findsOneWidget);
    expect(find.text('Contact Us'), findsOneWidget);
    expect(find.text('Or Login With'), findsNothing);
    expect(_continue(tester).onPressed, isNull);
  });

  testWidgets('flags a full number that is not a Qatar mobile', (tester) async {
    await pump(tester);
    await tester.enterText(find.byType(TextFormField), '25628997');
    await tester.pump();
    expect(find.text('Incorrect Number'), findsOneWidget);
    expect(_continue(tester).onPressed, isNull);
  });

  testWidgets('limits the number to 8 digits', (tester) async {
    await pump(tester);
    await tester.enterText(find.byType(TextFormField), '5587654321');
    await tester.pump();
    expect(find.text('55876543'), findsOneWidget);
  });

  testWidgets('Continue sends the OTP and opens the OTP step', (tester) async {
    await pump(tester);
    await tester.enterText(find.byType(TextFormField), '55876543');
    await tester.pump();
    expect(find.text('Incorrect Number'), findsNothing);
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(find.text('otp +97455876543'), findsOneWidget);
  });

  testWidgets('a failed request shows in the form, not a SnackBar', (
    tester,
  ) async {
    when(
      () => requestOtp(any()),
    ).thenAnswer((_) async => const Err<void>(NetworkFailure()));
    await pump(tester);
    await tester.enterText(find.byType(TextFormField), '55876543');
    await tester.pump();
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(find.byType(AppInlineBanner), findsOneWidget);
    expect(find.byType(SnackBar), findsNothing);
  });

  testWidgets('Arabic keeps the number left-to-right', (tester) async {
    await pump(tester, locale: const Locale('ar'));
    expect(find.text('أدخل رقم الجوال'), findsOneWidget);
    final direction = tester.widget<Directionality>(
      find
          .ancestor(
            of: find.text('+974'),
            matching: find.byType(Directionality),
          )
          .first,
    );
    expect(direction.textDirection, TextDirection.ltr);
  });
}
