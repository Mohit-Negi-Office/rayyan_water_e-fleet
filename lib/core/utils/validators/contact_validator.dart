import 'package:rayyan_driver/core/utils/validators/email_validator.dart';

/// Why a name or email field shows an error.
enum FieldIssue {
  /// "Enter your name" / "Enter your email".
  missing,

  /// "Incorrect email".
  invalid,
}

/// Name and email rules shared by Fill Your Details and Edit Profile.
abstract final class ContactValidator {
  static FieldIssue? name(String value) =>
      value.trim().isEmpty ? FieldIssue.missing : null;

  static FieldIssue? email(String value) {
    if (value.trim().isEmpty) return FieldIssue.missing;
    return EmailValidator.isValid(value) ? null : FieldIssue.invalid;
  }
}
