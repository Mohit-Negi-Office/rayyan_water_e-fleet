// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'OrderItemModel',
      json,
      ($checkedConvert) {
        final val = OrderItemModel(
          name: $checkedConvert('name', (v) => v as String),
          volumeMl: $checkedConvert('volume_ml', (v) => (v as num).toInt()),
          bottles: $checkedConvert('bottles', (v) => (v as num).toInt()),
          quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
          imageUrl: $checkedConvert('image_url', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'volumeMl': 'volume_ml', 'imageUrl': 'image_url'},
    );

Map<String, dynamic> _$OrderItemModelToJson(OrderItemModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'volume_ml': instance.volumeMl,
      'bottles': instance.bottles,
      'quantity': instance.quantity,
      'image_url': instance.imageUrl,
    };

DeliveryLocationModel _$DeliveryLocationModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('DeliveryLocationModel', json, ($checkedConvert) {
  final val = DeliveryLocationModel(
    recipient: $checkedConvert('recipient', (v) => v as String),
    address: $checkedConvert('address', (v) => v as String),
    latitude: $checkedConvert('latitude', (v) => (v as num?)?.toDouble()),
    longitude: $checkedConvert('longitude', (v) => (v as num?)?.toDouble()),
    photoUrls: $checkedConvert(
      'photo_urls',
      (v) =>
          (v as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
    ),
  );
  return val;
}, fieldKeyMap: const {'photoUrls': 'photo_urls'});

Map<String, dynamic> _$DeliveryLocationModelToJson(
  DeliveryLocationModel instance,
) => <String, dynamic>{
  'recipient': instance.recipient,
  'address': instance.address,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'photo_urls': instance.photoUrls,
};

OrderDetailModel _$OrderDetailModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'OrderDetailModel',
  json,
  ($checkedConvert) {
    final val = OrderDetailModel(
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
      paymentStatus: $checkedConvert(
        'payment_status',
        (v) => $enumDecode(
          _$PaymentStatusDtoEnumMap,
          v,
          unknownValue: PaymentStatusDto.unknown,
        ),
      ),
      slotStart: $checkedConvert(
        'slot_start',
        (v) => DateTime.parse(v as String),
      ),
      slotEnd: $checkedConvert('slot_end', (v) => DateTime.parse(v as String)),
      assignedAt: $checkedConvert(
        'assigned_at',
        (v) => DateTime.parse(v as String),
      ),
      items: $checkedConvert(
        'items',
        (v) => (v as List<dynamic>)
            .map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      location: $checkedConvert(
        'location',
        (v) => DeliveryLocationModel.fromJson(v as Map<String, dynamic>),
      ),
      customerName: $checkedConvert('customer_name', (v) => v as String),
      customerPhone: $checkedConvert('customer_phone', (v) => v as String),
      totalAmount: $checkedConvert('total_amount', (v) => (v as num).toInt()),
      specialInstruction: $checkedConvert(
        'special_instruction',
        (v) => v as String?,
      ),
      reason: $checkedConvert('reason', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'paymentStatus': 'payment_status',
    'slotStart': 'slot_start',
    'slotEnd': 'slot_end',
    'assignedAt': 'assigned_at',
    'customerName': 'customer_name',
    'customerPhone': 'customer_phone',
    'totalAmount': 'total_amount',
    'specialInstruction': 'special_instruction',
  },
);

Map<String, dynamic> _$OrderDetailModelToJson(OrderDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'status': _$DeliveryStatusDtoEnumMap[instance.status]!,
      'payment_status': _$PaymentStatusDtoEnumMap[instance.paymentStatus]!,
      'slot_start': instance.slotStart.toIso8601String(),
      'slot_end': instance.slotEnd.toIso8601String(),
      'assigned_at': instance.assignedAt.toIso8601String(),
      'items': instance.items.map((e) => e.toJson()).toList(),
      'location': instance.location.toJson(),
      'customer_name': instance.customerName,
      'customer_phone': instance.customerPhone,
      'total_amount': instance.totalAmount,
      'special_instruction': instance.specialInstruction,
      'reason': instance.reason,
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
