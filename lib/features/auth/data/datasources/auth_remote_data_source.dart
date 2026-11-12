import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/network/api_client.dart';
import 'package:rayyan_driver/core/network/api_endpoints.dart';
import 'package:rayyan_driver/core/network/app_environment.dart';
import 'package:rayyan_driver/features/auth/data/models/auth_tokens_model.dart';

abstract interface class AuthRemoteDataSource {
  /// [phone] in E.164 form ("+97455876543").
  Future<void> requestOtp(String phone);
  Future<AuthTokensModel> verifyOtp({
    required String phone,
    required String code,
  });
}

// TODO(backend): confirm the driver auth API shape and error codes.
@LazySingleton(as: AuthRemoteDataSource, env: [AppEnvironment.prod])
final class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this._client);

  final ApiClient _client;

  @override
  Future<void> requestOtp(String phone) => _client.post<Map<String, dynamic>>(
    ApiEndpoints.authOtp,
    data: {'phone': phone},
  );

  @override
  Future<AuthTokensModel> verifyOtp({
    required String phone,
    required String code,
  }) async {
    final json = await _client.post<Map<String, dynamic>>(
      ApiEndpoints.authOtpVerify,
      data: {'phone': phone, 'code': code},
    );
    return AuthTokensModel.fromJson(json);
  }
}
