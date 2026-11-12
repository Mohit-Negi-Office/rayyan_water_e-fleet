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

  /// Chips of each list, in Figma order. Home (`5665:38795`) is New Order,
  /// Delivered and Cancelled.
  static List<OrderFilter> forScope(OrderListScope scope) => switch (scope) {
    OrderListScope.today => const [newOrder, delivered, cancelled],
    OrderListScope.past ||
    OrderListScope.reassigned => const [all, delivered, cancelled, failed],
  };

  bool matches(DeliveryOrder order) {
    final status = order.outcome ?? order.status;
    return switch (this) {
      // Picked up and at drop-off stay under New Order, so an order does
      // not leave Home between assignment and delivery.
      OrderFilter.newOrder => status.isActive,
      OrderFilter.all => true,
      _ => status == _status,
    };
  }

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
