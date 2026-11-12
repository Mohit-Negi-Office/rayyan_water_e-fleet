import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/utils/formatters/phone_formatter.dart';

void main() {
  group('PhoneFormatter.international', () {
    test('joins the dial code and the number with a space', () {
      expect(
        PhoneFormatter.international(dialCode: '+974', digits: '55876543'),
        '+974 55876543',
      );
    });

    test('shows the dial code alone when there is no number', () {
      expect(
        PhoneFormatter.international(dialCode: '+974', digits: ''),
        '+974',
      );
    });
  });

  group('grouped', () {
    test('a ten-digit number reads "256 289 9707"', () {
      expect(PhoneFormatter.grouped('2562899707'), '256 289 9707');
    });

    test('an eight-digit Qatar number reads "5587 6543"', () {
      expect(PhoneFormatter.grouped('55876543'), '5587 6543');
    });

    test('other lengths are left as they are', () {
      expect(PhoneFormatter.grouped('12345'), '12345');
    });
  });
}
