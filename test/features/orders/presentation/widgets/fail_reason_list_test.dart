import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/theme/app_typography.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/features/orders/domain/entities/fail_reason.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/fail_reason_list.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  testWidgets('the selected reason is regular black; others stay light gray', (
    tester,
  ) async {
    await tester.pumpApp(
      FailReasonList(
        selected: FailReason.customerNotAvailable,
        onSelected: (_) {},
        onNoteChanged: (_) {},
      ),
    );

    final context = tester.element(find.text('Customer not available'));
    final selected = tester.widget<Text>(find.text('Customer not available'));
    final other = tester.widget<Text>(find.text('Wrong address provided'));

    expect(selected.style?.fontWeight, AppTypography.regular);
    expect(selected.style?.fontSize, 14);
    expect(selected.style?.height, 20 / 14);
    expect(selected.style?.color, context.colors.textPrimary);

    expect(other.style?.fontWeight, AppTypography.light);
    expect(other.style?.color, context.colors.textSecondary);
  });
}
