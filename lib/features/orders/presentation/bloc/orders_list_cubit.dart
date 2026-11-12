import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_filter.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_list_scope.dart';
import 'package:rayyan_driver/features/orders/domain/usecases/order_usecases.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/orders_list_state.dart';

/// Home's "Todays Orders" and Order History for [scope].
@injectable
class OrdersListCubit extends Cubit<OrdersListState> {
  OrdersListCubit(this._getOrders, @factoryParam this.scope)
    : super(
        OrdersListState(
          filters: OrderFilter.forScope(scope),
          filter: OrderFilter.forScope(scope).first,
        ),
      );

  final GetOrders _getOrders;
  final OrderListScope scope;

  Future<void> load() async {
    emit(state.copyWith(load: const OrdersLoad.loading()));
    await refresh();
  }

  /// Reloads without the spinner (pull to refresh, back from a detail).
  Future<void> refresh() async {
    final result = await _getOrders(scope);
    if (isClosed) return;
    emit(
      state.copyWith(
        load: switch (result) {
          Success(:final value) => OrdersLoad.loaded(value),
          Err(:final failure) => OrdersLoad.failure(failure),
        },
      ),
    );
  }

  void filterChanged(OrderFilter filter) =>
      emit(state.copyWith(filter: filter));

  void queryChanged(String query) => emit(state.copyWith(query: query));

  /// [range] null clears the Order History date filter.
  void dateRangeChanged(OrderDateRange? range) =>
      emit(state.copyWith(dateRange: range));
}
