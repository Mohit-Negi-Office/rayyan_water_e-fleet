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
  failed(DeliveryStatus.failed),
  reassigned(DeliveryStatus.reassigned);

  const OrderFilter(this._status);

  final DeliveryStatus? _status;

  /// Chips of each list, in Figma order. Home (`5665:38795`) is New Order,
  /// Delivered and Cancelled. Order History (`5000:99925`) adds Re-Assign.
  static List<OrderFilter> forScope(OrderListScope scope) => switch (scope) {
    OrderListScope.today => const [newOrder, delivered, cancelled],
    OrderListScope.past => const [
      all,
      delivered,
      cancelled,
      failed,
      reassigned,
    ],
    OrderListScope.reassigned => const [all, delivered, cancelled, failed],
  };

  bool matches(DeliveryOrder order) {
    final status = order.outcome ?? order.status;
    return switch (this) {
      // Picked up and at drop-off stay under New Order, so an order does
      // not leave Home between assignment and delivery.
      OrderFilter.newOrder => status.isActive,
      OrderFilter.all => true,
      // The chip is the hand-off itself, not what happened afterwards.
      OrderFilter.reassigned => order.status == DeliveryStatus.reassigned,
      _ => status == _status,
    };
  }

  /// Orders matching this chip, [query] (order number or customer name,
  /// "#" and case ignored) and [dateRange] measured from [now].
  List<DeliveryOrder> apply(
    List<DeliveryOrder> orders, {
    String query = '',
    OrderDateRange? dateRange,
    DateTime? now,
  }) {
    final needle = query.trim().replaceFirst('#', '').toLowerCase();
    return [
      for (final order in orders)
        if (matches(order) &&
            _matchesQuery(order, needle) &&
            _inRange(order, dateRange, now))
          order,
    ];
  }

  bool _matchesQuery(DeliveryOrder order, String needle) =>
      needle.isEmpty ||
      order.number.toLowerCase().contains(needle) ||
      order.customerName.toLowerCase().contains(needle);

  bool _inRange(DeliveryOrder order, OrderDateRange? range, DateTime? now) {
    if (range == null) return true;
    final moment = order.closedAt ?? order.slotStart;
    if (moment == null || now == null) return false;
    return range.includes(moment, now);
  }
}

/// Date window of the Order History filter sheet (Figma `5908:36863`).
enum OrderDateRange {
  last30Days,
  last6Months,
  last1Year;

  /// First moment included, at midnight so a delivery earlier that day counts.
  DateTime startsAt(DateTime now) => switch (this) {
    OrderDateRange.last30Days => DateTime(
      now.year,
      now.month,
      now.day,
    ).subtract(const Duration(days: 30)),
    OrderDateRange.last6Months => DateTime(now.year, now.month - 6, now.day),
    OrderDateRange.last1Year => DateTime(now.year - 1, now.month, now.day),
  };

  bool includes(DateTime moment, DateTime now) =>
      !moment.isBefore(startsAt(now));
}
