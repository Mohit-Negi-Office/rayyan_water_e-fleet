import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/orders/data/datasources/orders_remote_data_source.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_order.dart';
import 'package:rayyan_driver/features/orders/domain/entities/fail_reason.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_detail.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_list_scope.dart';
import 'package:rayyan_driver/features/orders/domain/repositories/delivery_orders_repository.dart';

@LazySingleton(as: DeliveryOrdersRepository)
final class DeliveryOrdersRepositoryImpl implements DeliveryOrdersRepository {
  const DeliveryOrdersRepositoryImpl(this._remote);

  final OrdersRemoteDataSource _remote;

  @override
  Future<Result<List<DeliveryOrder>>> getOrders(OrderListScope scope) =>
      guard(() async {
        final models = await _remote.fetchOrders(scope);
        return [for (final m in models) m.toEntity()];
      });

  @override
  Future<Result<OrderDetail>> getOrder(String id) =>
      guard(() async => (await _remote.fetchOrder(id)).toEntity());

  @override
  Future<Result<OrderDetail>> reassign(String id, String reason) =>
      guard(() async => (await _remote.reassign(id, reason)).toEntity());

  @override
  Future<Result<OrderDetail>> failDelivery(
    String id,
    FailReason reason,
    String note,
  ) => guard(() async => (await _remote.fail(id, reason, note)).toEntity());

  @override
  Future<Result<OrderDetail>> completeDelivery(
    String id, {
    required bool cashCollected,
  }) => guard(
    () async =>
        (await _remote.complete(id, cashCollected: cashCollected)).toEntity(),
  );
}
