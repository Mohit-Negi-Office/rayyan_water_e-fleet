// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpRequestModel _$VerifyOtpRequestModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('VerifyOtpRequestModel', json, ($checkedConvert) {
  final val = VerifyOtpRequestModel(
    countryCode: $checkedConvert('countryCode', (v) => v as String),
    phoneNumber: $checkedConvert('phoneNumber', (v) => v as String),
    otp: $checkedConvert('otp', (v) => v as String),
    type: $checkedConvert('type', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$VerifyOtpRequestModelToJson(
  VerifyOtpRequestModel instance,
) => <String, dynamic>{
  'countryCode': instance.countryCode,
  'phoneNumber': instance.phoneNumber,
  'otp': instance.otp,
  'type': instance.type,
};
