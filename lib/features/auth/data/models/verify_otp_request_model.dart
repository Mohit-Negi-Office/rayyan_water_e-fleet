import 'package:json_annotation/json_annotation.dart';
import 'package:rayyan_driver/features/auth/data/models/send_otp_request_model.dart';

part 'verify_otp_request_model.g.dart';

/// Body of `POST /user-service/v1/otp/verify`.
@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class VerifyOtpRequestModel {
  const VerifyOtpRequestModel({
    required this.countryCode,
    required this.phoneNumber,
    required this.otp,
    required this.type,
  });

  /// Login OTP: country code 974, the typed code, and type LOGIN_DRIVER.
  factory VerifyOtpRequestModel.loginDriver({
    required String phoneNumber,
    required String otp,
  }) {
    return VerifyOtpRequestModel(
      countryCode: SendOtpRequestModel.qatarCountryCode,
      phoneNumber: phoneNumber,
      otp: otp,
      type: SendOtpRequestModel.loginDriverType,
    );
  }

  factory VerifyOtpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOtpRequestModelToJson(this);

  @JsonKey(name: 'countryCode')
  final String countryCode;

  @JsonKey(name: 'phoneNumber')
  final String phoneNumber;

  @JsonKey(name: 'otp')
  final String otp;

  @JsonKey(name: 'type')
  final String type;
}
