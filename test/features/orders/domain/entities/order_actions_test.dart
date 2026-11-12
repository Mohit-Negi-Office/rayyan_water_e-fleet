import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_status.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_actions.dart';
import 'package:rayyan_driver/features/orders/domain/entities/payment_status.dart';

void main() {
  OrderActions of(DeliveryStatus status, [PaymentStatus? payment]) =>
      OrderActions.of(status: status, payment: payment ?? PaymentStatus.paid);

  test('a new order can be re-assigned, not delivered yet', () {
    final actions = of(DeliveryStatus.newOrder);
    expect(actions.canReassign, isTrue);
    expect(actions.canFail, isFalse);
    expect(actions.completion, isNull);
    expect(actions.canContactSupport, isTrue);
    expect(actions.canReachCustomer, isTrue);
  });

  test('a paid order on the way is marked as delivered', () {
    for (final status in [DeliveryStatus.orderPicked, DeliveryStatus.dropOff]) {
      final actions = of(status);
      expect(actions.canReassign, isFalse);
      expect(actions.canFail, isTrue);
      expect(actions.completion, DeliveryCompletion.markDelivered);
    }
  });

  test('an unpaid order on the way needs the cash collected', () {
    expect(
      of(DeliveryStatus.dropOff, PaymentStatus.pending).completion,
      DeliveryCompletion.collectCash,
    );
  });

  test('a finished order offers nothing', () {
    for (final status in [
      DeliveryStatus.delivered,
      DeliveryStatus.failed,
      DeliveryStatus.reassigned,
      DeliveryStatus.cancelled,
    ]) {
      final actions = of(status);
      expect(actions.hasAny, isFalse, reason: status.name);
      expect(actions.canReachCustomer, isFalse, reason: status.name);
    }
  });
}
