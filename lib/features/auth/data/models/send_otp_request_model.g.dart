// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendOtpRequestModel _$SendOtpRequestModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SendOtpRequestModel', json, ($checkedConvert) {
      final val = SendOtpRequestModel(
        countryCode: $checkedConvert('countryCode', (v) => v as String),
        phoneNumber: $checkedConvert('phoneNumber', (v) => v as String),
        type: $checkedConvert('type', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$SendOtpRequestModelToJson(
  SendOtpRequestModel instance,
) => <String, dynamic>{
  'countryCode': instance.countryCode,
  'phoneNumber': instance.phoneNumber,
  'type': instance.type,
};
