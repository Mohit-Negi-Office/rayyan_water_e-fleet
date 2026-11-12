import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_status.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_detail.dart';
import 'package:rayyan_driver/features/orders/domain/entities/payment_status.dart';
import 'package:rayyan_driver/features/orders/domain/usecases/order_usecases.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/order_detail_cubit.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/order_detail_state.dart';

class _MockGet extends Mock implements GetOrderDetail {}

class _MockComplete extends Mock implements CompleteDelivery {}

final _order = OrderDetail(
  id: '1',
  number: '71864586927',
  status: DeliveryStatus.dropOff,
  payment: PaymentStatus.pending,
  slotStart: DateTime(2026, 6, 24, 8),
  slotEnd: DateTime(2026, 6, 24, 12),
  assignedAt: DateTime(2026, 6, 24, 5),
  items: const [],
  location: const DeliveryLocation(recipient: 'Ahmed', address: 'Al Khor'),
  customerName: 'Firoz Ahmed',
  customerPhone: '+97455876543',
  totalMinor: 17000,
);

void main() {
  late _MockGet getDetail;
  late _MockComplete complete;

  setUpAll(
    () => registerFallbackValue(
      const CompleteDeliveryParams(orderId: '', cashCollected: false),
    ),
  );
  setUp(() {
    getDetail = _MockGet();
    complete = _MockComplete();
  });

  OrderDetailCubit build() => OrderDetailCubit(getDetail, complete, '1');

  blocTest<OrderDetailCubit, OrderDetailState>(
    'loads the order',
    build: () {
      when(() => getDetail('1')).thenAnswer((_) async => Success(_order));
      return build();
    },
    act: (cubit) => cubit.load(),
    expect: () => [
      const OrderDetailState.loading(),
      OrderDetailState.loaded(_order),
    ],
  );

  blocTest<OrderDetailCubit, OrderDetailState>(
    'shows a load failure',
    build: () {
      when(
        () => getDetail('1'),
      ).thenAnswer((_) async => const Err(ServerFailure()));
      return build();
    },
    act: (cubit) => cubit.load(),
    expect: () => const [
      OrderDetailState.loading(),
      OrderDetailState.failure(ServerFailure()),
    ],
  );

  blocTest<OrderDetailCubit, OrderDetailState>(
    'an unpaid order is closed with the cash collected',
    build: () {
      when(() => complete(any())).thenAnswer(
        (_) async => Success(_order.withStatus(DeliveryStatus.delivered)),
      );
      return build();
    },
    seed: () => OrderDetailState.loaded(_order),
    act: (cubit) => cubit.complete(),
    expect: () => [
      OrderDetailState.loaded(_order, isCompleting: true),
      OrderDetailState.loaded(_order.withStatus(DeliveryStatus.delivered)),
    ],
    verify: (_) => verify(
      () => complete(
        const CompleteDeliveryParams(orderId: '1', cashCollected: true),
      ),
    ).called(1),
  );

  blocTest<OrderDetailCubit, OrderDetailState>(
    'a refused swipe keeps the order and shows why',
    build: () {
      when(
        () => complete(any()),
      ).thenAnswer((_) async => const Err(NetworkFailure()));
      return build();
    },
    seed: () => OrderDetailState.loaded(_order),
    act: (cubit) => cubit.complete(),
    expect: () => [
      OrderDetailState.loaded(_order, isCompleting: true),
      OrderDetailState.loaded(_order, actionFailure: const NetworkFailure()),
    ],
  );

  blocTest<OrderDetailCubit, OrderDetailState>(
    'a new order cannot be completed',
    build: build,
    seed: () =>
        OrderDetailState.loaded(_order.withStatus(DeliveryStatus.newOrder)),
    act: (cubit) => cubit.complete(),
    expect: () => const <OrderDetailState>[],
  );
}
