/// `ServerFailure.code`s the login screens show specific copy for.
// TODO(backend): confirm the rejected-phone error type.
abstract final class AuthErrorCodes {
  static const String invalidPhone = 'invalid_phone';

  /// `error.type` when the OTP is wrong.
  static const String invalidOtp = 'OTP_INVALID';
}
