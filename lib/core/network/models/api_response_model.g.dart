// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseModel _$ApiResponseModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ApiResponseModel', json, ($checkedConvert) {
      final val = ApiResponseModel(
        code: $checkedConvert('code', (v) => (v as num).toInt()),
        status: $checkedConvert('status', (v) => v as String),
        timestamp: $checkedConvert('timestamp', (v) => (v as num).toInt()),
        data: $checkedConvert('data', (v) => v as Map<String, dynamic>?),
        error: $checkedConvert(
          'error',
          (v) => v == null
              ? null
              : ApiErrorModel.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ApiResponseModelToJson(ApiResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'timestamp': instance.timestamp,
      'data': instance.data,
      'error': instance.error?.toJson(),
    };

ApiErrorModel _$ApiErrorModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ApiErrorModel', json, ($checkedConvert) {
      final val = ApiErrorModel(
        type: $checkedConvert('type', (v) => v as String),
        data: $checkedConvert('data', (v) => v),
      );
      return val;
    });

Map<String, dynamic> _$ApiErrorModelToJson(ApiErrorModel instance) =>
    <String, dynamic>{'type': instance.type, 'data': instance.data};
