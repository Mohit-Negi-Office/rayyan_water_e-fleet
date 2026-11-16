// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverDetailsModel _$DriverDetailsModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DriverDetailsModel', json, ($checkedConvert) {
      final val = DriverDetailsModel(
        name: $checkedConvert('name', (v) => v as String),
        driverCode: $checkedConvert('driverCode', (v) => v as String),
        email: $checkedConvert('email', (v) => v as String? ?? ''),
        phoneNo: $checkedConvert('phoneNo', (v) => v as String? ?? ''),
        countryCode: $checkedConvert('countryCode', (v) => v as String? ?? ''),
        vehicle: $checkedConvert(
          'vehicle',
          (v) => v == null
              ? null
              : DriverVehicleModel.fromJson(v as Map<String, dynamic>),
        ),
        workDetails: $checkedConvert(
          'workDetails',
          (v) => v == null
              ? null
              : DriverWorkDetailsModel.fromJson(v as Map<String, dynamic>),
        ),
        photo: $checkedConvert('photo', (v) => v as String? ?? ''),
      );
      return val;
    });

Map<String, dynamic> _$DriverDetailsModelToJson(DriverDetailsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'driverCode': instance.driverCode,
      'email': instance.email,
      'phoneNo': instance.phoneNo,
      'countryCode': instance.countryCode,
      'vehicle': instance.vehicle?.toJson(),
      'workDetails': instance.workDetails?.toJson(),
      'photo': instance.photo,
    };

DriverVehicleModel _$DriverVehicleModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DriverVehicleModel', json, ($checkedConvert) {
      final val = DriverVehicleModel(
        vehicleNumber: $checkedConvert(
          'vehicleNumber',
          (v) => v as String? ?? '',
        ),
        routeId: $checkedConvert('routeId', (v) => v as String? ?? ''),
      );
      return val;
    });

Map<String, dynamic> _$DriverVehicleModelToJson(DriverVehicleModel instance) =>
    <String, dynamic>{
      'vehicleNumber': instance.vehicleNumber,
      'routeId': instance.routeId,
    };

DriverWorkDetailsModel _$DriverWorkDetailsModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('DriverWorkDetailsModel', json, ($checkedConvert) {
  final val = DriverWorkDetailsModel(
    zones: $checkedConvert(
      'zones',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => DriverZoneModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    ),
  );
  return val;
});

Map<String, dynamic> _$DriverWorkDetailsModelToJson(
  DriverWorkDetailsModel instance,
) => <String, dynamic>{'zones': instance.zones.map((e) => e.toJson()).toList()};

DriverZoneModel _$DriverZoneModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DriverZoneModel', json, ($checkedConvert) {
      final val = DriverZoneModel(
        name: $checkedConvert('name', (v) => v as String),
        number: $checkedConvert('number', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$DriverZoneModelToJson(DriverZoneModel instance) =>
    <String, dynamic>{'name': instance.name, 'number': instance.number};
