/// OTP rules shown in the design ("4 digit OTP", "00:59").
// TODO(backend): confirm the code length and resend wait.
abstract final class OtpPolicy {
  static const int codeLength = 4;

  /// Seconds before "Resend" is offered.
  static const int resendWaitSeconds = 59;
}
