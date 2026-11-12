import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/widgets/inputs/card_input_formatters.dart';

TextEditingValue _type(TextInputFormatter f, String before, String after) =>
    f.formatEditUpdate(
      TextEditingValue(text: before),
      TextEditingValue(text: after),
    );

void main() {
  test('card number groups digits and drops the rest', () {
    const f = CardNumberInputFormatter();
    expect(_type(f, '', '97329342a2454').text, '9732 9342 2454');
    expect(_type(f, '', '4' * 25).text.replaceAll(' ', '').length, 19);
  });

  test('expiry adds the slash after the month', () {
    const f = CardExpiryInputFormatter();
    expect(_type(f, '0', '08').text, '08/');
    expect(_type(f, '08/', '08/2').text, '08/2');
    expect(_type(f, '08/28', '08/289').text, '08/28');
    expect(_type(f, '08/', '08').text, '08');
  });
}
