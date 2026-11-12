import 'package:equatable/equatable.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_status.dart';
import 'package:rayyan_driver/features/orders/domain/entities/payment_status.dart';

/// An order as listed on Home, Past Orders and Re-Assigned.
final class DeliveryOrder extends Equatable {
  const DeliveryOrder({
    required this.id,
    required this.number,
    required this.status,
    required this.itemCount,
    required this.customerName,
    required this.address,
    this.outcome,
    this.payment,
    this.slotStart,
    this.slotEnd,
    this.closedAt,
  });

  final String id;

  /// Shown as "#71864586927".
  final String number;
  final DeliveryStatus status;

  /// What finally happened to a re-assigned order.
  final DeliveryStatus? outcome;
  final int itemCount;
  final String customerName;
  final String address;
  final PaymentStatus? payment;

  /// Delivery window.
  final DateTime? slotStart;
  final DateTime? slotEnd;

  /// When a past order was delivered or failed.
  final DateTime? closedAt;

  @override
  List<Object?> get props => [
    id,
    number,
    status,
    outcome,
    itemCount,
    customerName,
    address,
    payment,
    slotStart,
    slotEnd,
    closedAt,
  ];
}
