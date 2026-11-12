import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/auth/domain/entities/phone_number.dart';

abstract interface class AuthRepository {
  /// Sends an OTP by SMS to a registered driver's [phone] (also Resend).
  Future<Result<void>> requestOtp(PhoneNumber phone);

  /// Checks [code] and keeps the session tokens when it is correct.
  Future<Result<void>> verifyOtp(PhoneNumber phone, String code);

  /// Whether a session from an earlier launch is still stored.
  Future<Result<bool>> hasSession();

  /// Ends the session on the server and forgets the tokens.
  Future<Result<void>> logout();
}
