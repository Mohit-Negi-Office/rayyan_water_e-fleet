// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthSessionModel _$AuthSessionModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AuthSessionModel', json, ($checkedConvert) {
      final val = AuthSessionModel(
        sessionId: $checkedConvert('sessionId', (v) => v as String),
        token: $checkedConvert('token', (v) => v as String),
        publicKey: $checkedConvert('publicKey', (v) => v as String),
        refreshToken: $checkedConvert('refreshToken', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$AuthSessionModelToJson(AuthSessionModel instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'token': instance.token,
      'publicKey': instance.publicKey,
      'refreshToken': instance.refreshToken,
    };
