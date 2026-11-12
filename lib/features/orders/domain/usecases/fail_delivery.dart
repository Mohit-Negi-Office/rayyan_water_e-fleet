import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/features/orders/domain/entities/fail_reason.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_detail.dart';
import 'package:rayyan_driver/features/orders/domain/repositories/delivery_orders_repository.dart';

final class FailDeliveryParams extends Equatable {
  const FailDeliveryParams({
    required this.orderId,
    required this.reason,
    this.note = '',
  });

  final String orderId;
  final FailReason reason;

  /// Written reason for "Others".
  final String note;

  @override
  List<Object?> get props => [orderId, reason, note];
}

/// Records a failed delivery. "Others" needs a written reason.
@injectable
class FailDelivery implements UseCase<OrderDetail, FailDeliveryParams> {
  const FailDelivery(this._repository);

  final DeliveryOrdersRepository _repository;

  @override
  Future<Result<OrderDetail>> call(FailDeliveryParams params) async {
    if (!params.reason.isComplete(params.note)) {
      return const Err(ValidationFailure({'note': 'required'}));
    }
    return _repository.failDelivery(
      params.orderId,
      params.reason,
      params.note.trim(),
    );
  }
}
