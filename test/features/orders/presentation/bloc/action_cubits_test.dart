import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_status.dart';
import 'package:rayyan_driver/features/orders/domain/entities/fail_reason.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_detail.dart';
import 'package:rayyan_driver/features/orders/domain/entities/payment_status.dart';
import 'package:rayyan_driver/features/orders/domain/usecases/fail_delivery.dart';
import 'package:rayyan_driver/features/orders/domain/usecases/order_usecases.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/fail_delivery_cubit.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/fail_delivery_state.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/reassign_cubit.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/reassign_state.dart';

class _MockReassign extends Mock implements ReassignOrder {}

class _MockFail extends Mock implements FailDelivery {}

final _done = OrderDetail(
  id: '1',
  number: '1',
  status: DeliveryStatus.failed,
  payment: PaymentStatus.paid,
  slotStart: DateTime(2026),
  slotEnd: DateTime(2026),
  assignedAt: DateTime(2026),
  items: const [],
  location: const DeliveryLocation(recipient: 'A', address: 'B'),
  customerName: 'C',
  customerPhone: '+974',
  totalMinor: 0,
);

void main() {
  setUpAll(() {
    registerFallbackValue(const ReassignParams(orderId: '', reason: ''));
    registerFallbackValue(
      const FailDeliveryParams(orderId: '', reason: FailReason.other),
    );
  });

  group('ReassignCubit', () {
    late _MockReassign reassign;
    setUp(() => reassign = _MockReassign());

    test('Confirm needs a written reason', () {
      expect(const ReassignState().canSubmit, isFalse);
      expect(const ReassignState(reason: '  ').canSubmit, isFalse);
      expect(const ReassignState(reason: 'Not well').canSubmit, isTrue);
    });

    blocTest<ReassignCubit, ReassignState>(
      'sends the reason and keeps the result',
      build: () {
        when(() => reassign(any())).thenAnswer((_) async => Success(_done));
        return ReassignCubit(reassign, '1');
      },
      seed: () => const ReassignState(reason: 'Not well'),
      act: (cubit) => cubit.submit(),
      expect: () => [
        const ReassignState(reason: 'Not well', isSubmitting: true),
        ReassignState(reason: 'Not well', result: _done),
      ],
    );

    blocTest<ReassignCubit, ReassignState>(
      'shows a refusal in the sheet',
      build: () {
        when(
          () => reassign(any()),
        ).thenAnswer((_) async => const Err(ServerFailure()));
        return ReassignCubit(reassign, '1');
      },
      seed: () => const ReassignState(reason: 'Not well'),
      act: (cubit) => cubit.submit(),
      expect: () => const [
        ReassignState(reason: 'Not well', isSubmitting: true),
        ReassignState(reason: 'Not well', failure: ServerFailure()),
      ],
    );
  });

  group('FailDeliveryCubit', () {
    late _MockFail fail;
    setUp(() => fail = _MockFail());

    blocTest<FailDeliveryCubit, FailDeliveryState>(
      'Submit without a reason asks for one',
      build: () => FailDeliveryCubit(fail, '1'),
      act: (cubit) => cubit.submit(),
      expect: () => const [FailDeliveryState(isReasonMissing: true)],
      verify: (_) => verifyNever(() => fail(any())),
    );

    blocTest<FailDeliveryCubit, FailDeliveryState>(
      '"Others" needs the written reason',
      build: () => FailDeliveryCubit(fail, '1'),
      act: (cubit) => cubit
        ..reasonSelected(FailReason.other)
        ..submit(),
      expect: () => const [
        FailDeliveryState(reason: FailReason.other),
        FailDeliveryState(reason: FailReason.other, isReasonMissing: true),
      ],
    );

    blocTest<FailDeliveryCubit, FailDeliveryState>(
      'sends a listed reason',
      build: () {
        when(() => fail(any())).thenAnswer((_) async => Success(_done));
        return FailDeliveryCubit(fail, '1');
      },
      seed: () => const FailDeliveryState(reason: FailReason.refusedDelivery),
      act: (cubit) => cubit.submit(),
      expect: () => [
        const FailDeliveryState(
          reason: FailReason.refusedDelivery,
          isSubmitting: true,
        ),
        FailDeliveryState(reason: FailReason.refusedDelivery, result: _done),
      ],
      verify: (_) => verify(
        () => fail(
          const FailDeliveryParams(
            orderId: '1',
            reason: FailReason.refusedDelivery,
          ),
        ),
      ).called(1),
    );
  });
}
