import 'package:json_annotation/json_annotation.dart';

part 'send_otp_request_model.g.dart';

/// Body of `POST /user-service/v1/otp/send`.
@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class SendOtpRequestModel {
  const SendOtpRequestModel({
    required this.countryCode,
    required this.phoneNumber,
    required this.type,
  });

  /// Login OTP: country code 974 and type LOGIN_DRIVER.
  factory SendOtpRequestModel.loginDriver(String phoneNumber) {
    return SendOtpRequestModel(
      countryCode: qatarCountryCode,
      phoneNumber: phoneNumber,
      type: loginDriverType,
    );
  }

  factory SendOtpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SendOtpRequestModelFromJson(json);

  /// Country calling code without a plus sign.
  static const String qatarCountryCode = '974';

  /// OTP purpose for driver login.
  static const String loginDriverType = 'LOGIN_DRIVER';

  Map<String, dynamic> toJson() => _$SendOtpRequestModelToJson(this);

  @JsonKey(name: 'countryCode')
  final String countryCode;

  @JsonKey(name: 'phoneNumber')
  final String phoneNumber;

  @JsonKey(name: 'type')
  final String type;
}
