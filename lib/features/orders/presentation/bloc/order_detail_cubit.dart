import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_actions.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_detail.dart';
import 'package:rayyan_driver/features/orders/domain/usecases/order_usecases.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/order_detail_state.dart';

/// One order's detail and the swipe that closes the delivery.
@injectable
class OrderDetailCubit extends Cubit<OrderDetailState> {
  OrderDetailCubit(
    this._getOrderDetail,
    this._completeDelivery,
    @factoryParam this.orderId,
  ) : super(const OrderDetailState.loading());

  final GetOrderDetail _getOrderDetail;
  final CompleteDelivery _completeDelivery;
  final String orderId;

  Future<void> load() async {
    emit(const OrderDetailState.loading());
    final result = await _getOrderDetail(orderId);
    if (isClosed) return;
    emit(switch (result) {
      Success(:final value) => OrderDetailState.loaded(value),
      Err(:final failure) => OrderDetailState.failure(failure),
    });
  }

  /// Shows the order as another screen left it (re-assigned, failed).
  void replaced(OrderDetail order) => emit(OrderDetailState.loaded(order));

  /// "Mark As Deliver" or "Cash Collected".
  Future<void> complete() async {
    final current = state;
    if (current is! OrderDetailLoaded || current.isCompleting) return;
    final completion = current.order.actions.completion;
    if (completion == null) return;
    emit(current.copyWith(isCompleting: true, actionFailure: null));
    final result = await _completeDelivery(
      CompleteDeliveryParams(
        orderId: orderId,
        cashCollected: completion == DeliveryCompletion.collectCash,
      ),
    );
    if (isClosed) return;
    emit(switch (result) {
      Success(:final value) => OrderDetailState.loaded(value),
      Err(:final failure) => current.copyWith(actionFailure: failure),
    });
  }
}
