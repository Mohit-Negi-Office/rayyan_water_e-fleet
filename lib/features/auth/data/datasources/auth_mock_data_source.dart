import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/app_exception.dart';
import 'package:rayyan_driver/core/network/app_environment.dart';
import 'package:rayyan_driver/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:rayyan_driver/features/auth/data/models/auth_tokens_model.dart';
import 'package:rayyan_driver/features/auth/domain/entities/auth_error_codes.dart';

/// Demo login for design review: any valid Qatar mobile gets an OTP and
/// every code except [wrongCode] is accepted.
@LazySingleton(as: AuthRemoteDataSource, env: [AppEnvironment.mock])
final class AuthMockDataSource implements AuthRemoteDataSource {
  const AuthMockDataSource();

  static const String wrongCode = '0000';
  static const Duration _latency = Duration(milliseconds: 400);

  @override
  Future<void> requestOtp(String phone) => Future<void>.delayed(_latency);

  @override
  Future<AuthTokensModel> verifyOtp({
    required String phone,
    required String code,
  }) async {
    await Future<void>.delayed(_latency);
    if (code == wrongCode) {
      throw const ServerException(
        'Incorrect OTP',
        code: AuthErrorCodes.invalidOtp,
      );
    }
    return const AuthTokensModel(
      accessToken: 'mock-access',
      refreshToken: 'mock-refresh',
    );
  }
}
