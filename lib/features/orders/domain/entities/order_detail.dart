import 'package:equatable/equatable.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_status.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_actions.dart';
import 'package:rayyan_driver/features/orders/domain/entities/payment_status.dart';

/// One line of "Order Detail": "Glass Still Water / 750 ML x 12 Bottles |
/// Qty 01".
final class OrderItem extends Equatable {
  const OrderItem({
    required this.name,
    required this.volumeMl,
    required this.bottles,
    required this.quantity,
    this.imageUrl,
  });

  final String name;
  final int volumeMl;
  final int bottles;
  final int quantity;
  final String? imageUrl;

  @override
  List<Object?> get props => [name, volumeMl, bottles, quantity, imageUrl];
}

/// Where the order goes, with photos that help the driver find it.
final class DeliveryLocation extends Equatable {
  const DeliveryLocation({
    required this.recipient,
    required this.address,
    this.latitude,
    this.longitude,
    this.photoUrls = const [],
  });

  final String recipient;
  final String address;
  final double? latitude;
  final double? longitude;
  final List<String> photoUrls;

  @override
  List<Object?> get props => [
    recipient,
    address,
    latitude,
    longitude,
    photoUrls,
  ];
}

/// An order's full detail for the driver.
final class OrderDetail extends Equatable {
  const OrderDetail({
    required this.id,
    required this.number,
    required this.status,
    required this.payment,
    required this.slotStart,
    required this.slotEnd,
    required this.assignedAt,
    required this.items,
    required this.location,
    required this.customerName,
    required this.customerPhone,
    required this.totalMinor,
    this.specialInstruction,
    this.reason,
  });

  final String id;
  final String number;
  final DeliveryStatus status;
  final PaymentStatus payment;
  final DateTime slotStart;
  final DateTime slotEnd;
  final DateTime assignedAt;
  final List<OrderItem> items;
  final DeliveryLocation location;
  final String customerName;

  /// E.164, for the call button.
  final String customerPhone;

  /// Amount to collect, in minor units (dirham).
  final int totalMinor;
  final String? specialInstruction;

  /// Why it was re-assigned or failed.
  final String? reason;

  /// "3 Items": bottles packs across every line.
  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);

  OrderActions get actions => OrderActions.of(status: status, payment: payment);

  OrderDetail withStatus(DeliveryStatus status, {String? reason}) =>
      OrderDetail(
        id: id,
        number: number,
        status: status,
        payment: status == DeliveryStatus.delivered
            ? PaymentStatus.paid
            : payment,
        slotStart: slotStart,
        slotEnd: slotEnd,
        assignedAt: assignedAt,
        items: items,
        location: location,
        customerName: customerName,
        customerPhone: customerPhone,
        totalMinor: totalMinor,
        specialInstruction: specialInstruction,
        reason: reason ?? this.reason,
      );

  @override
  List<Object?> get props => [
    id,
    number,
    status,
    payment,
    slotStart,
    slotEnd,
    assignedAt,
    items,
    location,
    customerName,
    customerPhone,
    totalMinor,
    specialInstruction,
    reason,
  ];
}
