import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/widgets/buttons/app_button.dart';
import 'package:rayyan_driver/core/widgets/states/app_error_view.dart';

import '../../../helpers/pump_app.dart';

void main() {
  testWidgets('renders network copy and Retry calls back', (tester) async {
    var retries = 0;
    await tester.pumpApp(
      AppErrorView(failure: const NetworkFailure(), onRetry: () => retries++),
    );

    expect(find.text('No internet connection'), findsOneWidget);
    expect(find.byType(SnackBar), findsNothing);

    await tester.tap(find.byType(AppButton));
    expect(retries, 1);
  });

  testWidgets('hides Retry for non-retryable failures', (tester) async {
    await tester.pumpApp(
      AppErrorView(failure: const ValidationFailure({}), onRetry: () {}),
    );
    expect(find.byType(AppButton), findsNothing);
  });

  testWidgets('renders Arabic copy right-to-left', (tester) async {
    await tester.pumpApp(
      AppErrorView.compact(failure: const ServerFailure(), onRetry: () {}),
      locale: const Locale('ar'),
    );
    expect(find.text('إعادة المحاولة'), findsOneWidget);
    final direction = Directionality.of(tester.element(find.byType(AppButton)));
    expect(direction, TextDirection.rtl);
  });
}
