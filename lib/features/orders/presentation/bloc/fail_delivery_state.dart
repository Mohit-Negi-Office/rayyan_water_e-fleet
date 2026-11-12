import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/features/orders/domain/entities/fail_reason.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_detail.dart';

part 'fail_delivery_state.freezed.dart';

/// "Fail Delivery". [result] is the failed order once sent.
@freezed
abstract class FailDeliveryState with _$FailDeliveryState {
  const factory FailDeliveryState({
    FailReason? reason,
    @Default('') String note,
    @Default(false) bool isSubmitting,
    Failure? failure,
    OrderDetail? result,

    /// Submit was tapped without a usable reason.
    @Default(false) bool isReasonMissing,
  }) = _FailDeliveryState;

  const FailDeliveryState._();
}
