import 'package:rayyan_driver/core/error/app_exception.dart';
import 'package:rayyan_driver/core/network/models/api_response_model.dart';
import 'package:rayyan_driver/features/auth/data/models/auth_session_model.dart';

/// Session and driver from a successful OTP verify.
final class VerifyOtpResultModel {
  const VerifyOtpResultModel({required this.session, required this.driver});

  final AuthSessionModel session;

  /// Driver object as the server sent it, including fields Profile does not show.
  final Map<String, dynamic> driver;

  factory VerifyOtpResultModel.fromBody(Map<String, dynamic> json) {
    final envelope = ApiResponseModel.tryFrom(json);
    final data = envelope?.data;
    if (envelope == null || envelope.hasError || data == null) {
      throw const ServerException('OTP verify response has no session');
    }
    return VerifyOtpResultModel(
      session: _sessionFrom(data['session']),
      driver: _driverFrom(data['driver']),
    );
  }
}

const _sessionKeys = ['sessionId', 'token', 'publicKey', 'refreshToken'];

AuthSessionModel _sessionFrom(Object? raw) {
  if (raw is! Map) {
    throw const ServerException('OTP verify response has no session');
  }
  final json = Map<String, dynamic>.from(raw);
  for (final key in _sessionKeys) {
    final value = json[key];
    if (value is! String || value.isEmpty) {
      throw const ServerException('OTP verify response has no session');
    }
  }
  return AuthSessionModel.fromJson(json);
}

Map<String, dynamic> _driverFrom(Object? raw) {
  if (raw is! Map) {
    throw const ServerException('OTP verify response has no driver');
  }
  final driver = Map<String, dynamic>.from(raw);
  final name = driver['name'];
  final code = driver['driverCode'];
  if (name is! String || name.isEmpty || code is! String || code.isEmpty) {
    throw const ServerException('OTP verify response has no driver');
  }
  return driver;
}
