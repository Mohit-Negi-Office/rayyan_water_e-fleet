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
}) => DeliveryOrder(
  id: number,
  number: number,
  status: status,
  outcome: outcome,
  itemCount: 3,
  customerName: customer,
  address: 'P.O. Box 15035, East Doha QATAR 34566',
);

void main() {
  group('OrderFilter.forScope', () {
    test("today's orders filter by delivery stage", () {
      expect(OrderFilter.forScope(OrderListScope.today), [
        OrderFilter.all,
        OrderFilter.newOrder,
        OrderFilter.orderPicked,
        OrderFilter.dropOff,
        OrderFilter.failed,
      ]);
    });

    test('past and re-assigned orders filter by outcome', () {
      const outcomes = [
        OrderFilter.all,
        OrderFilter.delivered,
        OrderFilter.cancelled,
        OrderFilter.failed,
      ];
      expect(OrderFilter.forScope(OrderListScope.past), outcomes);
      expect(OrderFilter.forScope(OrderListScope.reassigned), outcomes);
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
    ];

    test('All keeps every order', () {
      expect(OrderFilter.all.apply(orders), orders);
    });

    test('a stage keeps only orders in that stage', () {
      expect(OrderFilter.newOrder.apply(orders), [orders[0]]);
      expect(OrderFilter.failed.apply(orders), [orders[2]]);
    });

    test('a re-assigned order is filtered by what happened to it', () {
      expect(OrderFilter.delivered.apply(orders), [orders[3]]);
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
}
