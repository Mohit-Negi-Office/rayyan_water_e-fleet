import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/utils/validators/qatar_mobile_validator.dart';
import 'package:rayyan_driver/features/auth/domain/entities/auth_error_codes.dart';
import 'package:rayyan_driver/features/auth/domain/entities/phone_number.dart';

part 'login_state.freezed.dart';

/// "Enter Mobile Number". [otpSentCount] goes up each time an OTP is sent,
/// so the page can open the OTP screen once per request.
@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') String digits,
    @Default(false) bool isSubmitting,
    Failure? failure,
    @Default(0) int otpSentCount,
  }) = _LoginState;

  const LoginState._();

  static const Failure _rejectedNumber = ServerFailure(
    code: AuthErrorCodes.invalidPhone,
  );

  PhoneNumber get phone => PhoneNumber.qatar(digits);

  /// "Incorrect Number": a full number that cannot be valid, or one the
  /// server rejected.
  bool get isNumberIncorrect =>
      QatarMobileValidator.check(digits) == PhoneNumberCheck.invalid ||
      failure == _rejectedNumber;

  /// Any other failure, shown above Continue.
  Failure? get otherFailure => isNumberIncorrect ? null : failure;

  bool get canContinue =>
      QatarMobileValidator.check(digits) == PhoneNumberCheck.valid &&
      !isNumberIncorrect &&
      !isSubmitting;
}
