import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_order.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_status.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_filter.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_list_scope.dart';

DeliveryOrder _order(
  String number,
  DeliveryStatus status, {
  DeliveryStatus? outcome,
  String customer = 'Ahmed Al-Thani',
  DateTime? closedAt,
  DateTime? slotStart,
}) => DeliveryOrder(
  id: number,
  number: number,
  status: status,
  outcome: outcome,
  itemCount: 3,
  customerName: customer,
  address: 'P.O. Box 15035, East Doha QATAR 34566',
  closedAt: closedAt,
  slotStart: slotStart,
);

void main() {
  group('OrderFilter.forScope', () {
    test("today's orders filter by new, delivered and cancelled", () {
      expect(OrderFilter.forScope(OrderListScope.today), [
        OrderFilter.newOrder,
        OrderFilter.delivered,
        OrderFilter.cancelled,
      ]);
    });

    test('order history adds Re-Assign after the outcome chips', () {
      expect(OrderFilter.forScope(OrderListScope.past), [
        OrderFilter.all,
        OrderFilter.delivered,
        OrderFilter.cancelled,
        OrderFilter.failed,
        OrderFilter.reassigned,
      ]);
    });

    test('the re-assigned list still filters by outcome', () {
      expect(OrderFilter.forScope(OrderListScope.reassigned), [
        OrderFilter.all,
        OrderFilter.delivered,
        OrderFilter.cancelled,
        OrderFilter.failed,
      ]);
    });
  });

  group('OrderFilter.apply', () {
    final orders = [
      _order('71864586927', DeliveryStatus.newOrder),
      _order('71864586928', DeliveryStatus.orderPicked, customer: 'Firoz'),
      _order('71864586929', DeliveryStatus.failed),
      _order(
        '71864586930',
        DeliveryStatus.reassigned,
        outcome: DeliveryStatus.delivered,
      ),
      _order('71864586931', DeliveryStatus.dropOff),
    ];

    test('All keeps every order', () {
      expect(OrderFilter.all.apply(orders), orders);
    });

    test('New Order keeps every order still out for delivery', () {
      expect(OrderFilter.newOrder.apply(orders), [
        orders[0],
        orders[1],
        orders[4],
      ]);
    });

    test('a stage keeps only orders in that stage', () {
      expect(OrderFilter.failed.apply(orders), [orders[2]]);
      expect(OrderFilter.cancelled.apply(orders), isEmpty);
    });

    test('a re-assigned order is filtered by what happened to it', () {
      expect(OrderFilter.delivered.apply(orders), [orders[3]]);
    });

    test('Re-Assign keeps orders handed to another driver', () {
      expect(OrderFilter.reassigned.apply(orders), [orders[3]]);
    });

    test('search matches the order number or the customer', () {
      expect(OrderFilter.all.apply(orders, query: '586928'), [orders[1]]);
      expect(OrderFilter.all.apply(orders, query: 'firoz'), [orders[1]]);
      expect(OrderFilter.all.apply(orders, query: '#71864586929'), [orders[2]]);
    });

    test('a blank search keeps everything', () {
      expect(OrderFilter.all.apply(orders, query: '   '), orders);
    });
  });

  group('OrderDateRange', () {
    final now = DateTime(2026, 6, 24, 9);
    final recent = _order(
      '1',
      DeliveryStatus.delivered,
      closedAt: DateTime(2026, 6, 1, 9, 32),
    );
    final halfYear = _order(
      '2',
      DeliveryStatus.cancelled,
      closedAt: DateTime(2026, 1, 1),
    );
    final lastYear = _order(
      '3',
      DeliveryStatus.failed,
      closedAt: DateTime(2025, 8, 1),
    );
    final older = _order(
      '4',
      DeliveryStatus.delivered,
      closedAt: DateTime(2024, 6, 1),
    );
    final undated = _order('5', DeliveryStatus.delivered);
    final orders = [recent, halfYear, lastYear, older, undated];

    test('last 30 days keeps orders closed since that morning', () {
      expect(
        OrderFilter.all.apply(
          orders,
          dateRange: OrderDateRange.last30Days,
          now: now,
        ),
        [recent],
      );
    });

    test('last 6 months and last year widen the same window', () {
      expect(
        OrderFilter.all.apply(
          orders,
          dateRange: OrderDateRange.last6Months,
          now: now,
        ),
        [recent, halfYear],
      );
      expect(
        OrderFilter.all.apply(
          orders,
          dateRange: OrderDateRange.last1Year,
          now: now,
        ),
        [recent, halfYear, lastYear],
      );
    });

    test('a range uses the slot when the order has no close time', () {
      final slotted = _order(
        '6',
        DeliveryStatus.reassigned,
        slotStart: DateTime(2026, 6, 20, 8),
      );
      expect(
        OrderFilter.all.apply(
          [slotted, undated],
          dateRange: OrderDateRange.last30Days,
          now: now,
        ),
        [slotted],
      );
    });

    test('a range still respects the chip and the search', () {
      expect(
        OrderFilter.delivered.apply(
          orders,
          query: '1',
          dateRange: OrderDateRange.last1Year,
          now: now,
        ),
        [recent],
      );
    });
  });
}
