// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverProfileModel _$DriverProfileModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DriverProfileModel',
      json,
      ($checkedConvert) {
        final val = DriverProfileModel(
          name: $checkedConvert('name', (v) => v as String),
          code: $checkedConvert('code', (v) => v as String),
          email: $checkedConvert('email', (v) => v as String),
          dialCode: $checkedConvert('dial_code', (v) => v as String),
          phone: $checkedConvert('phone', (v) => v as String),
          zone: $checkedConvert('zone', (v) => v as String),
          routeId: $checkedConvert('route_id', (v) => v as String),
          vehicleNumber: $checkedConvert('vehicle_number', (v) => v as String),
          photoUrl: $checkedConvert('photo_url', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'dialCode': 'dial_code',
        'routeId': 'route_id',
        'vehicleNumber': 'vehicle_number',
        'photoUrl': 'photo_url',
      },
    );

Map<String, dynamic> _$DriverProfileModelToJson(DriverProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'email': instance.email,
      'dial_code': instance.dialCode,
      'phone': instance.phone,
      'zone': instance.zone,
      'route_id': instance.routeId,
      'vehicle_number': instance.vehicleNumber,
      'photo_url': instance.photoUrl,
    };
