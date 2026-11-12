import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_detail.dart';

part 'reassign_state.freezed.dart';

/// "Re-Assign Order" sheet. [result] is the re-assigned order.
@freezed
abstract class ReassignState with _$ReassignState {
  const factory ReassignState({
    @Default('') String reason,
    @Default(false) bool isSubmitting,
    Failure? failure,
    OrderDetail? result,
  }) = _ReassignState;

  const ReassignState._();

  /// Confirm stays grey until a reason is written.
  bool get canSubmit => reason.trim().isNotEmpty && !isSubmitting;
}
