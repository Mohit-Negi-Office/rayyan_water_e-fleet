import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/network/api_client.dart';
import 'package:rayyan_driver/core/network/api_endpoints.dart';
import 'package:rayyan_driver/core/network/app_config.dart';
import 'package:rayyan_driver/core/network/app_environment.dart';
import 'package:rayyan_driver/core/network/basic_authorization.dart';
import 'package:rayyan_driver/core/network/device_type.dart';
import 'package:rayyan_driver/features/auth/data/models/send_otp_request_model.dart';
import 'package:rayyan_driver/features/auth/data/models/verify_otp_request_model.dart';
import 'package:rayyan_driver/features/auth/data/models/verify_otp_result_model.dart';

abstract interface class AuthRemoteDataSource {
  /// [phoneNumber] is the local digits the driver typed.
  Future<void> requestOtp(String phoneNumber);

  /// [phone] is the local digits the driver typed.
  Future<VerifyOtpResultModel> verifyOtp({
    required String phone,
    required String code,
  });

  /// Ends the session on the server. Bearer auth and `device-id` come from
  /// the shared interceptors; the body is empty.
  Future<void> logout();
}

// TODO(backend): confirm the OTP error codes.
@LazySingleton(as: AuthRemoteDataSource, env: [AppEnvironment.prod])
final class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this._client, this._deviceType);

  final ApiClient _client;
  final DeviceTypeReader _deviceType;

  @override
  Future<void> requestOtp(String phoneNumber) => _client.postAllowingEmpty(
    ApiEndpoints.authOtp,
    data: SendOtpRequestModel.loginDriver(phoneNumber).toJson(),
    headers: _basicAuthHeaders,
  );

  @override
  Future<VerifyOtpResultModel> verifyOtp({
    required String phone,
    required String code,
  }) async {
    final json = await _client.post<Map<String, dynamic>>(
      ApiEndpoints.authOtpVerify,
      data: VerifyOtpRequestModel.loginDriver(
        phoneNumber: phone,
        otp: code,
      ).toJson(),
      headers: {
        ..._basicAuthHeaders,
        ApiEndpoints.deviceTypeHeader: _deviceType.read(),
        ApiEndpoints.aesKeyHeader: ApiEndpoints.aesKey,
        ApiEndpoints.deviceTokenHeader: ApiEndpoints.deviceToken,
      },
    );
    return VerifyOtpResultModel.fromBody(json);
  }

  @override
  Future<void> logout() =>
      _client.postAllowingEmpty(ApiEndpoints.driverLogout, data: '');

  Map<String, dynamic> get _basicAuthHeaders => {
    BasicAuthorization.header: BasicAuthorization.value(
      username: AppConfig.basicAuthUsername,
      password: AppConfig.basicAuthPassword,
    ),
  };
}
