import 'package:json_annotation/json_annotation.dart';
import 'package:rayyan_driver/features/orders/data/models/order_enums_model.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_detail.dart';

part 'order_detail_model.g.dart';

// TODO(backend): confirm the field names.
@JsonSerializable()
class OrderItemModel {
  const OrderItemModel({
    required this.name,
    required this.volumeMl,
    required this.bottles,
    required this.quantity,
    this.imageUrl,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemModelToJson(this);

  final String name;
  final int volumeMl;
  final int bottles;
  final int quantity;
  final String? imageUrl;

  OrderItem toEntity() => OrderItem(
    name: name,
    volumeMl: volumeMl,
    bottles: bottles,
    quantity: quantity,
    imageUrl: imageUrl,
  );
}

@JsonSerializable()
class DeliveryLocationModel {
  const DeliveryLocationModel({
    required this.recipient,
    required this.address,
    this.latitude,
    this.longitude,
    this.photoUrls = const [],
  });

  factory DeliveryLocationModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryLocationModelToJson(this);

  final String recipient;
  final String address;
  final double? latitude;
  final double? longitude;
  final List<String> photoUrls;

  DeliveryLocation toEntity() => DeliveryLocation(
    recipient: recipient,
    address: address,
    latitude: latitude,
    longitude: longitude,
    photoUrls: photoUrls,
  );
}

@JsonSerializable()
class OrderDetailModel {
  const OrderDetailModel({
    required this.id,
    required this.number,
    required this.status,
    required this.paymentStatus,
    required this.slotStart,
    required this.slotEnd,
    required this.assignedAt,
    required this.items,
    required this.location,
    required this.customerName,
    required this.customerPhone,
    required this.totalAmount,
    this.specialInstruction,
    this.reason,
  });

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailModelToJson(this);

  final String id;
  final String number;
  @JsonKey(unknownEnumValue: DeliveryStatusDto.unknown)
  final DeliveryStatusDto status;
  @JsonKey(unknownEnumValue: PaymentStatusDto.unknown)
  final PaymentStatusDto paymentStatus;
  final DateTime slotStart;
  final DateTime slotEnd;
  final DateTime assignedAt;
  final List<OrderItemModel> items;
  final DeliveryLocationModel location;
  final String customerName;
  final String customerPhone;

  /// Minor units (dirham).
  final int totalAmount;
  final String? specialInstruction;
  final String? reason;

  OrderDetail toEntity() => OrderDetail(
    id: id,
    number: number,
    status: status.toDomain(),
    payment: paymentStatus.toDomain(),
    slotStart: slotStart.toLocal(),
    slotEnd: slotEnd.toLocal(),
    assignedAt: assignedAt.toLocal(),
    items: [for (final item in items) item.toEntity()],
    location: location.toEntity(),
    customerName: customerName,
    customerPhone: customerPhone,
    totalMinor: totalAmount,
    specialInstruction: specialInstruction,
    reason: reason,
  );
}
