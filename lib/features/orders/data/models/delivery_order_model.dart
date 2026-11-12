import 'package:json_annotation/json_annotation.dart';
import 'package:rayyan_driver/features/orders/data/models/order_enums_model.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_order.dart';

part 'delivery_order_model.g.dart';

/// An order in a list.
// TODO(backend): confirm the field names.
@JsonSerializable()
class DeliveryOrderModel {
  const DeliveryOrderModel({
    required this.id,
    required this.number,
    required this.status,
    required this.itemCount,
    required this.customerName,
    required this.address,
    this.outcome,
    this.paymentStatus,
    this.slotStart,
    this.slotEnd,
    this.closedAt,
  });

  factory DeliveryOrderModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryOrderModelToJson(this);

  final String id;
  final String number;
  @JsonKey(unknownEnumValue: DeliveryStatusDto.unknown)
  final DeliveryStatusDto status;
  @JsonKey(unknownEnumValue: DeliveryStatusDto.unknown)
  final DeliveryStatusDto? outcome;
  final int itemCount;
  final String customerName;
  final String address;
  @JsonKey(unknownEnumValue: PaymentStatusDto.unknown)
  final PaymentStatusDto? paymentStatus;
  final DateTime? slotStart;
  final DateTime? slotEnd;
  final DateTime? closedAt;

  DeliveryOrder toEntity() => DeliveryOrder(
    id: id,
    number: number,
    status: status.toDomain(),
    outcome: outcome?.toDomain(),
    itemCount: itemCount,
    customerName: customerName,
    address: address,
    payment: paymentStatus?.toDomain(),
    slotStart: slotStart?.toLocal(),
    slotEnd: slotEnd?.toLocal(),
    closedAt: closedAt?.toLocal(),
  );
}
