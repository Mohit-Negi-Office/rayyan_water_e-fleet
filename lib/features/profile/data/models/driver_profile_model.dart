import 'package:json_annotation/json_annotation.dart';
import 'package:rayyan_driver/features/profile/domain/entities/driver_profile.dart';

part 'driver_profile_model.g.dart';

// TODO(backend): confirm the field names.
@JsonSerializable()
class DriverProfileModel {
  const DriverProfileModel({
    required this.name,
    required this.code,
    required this.email,
    required this.dialCode,
    required this.phone,
    required this.zone,
    required this.routeId,
    required this.vehicleNumber,
    this.photoUrl,
  });

  factory DriverProfileModel.fromJson(Map<String, dynamic> json) =>
      _$DriverProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$DriverProfileModelToJson(this);

  final String name;
  final String code;
  final String email;
  final String dialCode;
  final String phone;
  final String zone;
  final String routeId;
  final String vehicleNumber;
  final String? photoUrl;

  DriverProfile toEntity() => DriverProfile(
    name: name,
    code: code,
    email: email,
    dialCode: dialCode,
    phoneDigits: phone,
    zone: zone,
    routeId: routeId,
    vehicleNumber: vehicleNumber,
    photoUrl: photoUrl,
  );
}
