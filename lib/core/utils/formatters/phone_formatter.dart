/// Phone numbers for display. Widgets keep them left-to-right in Arabic.
abstract final class PhoneFormatter {
  /// "+974 55876543". Digits are not grouped, as on the OTP screen.
  // TODO(design): the login field shows "256 289 9707" (grouped, 10 digits);
  // confirm whether Qatar numbers should be grouped as "5587 6543".
  static String international({
    required String dialCode,
    required String digits,
  }) => digits.isEmpty ? dialCode : '$dialCode $digits';

  /// Digits in groups as on My Details: "256 289 9707" (10 digits) or
  /// "5587 6543" (8 digits); other lengths unchanged.
  static String grouped(String digits) => switch (digits.length) {
    10 =>
      '${digits.substring(0, 3)} ${digits.substring(3, 6)} '
          '${digits.substring(6)}',
    8 => '${digits.substring(0, 4)} ${digits.substring(4)}',
    _ => digits,
  };
}
