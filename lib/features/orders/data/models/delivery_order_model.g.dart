// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryOrderModel _$DeliveryOrderModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DeliveryOrderModel',
      json,
      ($checkedConvert) {
        final val = DeliveryOrderModel(
          id: $checkedConvert('id', (v) => v as String),
          number: $checkedConvert('number', (v) => v as String),
          status: $checkedConvert(
            'status',
            (v) => $enumDecode(
              _$DeliveryStatusDtoEnumMap,
              v,
              unknownValue: DeliveryStatusDto.unknown,
            ),
          ),
          itemCount: $checkedConvert('item_count', (v) => (v as num).toInt()),
          customerName: $checkedConvert('customer_name', (v) => v as String),
          address: $checkedConvert('address', (v) => v as String),
          outcome: $checkedConvert(
            'outcome',
            (v) => $enumDecodeNullable(
              _$DeliveryStatusDtoEnumMap,
              v,
              unknownValue: DeliveryStatusDto.unknown,
            ),
          ),
          paymentStatus: $checkedConvert(
            'payment_status',
            (v) => $enumDecodeNullable(
              _$PaymentStatusDtoEnumMap,
              v,
              unknownValue: PaymentStatusDto.unknown,
            ),
          ),
          slotStart: $checkedConvert(
            'slot_start',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          slotEnd: $checkedConvert(
            'slot_end',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          closedAt: $checkedConvert(
            'closed_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'itemCount': 'item_count',
        'customerName': 'customer_name',
        'paymentStatus': 'payment_status',
        'slotStart': 'slot_start',
        'slotEnd': 'slot_end',
        'closedAt': 'closed_at',
      },
    );

Map<String, dynamic> _$DeliveryOrderModelToJson(DeliveryOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'status': _$DeliveryStatusDtoEnumMap[instance.status]!,
      'outcome': _$DeliveryStatusDtoEnumMap[instance.outcome],
      'item_count': instance.itemCount,
      'customer_name': instance.customerName,
      'address': instance.address,
      'payment_status': _$PaymentStatusDtoEnumMap[instance.paymentStatus],
      'slot_start': instance.slotStart?.toIso8601String(),
      'slot_end': instance.slotEnd?.toIso8601String(),
      'closed_at': instance.closedAt?.toIso8601String(),
    };

const _$DeliveryStatusDtoEnumMap = {
  DeliveryStatusDto.newOrder: 'new_order',
  DeliveryStatusDto.orderPicked: 'order_picked',
  DeliveryStatusDto.dropOff: 'drop_off',
  DeliveryStatusDto.delivered: 'delivered',
  DeliveryStatusDto.cancelled: 'cancelled',
  DeliveryStatusDto.failed: 'failed',
  DeliveryStatusDto.reassigned: 'reassigned',
  DeliveryStatusDto.unknown: 'unknown',
};

const _$PaymentStatusDtoEnumMap = {
  PaymentStatusDto.paid: 'paid',
  PaymentStatusDto.pending: 'pending',
  PaymentStatusDto.unknown: 'unknown',
};
