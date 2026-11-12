import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_order.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_status.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_filter.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_list_scope.dart';
import 'package:rayyan_driver/features/orders/domain/usecases/order_usecases.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/orders_list_cubit.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/orders_list_state.dart';

class _MockGetOrders extends Mock implements GetOrders {}

const _order = DeliveryOrder(
  id: '1',
  number: '71864586927',
  status: DeliveryStatus.newOrder,
  itemCount: 3,
  customerName: 'Ahmed Al-Thani',
  address: 'P.O. Box 15035',
);

void main() {
  late _MockGetOrders getOrders;
  final todayFilters = OrderFilter.forScope(OrderListScope.today);

  setUpAll(() => registerFallbackValue(OrderListScope.today));
  setUp(() => getOrders = _MockGetOrders());

  OrdersListCubit build() => OrdersListCubit(getOrders, OrderListScope.today);

  OrdersListState todayState({
    OrderFilter? filter,
    String query = '',
    OrdersLoad load = const OrdersLoad.loading(),
  }) => OrdersListState(
    filters: todayFilters,
    filter: filter ?? todayFilters.first,
    query: query,
    load: load,
  );

  test('starts on New Order, with the chips of its list', () {
    expect(build().state, todayState());
  });

  blocTest<OrdersListCubit, OrdersListState>(
    'loads the orders',
    build: () {
      when(
        () => getOrders(OrderListScope.today),
      ).thenAnswer((_) async => const Success([_order]));
      return build();
    },
    act: (cubit) => cubit.load(),
    expect: () => [
      todayState(),
      todayState(load: const OrdersLoad.loaded([_order])),
    ],
  );

  blocTest<OrdersListCubit, OrdersListState>(
    'shows a failure, and Retry recovers',
    build: () {
      var calls = 0;
      when(() => getOrders(any())).thenAnswer(
        (_) async => calls++ == 0
            ? const Err(NetworkFailure())
            : const Success([_order]),
      );
      return build();
    },
    act: (cubit) async {
      await cubit.load();
      await cubit.load();
    },
    skip: 1,
    expect: () => [
      todayState(load: const OrdersLoad.failure(NetworkFailure())),
      todayState(),
      todayState(load: const OrdersLoad.loaded([_order])),
    ],
  );

  blocTest<OrdersListCubit, OrdersListState>(
    'keeps the chip and the search text',
    build: build,
    act: (cubit) => cubit
      ..filterChanged(OrderFilter.delivered)
      ..queryChanged('586'),
    expect: () => [
      todayState(filter: OrderFilter.delivered),
      todayState(filter: OrderFilter.delivered, query: '586'),
    ],
  );
}
