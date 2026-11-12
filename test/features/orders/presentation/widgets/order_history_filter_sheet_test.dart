import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/widgets/buttons/app_button.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_filter.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/order_history_filter_sheet.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  AppButton button(WidgetTester tester, String label) =>
      tester.widget<AppButton>(find.widgetWithText(AppButton, label));

  testWidgets('Reset and Apply stay off until a range is checked', (
    tester,
  ) async {
    await tester.pumpRouted(const Scaffold(body: OrderHistoryFilterSheet()));

    expect(button(tester, 'Reset').onPressed, isNull);
    expect(button(tester, 'Apply').onPressed, isNull);

    await tester.tap(find.text('Last 30 Days'));
    await tester.pump();

    expect(button(tester, 'Reset').onPressed, isNotNull);
    expect(button(tester, 'Apply').onPressed, isNotNull);
  });

  testWidgets('checking the same range again turns the actions off', (
    tester,
  ) async {
    await tester.pumpRouted(const Scaffold(body: OrderHistoryFilterSheet()));

    await tester.tap(find.text('Last 6 Months'));
    await tester.pump();
    await tester.tap(find.text('Last 6 Months'));
    await tester.pump();

    expect(button(tester, 'Apply').onPressed, isNull);
  });

  testWidgets('a range already applied starts with the actions on', (
    tester,
  ) async {
    await tester.pumpRouted(
      const Scaffold(
        body: OrderHistoryFilterSheet(initial: OrderDateRange.last1Year),
      ),
    );

    expect(button(tester, 'Apply').onPressed, isNotNull);
    expect(find.text('Date Range'), findsOneWidget);
  });
}
