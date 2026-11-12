import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_order.dart';
import 'package:rayyan_driver/features/orders/domain/entities/fail_reason.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_detail.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_list_scope.dart';

abstract interface class DeliveryOrdersRepository {
  Future<Result<List<DeliveryOrder>>> getOrders(OrderListScope scope);

  Future<Result<OrderDetail>> getOrder(String id);

  /// Hands the order to another driver, with the driver's [reason].
  Future<Result<OrderDetail>> reassign(String id, String reason);

  /// Records a failed delivery.
  Future<Result<OrderDetail>> failDelivery(
    String id,
    FailReason reason,
    String note,
  );

  /// Closes the delivery; [cashCollected] for an unpaid order.
  Future<Result<OrderDetail>> completeDelivery(
    String id, {
    required bool cashCollected,
  });
}
