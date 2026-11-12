import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/features/auth/domain/entities/auth_error_codes.dart';
import 'package:rayyan_driver/features/auth/domain/entities/otp_policy.dart';
import 'package:rayyan_driver/features/auth/domain/entities/phone_number.dart';

part 'otp_state.freezed.dart';

/// "Verify Mobile Number". [isVerified] turns true once the code is correct.
@freezed
abstract class OtpState with _$OtpState {
  const factory OtpState({
    required PhoneNumber phone,
    @Default('') String code,
    @Default(0) int secondsLeft,
    @Default(false) bool isVerifying,
    @Default(false) bool isResending,
    Failure? failure,
    @Default(false) bool isVerified,
  }) = _OtpState;

  const OtpState._();

  static const Failure _wrongCode = ServerFailure(
    code: AuthErrorCodes.invalidOtp,
  );

  bool get isComplete => code.length == OtpPolicy.codeLength;

  /// "Incorrect OTP".
  bool get isIncorrect => failure == _wrongCode;

  /// Verify stays off after a failure until the code is edited.
  bool get canVerify =>
      isComplete && !isVerifying && failure == null && !isVerified;

  bool get canResend => secondsLeft == 0 && !isResending && !isVerifying;
}
