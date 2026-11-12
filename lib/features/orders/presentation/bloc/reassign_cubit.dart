import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/orders/domain/usecases/order_usecases.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/reassign_state.dart';

@injectable
class ReassignCubit extends Cubit<ReassignState> {
  ReassignCubit(this._reassignOrder, @factoryParam this.orderId)
    : super(const ReassignState());

  final ReassignOrder _reassignOrder;
  final String orderId;

  void reasonChanged(String reason) =>
      emit(state.copyWith(reason: reason, failure: null));

  Future<void> submit() async {
    if (!state.canSubmit) return;
    emit(state.copyWith(isSubmitting: true, failure: null));
    final result = await _reassignOrder(
      ReassignParams(orderId: orderId, reason: state.reason),
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
