import 'package:flutter/services.dart';
import 'package:rayyan_driver/core/utils/validators/card_validator.dart';

/// Keeps digits only and shows them in groups of four.
class CardNumberInputFormatter extends TextInputFormatter {
  const CardNumberInputFormatter();

  static const int maxDigits = 19;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (digits.length > maxDigits) digits = digits.substring(0, maxDigits);
    final text = CardValidator.group(digits);
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

/// "MMYY" typed as "MM/YY".
class CardExpiryInputFormatter extends TextInputFormatter {
  const CardExpiryInputFormatter();

  static const int _digits = 4;
  static const int _monthDigits = 2;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (digits.length > _digits) digits = digits.substring(0, _digits);
    final isDeleting = newValue.text.length < oldValue.text.length;
    final text =
        digits.length > _monthDigits ||
            (digits.length == _monthDigits && !isDeleting)
        ? '${digits.substring(0, _monthDigits)}/${digits.substring(_monthDigits)}'
        : digits;
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
