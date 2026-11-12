import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_order.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_filter.dart';

part 'orders_list_state.freezed.dart';

/// Loading the orders of a list.
@freezed
sealed class OrdersLoad with _$OrdersLoad {
  const factory OrdersLoad.loading() = OrdersLoading;
  const factory OrdersLoad.loaded(List<DeliveryOrder> orders) = OrdersLoaded;
  const factory OrdersLoad.failure(Failure failure) = OrdersFailure;
}

/// An order list with its chip and search text; the chips and the search
/// box stay on screen whatever [load] is.
@freezed
abstract class OrdersListState with _$OrdersListState {
  const factory OrdersListState({
    required List<OrderFilter> filters,
    @Default(OrderFilter.all) OrderFilter filter,
    @Default('') String query,
    @Default(OrdersLoad.loading()) OrdersLoad load,
  }) = _OrdersListState;
}
