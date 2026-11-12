import 'package:equatable/equatable.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_status.dart';
import 'package:rayyan_driver/features/orders/domain/entities/payment_status.dart';

/// How the driver closes a delivery with the swipe at the foot of the
/// order detail.
enum DeliveryCompletion {
  /// Paid order: "Mark As Deliver".
  markDelivered,

  /// Unpaid order: "Total Amount" and "Cash Collected".
  collectCash,
}

/// What the driver may do with an order, from its status and payment
/// (Figma Order Detail `5000:100073`, `5672:38018`, `5672:38329`).
final class OrderActions extends Equatable {
  const OrderActions._({
    required this.canReassign,
    required this.canFail,
    required this.canContactSupport,
    required this.canReachCustomer,
    this.completion,
  });

  factory OrderActions.of({
    required DeliveryStatus status,
    required PaymentStatus payment,
  }) {
    final onTheWay = status.isOnTheWay;
    return OrderActions._(
      canReassign: status == DeliveryStatus.newOrder,
      canFail: onTheWay,
      canContactSupport: status.isActive,
      canReachCustomer: status.isActive,
      completion: !onTheWay
          ? null
          : switch (payment) {
              PaymentStatus.paid => DeliveryCompletion.markDelivered,
              PaymentStatus.pending => DeliveryCompletion.collectCash,
            },
    );
  }

  final bool canReassign;
  final bool canFail;
  final bool canContactSupport;

  /// Directions to the address and a call to the customer.
  final bool canReachCustomer;
  final DeliveryCompletion? completion;

  bool get hasAny =>
      canReassign || canFail || canContactSupport || completion != null;

  @override
  List<Object?> get props => [
    canReassign,
    canFail,
    canContactSupport,
    canReachCustomer,
    completion,
  ];
}
