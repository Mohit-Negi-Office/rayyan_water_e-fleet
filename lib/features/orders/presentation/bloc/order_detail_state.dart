import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_detail.dart';

part 'order_detail_state.freezed.dart';

@freezed
sealed class OrderDetailState with _$OrderDetailState {
  const factory OrderDetailState.loading() = OrderDetailLoading;

  /// [isCompleting] while the swipe is being confirmed; [actionFailure]
  /// when it was refused (shown above the swipe).
  const factory OrderDetailState.loaded(
    OrderDetail order, {
    @Default(false) bool isCompleting,
    Failure? actionFailure,
  }) = OrderDetailLoaded;

  const factory OrderDetailState.failure(Failure failure) = OrderDetailFailure;
}
