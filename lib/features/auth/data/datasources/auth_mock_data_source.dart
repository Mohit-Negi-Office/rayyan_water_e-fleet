import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/app_exception.dart';
import 'package:rayyan_driver/core/network/app_environment.dart';
import 'package:rayyan_driver/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:rayyan_driver/features/auth/data/models/auth_session_model.dart';
import 'package:rayyan_driver/features/auth/data/models/verify_otp_result_model.dart';
import 'package:rayyan_driver/features/auth/domain/entities/auth_error_codes.dart';

/// Demo login for design review: any valid Qatar mobile gets an OTP and
/// every code except [wrongCode] is accepted.
@LazySingleton(as: AuthRemoteDataSource, env: [AppEnvironment.mock])
final class AuthMockDataSource implements AuthRemoteDataSource {
  const AuthMockDataSource();

  static const String wrongCode = '0000';
  static const Duration _latency = Duration(milliseconds: 400);

  /// The driver drawn on the Profile frames, in the verify-response shape.
  static const Map<String, dynamic> driver = {
    'name': 'Ahmed Mirza',
    'driverCode': 'AD16426',
    'email': 'ahmed.mirza@gmail.com',
    'phoneNo': '2562899707',
    'countryCode': '971',
    'vehicle': {'vehicleNumber': 'QA0922', 'routeId': 'RT-021'},
    'workDetails': {
      'zones': [
        {'name': '2', 'number': 2},
      ],
    },
    'photo': 'assets/images/mock/driver_avatar_square.jpg',
  };

  @override
  Future<void> requestOtp(String phoneNumber) => Future<void>.delayed(_latency);

  @override
  Future<VerifyOtpResultModel> verifyOtp({
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
    return const VerifyOtpResultModel(
      session: AuthSessionModel(
        sessionId: 'mock-session',
        token: 'mock-access',
        publicKey: 'mock-public-key',
        refreshToken: 'mock-refresh',
      ),
      driver: driver,
    );
  }
}
