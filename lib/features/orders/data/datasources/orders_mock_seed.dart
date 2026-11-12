import 'package:rayyan_driver/features/orders/domain/entities/delivery_status.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_list_scope.dart';
import 'package:rayyan_driver/features/orders/domain/entities/payment_status.dart';

/// A sample order as the mock keeps it.
final class MockOrder {
  MockOrder({
    required this.number,
    required this.scope,
    required this.status,
    required this.payment,
    required this.slotStart,
    required this.slotHours,
    this.quantities = const [1, 2],
    this.outcome,
    this.closedAt,
    this.reason,
    this.totalMinor = 17000,
  });

  final String number;
  OrderListScope scope;
  DeliveryStatus status;
  PaymentStatus payment;
  final DateTime slotStart;
  final int slotHours;

  /// Packs per line: "Qty 01", "Qty 02".
  final List<int> quantities;
  final DeliveryStatus? outcome;
  DateTime? closedAt;
  String? reason;
  final int totalMinor;
}

/// Sample orders matching the Figma frames: today's orders, including
/// deliveries and cancellations closed today, older history, and
/// re-assigned orders.
List<MockOrder> seedMockOrders(DateTime now) {
  DateTime today(int hour) => DateTime(now.year, now.month, now.day, hour);
  final pastDay = DateTime(2025, 2, 14, 9, 32);
  MockOrder order(
    String number,
    OrderListScope scope,
    DeliveryStatus status, {
    PaymentStatus payment = PaymentStatus.paid,
    int startHour = 8,
    int hours = 2,
    List<int> quantities = const [1, 2],
    DeliveryStatus? outcome,
    DateTime? closedAt,
    String? reason,
  }) => MockOrder(
    number: number,
    scope: scope,
    status: status,
    payment: payment,
    slotStart: today(startHour),
    slotHours: hours,
    quantities: quantities,
    outcome: outcome,
    closedAt: closedAt,
    reason: reason,
  );

  const t = OrderListScope.today;
  const p = OrderListScope.past;
  const r = OrderListScope.reassigned;
  const reason = 'Not well today';
  return [
    order('71864586927', t, DeliveryStatus.newOrder, hours: 4),
    order(
      '71864586928',
      t,
      DeliveryStatus.newOrder,
      payment: PaymentStatus.pending,
      quantities: const [2, 2],
    ),
    order('71864586929', t, DeliveryStatus.newOrder, startHour: 11),
    order('71864586930', t, DeliveryStatus.orderPicked, hours: 4),
    order(
      '71864586931',
      t,
      DeliveryStatus.dropOff,
      payment: PaymentStatus.pending,
      hours: 4,
    ),
    order(
      '71864586932',
      t,
      DeliveryStatus.failed,
      startHour: 14,
      reason: 'Customer not available',
    ),
    order('71864586933', p, DeliveryStatus.delivered, closedAt: pastDay),
    order('71864586934', p, DeliveryStatus.delivered, closedAt: pastDay),
    order(
      '71864586935',
      p,
      DeliveryStatus.failed,
      closedAt: DateTime(2025, 2, 14),
      reason: 'Customer not available',
    ),
    order(
      '71864586936',
      p,
      DeliveryStatus.delivered,
      closedAt: DateTime(now.year, now.month, now.day, 9, 32),
    ),
    order(
      '71864586937',
      p,
      DeliveryStatus.cancelled,
      closedAt: DateTime(now.year, now.month, now.day, 11, 5),
    ),
    order(
      '71864586938',
      p,
      DeliveryStatus.reassigned,
      closedAt: pastDay,
      reason: reason,
    ),
    for (final (i, outcome) in const [
      DeliveryStatus.delivered,
      DeliveryStatus.cancelled,
      DeliveryStatus.failed,
      DeliveryStatus.delivered,
    ].indexed)
      order(
        '7186458694$i',
        r,
        DeliveryStatus.reassigned,
        outcome: outcome,
        reason: reason,
      ),
  ];
}
