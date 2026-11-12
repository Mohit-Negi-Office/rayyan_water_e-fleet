import 'package:rayyan_driver/features/orders/domain/entities/delivery_order.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_status.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_list_scope.dart';

/// The chips over an order list, and the search box beside them.
enum OrderFilter {
  all(null),
  newOrder(DeliveryStatus.newOrder),
  orderPicked(DeliveryStatus.orderPicked),
  dropOff(DeliveryStatus.dropOff),
  delivered(DeliveryStatus.delivered),
  cancelled(DeliveryStatus.cancelled),
  failed(DeliveryStatus.failed);

  const OrderFilter(this._status);

  final DeliveryStatus? _status;

  /// Chips of each list, in Figma order.
  static List<OrderFilter> forScope(OrderListScope scope) => switch (scope) {
    OrderListScope.today => const [all, newOrder, orderPicked, dropOff, failed],
    OrderListScope.past ||
    OrderListScope.reassigned => const [all, delivered, cancelled, failed],
  };

  bool matches(DeliveryOrder order) =>
      _status == null || (order.outcome ?? order.status) == _status;

  /// Orders matching this chip and [query] (order number or customer name,
  /// "#" and case ignored).
  List<DeliveryOrder> apply(List<DeliveryOrder> orders, {String query = ''}) {
    final needle = query.trim().replaceFirst('#', '').toLowerCase();
    return [
      for (final order in orders)
        if (matches(order) &&
            (needle.isEmpty ||
                order.number.toLowerCase().contains(needle) ||
                order.customerName.toLowerCase().contains(needle)))
          order,
    ];
  }
}
