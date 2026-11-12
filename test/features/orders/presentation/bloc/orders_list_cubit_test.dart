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

  test('starts loading, with the chips of its list', () {
    expect(build().state, OrdersListState(filters: todayFilters));
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
      OrdersListState(filters: todayFilters),
      OrdersListState(
        filters: todayFilters,
        load: const OrdersLoad.loaded([_order]),
      ),
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
      OrdersListState(
        filters: todayFilters,
        load: const OrdersLoad.failure(NetworkFailure()),
      ),
      OrdersListState(filters: todayFilters),
      OrdersListState(
        filters: todayFilters,
        load: const OrdersLoad.loaded([_order]),
      ),
    ],
  );

  blocTest<OrdersListCubit, OrdersListState>(
    'keeps the chip and the search text',
    build: build,
    act: (cubit) => cubit
      ..filterChanged(OrderFilter.dropOff)
      ..queryChanged('586'),
    expect: () => [
      OrdersListState(filters: todayFilters, filter: OrderFilter.dropOff),
      OrdersListState(
        filters: todayFilters,
        filter: OrderFilter.dropOff,
        query: '586',
      ),
    ],
  );
}
