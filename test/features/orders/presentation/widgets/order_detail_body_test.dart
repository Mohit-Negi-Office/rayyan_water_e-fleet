import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/theme/app_typography.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/buttons/app_square_icon_button.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_status.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_detail.dart';
import 'package:rayyan_driver/features/orders/domain/entities/payment_status.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/order_detail_body.dart';

import '../../../../helpers/pump_app.dart';

OrderDetail _order({
  DeliveryStatus status = DeliveryStatus.reassigned,
  String? reason = 'Not well today',
}) => OrderDetail(
  id: '71864586927',
  number: '71864586927',
  status: status,
  payment: PaymentStatus.paid,
  slotStart: DateTime(2026, 6, 24, 8),
  slotEnd: DateTime(2026, 6, 24, 12),
  assignedAt: DateTime(2026, 6, 24, 5),
  items: const [
    OrderItem(
      name: 'Glass Still Water',
      volumeMl: 750,
      bottles: 12,
      quantity: 1,
    ),
  ],
  location: const DeliveryLocation(
    recipient: 'Ahmed Al-Thani',
    address: '24, Al-Zaeden P.O. Box 1234, Al Khor QATAR',
    latitude: 25.68,
    longitude: 51.5,
  ),
  customerName: 'Firoz Ahmed',
  customerPhone: '+97455876543',
  totalMinor: 17000,
  specialInstruction: 'Please Provide chilled water, Thank You',
  reason: reason,
);

void main() {
  testWidgets('a re-assigned order shows the reason and no actions', (
    tester,
  ) async {
    await tester.pumpApp(OrderDetailBody(order: _order()));

    expect(find.text('Reason for reassign'), findsOneWidget);
    expect(find.text('Not well today'), findsOneWidget);
    expect(
      tester.getTopLeft(find.text('Reason for reassign')).dy,
      lessThan(tester.getTopLeft(find.text('Order Detail')).dy),
    );

    final context = tester.element(find.text('Not well today'));
    final reason = tester.widget<Text>(find.text('Not well today'));
    expect(reason.style?.fontSize, 16);
    expect(reason.style?.fontWeight, AppTypography.light);
    expect(reason.style?.color, context.colors.textPrimary);

    expect(find.text('Re-Assign'), findsNothing);
    expect(find.text('Fail Delivery'), findsNothing);
    expect(find.text('Contact Support'), findsNothing);
    expect(find.byType(AppSquareIconMark), findsNothing);
  });

  testWidgets('a blank reason stays hidden', (tester) async {
    await tester.pumpApp(OrderDetailBody(order: _order(reason: '   ')));

    expect(find.text('Reason for reassign'), findsNothing);
  });

  testWidgets('an active order does not show a reassign reason', (
    tester,
  ) async {
    await tester.pumpApp(
      OrderDetailBody(order: _order(status: DeliveryStatus.newOrder)),
    );

    expect(find.text('Reason for reassign'), findsNothing);
    expect(find.text('Re-Assign'), findsOneWidget);
    expect(find.byType(AppSquareIconMark), findsNWidgets(2));
  });

  testWidgets('a failed order shows its own reason', (tester) async {
    await tester.pumpApp(
      OrderDetailBody(
        order: _order(
          status: DeliveryStatus.failed,
          reason: 'Customer not available',
        ),
      ),
    );

    expect(find.text('Reason for fail delivery'), findsOneWidget);
    expect(find.text('Customer not available'), findsOneWidget);
    expect(find.text('Reason for reassign'), findsNothing);
  });

  testWidgets('the reason title follows the locale', (tester) async {
    await tester.pumpApp(
      OrderDetailBody(order: _order()),
      locale: const Locale('ar'),
    );

    expect(find.text('سبب إعادة التعيين'), findsOneWidget);
    expect(find.text('Not well today'), findsOneWidget);
  });
}
