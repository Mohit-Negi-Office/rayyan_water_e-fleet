import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/orders/domain/entities/fail_reason.dart';
import 'package:rayyan_driver/features/orders/domain/usecases/fail_delivery.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/fail_delivery_state.dart';

@injectable
class FailDeliveryCubit extends Cubit<FailDeliveryState> {
  FailDeliveryCubit(this._failDelivery, @factoryParam this.orderId)
    : super(const FailDeliveryState());

  final FailDelivery _failDelivery;
  final String orderId;

  void reasonSelected(FailReason reason) => emit(
    state.copyWith(reason: reason, failure: null, isReasonMissing: false),
  );

  void noteChanged(String note) =>
      emit(state.copyWith(note: note, failure: null, isReasonMissing: false));

  /// Submit stays red as in Figma; without a reason it asks for one.
  Future<void> submit() async {
    final reason = state.reason;
    if (state.isSubmitting) return;
    if (reason == null || !reason.isComplete(state.note)) {
      emit(state.copyWith(isReasonMissing: true));
      return;
    }
    emit(state.copyWith(isSubmitting: true, failure: null));
    final result = await _failDelivery(
      FailDeliveryParams(orderId: orderId, reason: reason, note: state.note),
    );
    if (isClosed) return;
    emit(switch (result) {
      Success(:final value) => state.copyWith(
        isSubmitting: false,
        result: value,
      ),
      Err(:final failure) => state.copyWith(
        isSubmitting: false,
        failure: failure,
      ),
    });
  }
}
