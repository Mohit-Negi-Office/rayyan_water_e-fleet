import 'package:json_annotation/json_annotation.dart';
import 'package:rayyan_driver/features/profile/domain/entities/driver_profile.dart';

part 'driver_details_model.g.dart';

/// Driver object returned by OTP verify, mapped onto [DriverProfile].
@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class DriverDetailsModel {
  const DriverDetailsModel({
    required this.name,
    required this.driverCode,
    this.email = '',
    this.phoneNo = '',
    this.countryCode = '',
    this.vehicle,
    this.workDetails,
    this.photo = '',
  });

  factory DriverDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$DriverDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DriverDetailsModelToJson(this);

  final String name;
  final String driverCode;

  @JsonKey(defaultValue: '')
  final String email;

  @JsonKey(defaultValue: '')
  final String phoneNo;

  /// Digits such as `974`, or a code that already starts with `+`.
  @JsonKey(defaultValue: '')
  final String countryCode;

  final DriverVehicleModel? vehicle;
  final DriverWorkDetailsModel? workDetails;

  /// Complete photo URL from OTP verify. Empty when the driver has none.
  @JsonKey(name: 'photo', defaultValue: '')
  final String photo;

  DriverProfile toEntity() => DriverProfile(
    name: name,
    code: driverCode,
    email: email,
    dialCode: _dialCode(countryCode),
    phoneDigits: phoneNo,
    zone: workDetails?.zoneLabel ?? '',
    routeId: vehicle?.routeId ?? '',
    vehicleNumber: vehicle?.vehicleNumber ?? '',
    photoUrl: _photoUrl(photo),
  );
}

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class DriverVehicleModel {
  const DriverVehicleModel({this.vehicleNumber = '', this.routeId = ''});

  factory DriverVehicleModel.fromJson(Map<String, dynamic> json) =>
      _$DriverVehicleModelFromJson(json);

  Map<String, dynamic> toJson() => _$DriverVehicleModelToJson(this);

  @JsonKey(defaultValue: '')
  final String vehicleNumber;

  @JsonKey(defaultValue: '')
  final String routeId;
}

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class DriverWorkDetailsModel {
  const DriverWorkDetailsModel({required this.zones});

  factory DriverWorkDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$DriverWorkDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DriverWorkDetailsModelToJson(this);

  @JsonKey(defaultValue: <DriverZoneModel>[])
  final List<DriverZoneModel> zones;

  /// Zone numbers for My Details, such as "1, 2".
  String get zoneLabel =>
      zones.map((zone) => zone.number).whereType<int>().join(', ');
}

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class DriverZoneModel {
  const DriverZoneModel({required this.name, this.number});

  factory DriverZoneModel.fromJson(Map<String, dynamic> json) =>
      _$DriverZoneModelFromJson(json);

  Map<String, dynamic> toJson() => _$DriverZoneModelToJson(this);

  final String name;
  final int? number;
}

String _dialCode(String countryCode) {
  final code = countryCode.trim();
  if (code.isEmpty || code.startsWith('+')) return code;
  return '+$code';
}

String? _photoUrl(String photo) {
  final value = photo.trim();
  return value.isEmpty ? null : value;
}
