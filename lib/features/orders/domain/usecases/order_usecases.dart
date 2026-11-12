import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_order.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_detail.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_list_scope.dart';
import 'package:rayyan_driver/features/orders/domain/repositories/delivery_orders_repository.dart';

@injectable
class GetOrders implements UseCase<List<DeliveryOrder>, OrderListScope> {
  const GetOrders(this._repository);

  final DeliveryOrdersRepository _repository;

  @override
  Future<Result<List<DeliveryOrder>>> call(OrderListScope params) =>
      _repository.getOrders(params);
}

@injectable
class GetOrderDetail implements UseCase<OrderDetail, String> {
  const GetOrderDetail(this._repository);

  final DeliveryOrdersRepository _repository;

  @override
  Future<Result<OrderDetail>> call(String params) =>
      _repository.getOrder(params);
}

final class ReassignParams extends Equatable {
  const ReassignParams({required this.orderId, required this.reason});

  final String orderId;
  final String reason;

  @override
  List<Object?> get props => [orderId, reason];
}

@injectable
class ReassignOrder implements UseCase<OrderDetail, ReassignParams> {
  const ReassignOrder(this._repository);

  final DeliveryOrdersRepository _repository;

  @override
  Future<Result<OrderDetail>> call(ReassignParams params) =>
      _repository.reassign(params.orderId, params.reason.trim());
}

final class CompleteDeliveryParams extends Equatable {
  const CompleteDeliveryParams({
    required this.orderId,
    required this.cashCollected,
  });

  final String orderId;
  final bool cashCollected;

  @override
  List<Object?> get props => [orderId, cashCollected];
}

@injectable
class CompleteDelivery implements UseCase<OrderDetail, CompleteDeliveryParams> {
  const CompleteDelivery(this._repository);

  final DeliveryOrdersRepository _repository;

  @override
  Future<Result<OrderDetail>> call(CompleteDeliveryParams params) => _repository
      .completeDelivery(params.orderId, cashCollected: params.cashCollected);
}
