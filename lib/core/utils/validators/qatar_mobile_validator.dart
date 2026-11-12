/// Result of checking a typed mobile number.
enum PhoneNumberCheck {
  /// Still typing: fewer digits than a full number. No error is shown.
  incomplete,

  /// A full-length number that cannot be a Qatar mobile ("Incorrect Number").
  invalid,
  valid,
}

/// Local (+974) mobile numbers: 8 digits starting with 3, 5, 6 or 7.
// TODO(backend): confirm the accepted prefixes.
abstract final class QatarMobileValidator {
  /// Digits in a Qatar mobile number.
  static const int length = 8;

  static const Set<String> _prefixes = {'3', '5', '6', '7'};
  static final RegExp _digits = RegExp(r'^\d*$');

  /// Checks [digits], the number typed after the +974 dial code.
  static PhoneNumberCheck check(String digits) {
    if (!_digits.hasMatch(digits) || digits.length > length) {
      return PhoneNumberCheck.invalid;
    }
    if (digits.length < length) return PhoneNumberCheck.incomplete;
    return _prefixes.contains(digits[0])
        ? PhoneNumberCheck.valid
        : PhoneNumberCheck.invalid;
  }
}
