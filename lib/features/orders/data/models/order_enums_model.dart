import 'package:json_annotation/json_annotation.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_status.dart';
import 'package:rayyan_driver/features/orders/domain/entities/fail_reason.dart';
import 'package:rayyan_driver/features/orders/domain/entities/payment_status.dart';

/// Order status on the wire.
// TODO(backend): confirm the status values.
@JsonEnum(fieldRename: FieldRename.snake)
enum DeliveryStatusDto {
  newOrder,
  orderPicked,
  dropOff,
  delivered,
  cancelled,
  failed,
  reassigned,

  /// A status this build does not know: shown as closed, never actionable.
  unknown;

  DeliveryStatus toDomain() => switch (this) {
    newOrder => DeliveryStatus.newOrder,
    orderPicked => DeliveryStatus.orderPicked,
    dropOff => DeliveryStatus.dropOff,
    delivered => DeliveryStatus.delivered,
    cancelled || unknown => DeliveryStatus.cancelled,
    failed => DeliveryStatus.failed,
    reassigned => DeliveryStatus.reassigned,
  };

  static DeliveryStatusDto fromDomain(DeliveryStatus status) =>
      DeliveryStatusDto.values.byName(status.name);
}

@JsonEnum(fieldRename: FieldRename.snake)
enum PaymentStatusDto {
  paid,
  pending,

  /// Unknown payment: treated as still to collect.
  unknown;

  PaymentStatus toDomain() => switch (this) {
    paid => PaymentStatus.paid,
    pending || unknown => PaymentStatus.pending,
  };
}

/// Fail reason codes sent to the API.
const Map<FailReason, String> failReasonCodes = {
  FailReason.customerNotAvailable: 'customer_not_available',
  FailReason.wrongAddress: 'wrong_address',
  FailReason.accessDenied: 'access_denied',
  FailReason.packageDamaged: 'package_damaged',
  FailReason.refusedDelivery: 'refused_delivery',
  FailReason.other: 'other',
};
