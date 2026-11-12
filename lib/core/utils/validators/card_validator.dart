/// Card networks shown next to saved cards.
enum CardBrand { visa, mastercard, amex, other }

/// Card number, expiry and CVV checks for "Add New Card". The payment
/// gateway has the final word.
abstract final class CardValidator {
  static const int _minLength = 13;
  static const int _maxLength = 19;
  static const int _groupSize = 4;
  static final RegExp _digits = RegExp(r'^\d+$');
  static final RegExp _expiry = RegExp(r'^(\d{2})/(\d{2})$');
  static final RegExp _cvv = RegExp(r'^\d{3,4}$');

  /// [number] may contain spaces.
  static bool isValidNumber(String number) {
    final digits = number.replaceAll(' ', '');
    if (!_digits.hasMatch(digits)) return false;
    if (digits.length < _minLength || digits.length > _maxLength) return false;
    var sum = 0;
    for (var i = 0; i < digits.length; i++) {
      var d = int.parse(digits[digits.length - 1 - i]);
      if (i.isOdd) {
        d *= 2;
        if (d > 9) d -= 9;
      }
      sum += d;
    }
    return sum % 10 == 0;
  }

  /// "MM/YY", this month or later.
  static bool isValidExpiry(String value, {required DateTime now}) {
    final match = _expiry.firstMatch(value);
    if (match == null) return false;
    final month = int.parse(match.group(1)!);
    final year = 2000 + int.parse(match.group(2)!);
    if (month < 1 || month > 12) return false;
    return year > now.year || (year == now.year && month >= now.month);
  }

  static bool isValidCvv(String value) => _cvv.hasMatch(value);

  static CardBrand brandOf(String number) {
    final digits = number.replaceAll(' ', '');
    if (digits.startsWith('4')) return CardBrand.visa;
    if (digits.startsWith('34') || digits.startsWith('37')) {
      return CardBrand.amex;
    }
    final two = digits.length >= 2 ? int.parse(digits.substring(0, 2)) : 0;
    final four = digits.length >= 4 ? int.parse(digits.substring(0, 4)) : 0;
    if ((two >= 51 && two <= 55) || (four >= 2221 && four <= 2720)) {
      return CardBrand.mastercard;
    }
    return CardBrand.other;
  }

  /// "9732 9342 2454 2411".
  static String group(String digits) {
    final buffer = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      if (i > 0 && i % _groupSize == 0) buffer.write(' ');
      buffer.write(digits[i]);
    }
    return buffer.toString();
  }
}
