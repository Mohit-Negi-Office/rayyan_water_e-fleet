import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rayyan_driver/core/error/app_exception.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/utils/clock.dart';
import 'package:rayyan_driver/features/orders/data/datasources/orders_mock_data_source.dart';
import 'package:rayyan_driver/features/orders/data/datasources/orders_remote_data_source.dart';
import 'package:rayyan_driver/features/orders/data/repositories/delivery_orders_repository_impl.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_order.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_status.dart';
import 'package:rayyan_driver/features/orders/domain/entities/fail_reason.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_list_scope.dart';

class _MockRemote extends Mock implements OrdersRemoteDataSource {}

class _FixedClock extends Clock {
  const _FixedClock();

  @override
  DateTime now() => DateTime(2026, 6, 24, 9);
}

void main() {
  setUpAll(() => registerFallbackValue(OrderListScope.today));

  group('over the demo data', () {
    late DeliveryOrdersRepositoryImpl repository;

    setUp(() {
      repository = DeliveryOrdersRepositoryImpl(
        OrdersMockDataSource(const _FixedClock()),
      );
    });

    Future<List<DeliveryOrder>> orders(OrderListScope scope) async =>
        switch (await repository.getOrders(scope)) {
          Success(:final value) => value,
          Err() => fail('no orders'),
        };

    test('lists today, past and re-assigned orders', () async {
      expect(await orders(OrderListScope.today), hasLength(6));
      expect(await orders(OrderListScope.past), hasLength(3));
      expect(await orders(OrderListScope.reassigned), hasLength(4));
    });

    test('a delivered order moves to Past Orders', () async {
      final result = await repository.completeDelivery(
        '71864586930',
        cashCollected: false,
      );
      expect((result as Success).value.status, DeliveryStatus.delivered);
      expect(await orders(OrderListScope.today), hasLength(5));
      expect(await orders(OrderListScope.past), hasLength(4));
    });

    test('a re-assigned order keeps the reason and leaves today', () async {
      final result = await repository.reassign('71864586927', 'Not well');
      final order = (result as Success).value;
      expect(order.status, DeliveryStatus.reassigned);
      expect(order.reason, 'Not well');
      expect(await orders(OrderListScope.reassigned), hasLength(5));
    });

    test('a failed delivery stays in today with its reason', () async {
      final result = await repository.failDelivery(
        '71864586931',
        FailReason.packageDamaged,
        '',
      );
      expect((result as Success).value.reason, 'Package damaged');
      expect(await orders(OrderListScope.today), hasLength(6));
    });

    test('an unknown order is a server failure', () async {
      expect(
        await repository.getOrder('nope'),
        isA<Err>().having((e) => e.failure, 'failure', isA<ServerFailure>()),
      );
    });
  });

  group('error mapping', () {
    late _MockRemote remote;
    late DeliveryOrdersRepositoryImpl repository;

    setUp(() {
      remote = _MockRemote();
      repository = DeliveryOrdersRepositoryImpl(remote);
    });

    final cases = <AppException, Failure>{
      const NetworkException('offline'): const NetworkFailure(),
      const ServerException('boom'): const ServerFailure(),
      const UnauthorizedException('expired'): const UnauthorizedFailure(),
    };
    for (final MapEntry(key: exception, value: failure) in cases.entries) {
      test('getOrders maps ${exception.runtimeType}', () async {
        when(() => remote.fetchOrders(any())).thenThrow(exception);
        expect(
          await repository.getOrders(OrderListScope.today),
          Err<List<DeliveryOrder>>(failure),
        );
      });
    }
  });
}
