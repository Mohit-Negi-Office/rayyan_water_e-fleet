import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/network/api_client.dart';
import 'package:rayyan_driver/core/network/api_endpoints.dart';
import 'package:rayyan_driver/core/network/app_environment.dart';
import 'package:rayyan_driver/features/orders/data/models/delivery_order_model.dart';
import 'package:rayyan_driver/features/orders/data/models/order_detail_model.dart';
import 'package:rayyan_driver/features/orders/data/models/order_enums_model.dart';
import 'package:rayyan_driver/features/orders/domain/entities/fail_reason.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_list_scope.dart';

abstract interface class OrdersRemoteDataSource {
  Future<List<DeliveryOrderModel>> fetchOrders(OrderListScope scope);
  Future<OrderDetailModel> fetchOrder(String id);
  Future<OrderDetailModel> reassign(String id, String reason);
  Future<OrderDetailModel> fail(String id, FailReason reason, String note);
  Future<OrderDetailModel> complete(String id, {required bool cashCollected});
}

@LazySingleton(as: OrdersRemoteDataSource, env: [AppEnvironment.prod])
final class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  const OrdersRemoteDataSourceImpl(this._client);

  final ApiClient _client;

  @override
  Future<List<DeliveryOrderModel>> fetchOrders(OrderListScope scope) async {
    final json = await _client.get<List<dynamic>>(
      ApiEndpoints.orders,
      query: {'scope': scope.name},
    );
    return [
      for (final item in json)
        DeliveryOrderModel.fromJson(item as Map<String, dynamic>),
    ];
  }

  @override
  Future<OrderDetailModel> fetchOrder(String id) async =>
      OrderDetailModel.fromJson(
        await _client.get<Map<String, dynamic>>(ApiEndpoints.order(id)),
      );

  @override
  Future<OrderDetailModel> reassign(String id, String reason) async =>
      OrderDetailModel.fromJson(
        await _client.post<Map<String, dynamic>>(
          ApiEndpoints.orderReassign(id),
          data: {'reason': reason},
        ),
      );

  @override
  Future<OrderDetailModel> fail(
    String id,
    FailReason reason,
    String note,
  ) async => OrderDetailModel.fromJson(
    await _client.post<Map<String, dynamic>>(
      ApiEndpoints.orderFail(id),
      data: {'reason': failReasonCodes[reason], 'note': note},
    ),
  );

  @override
  Future<OrderDetailModel> complete(
    String id, {
    required bool cashCollected,
  }) async => OrderDetailModel.fromJson(
    await _client.post<Map<String, dynamic>>(
      ApiEndpoints.orderComplete(id),
      data: {'cash_collected': cashCollected},
    ),
  );
}
