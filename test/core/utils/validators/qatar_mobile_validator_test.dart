import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/utils/validators/qatar_mobile_validator.dart';

void main() {
  group('QatarMobileValidator.check', () {
    test('is incomplete while fewer than 8 digits are typed', () {
      expect(QatarMobileValidator.check(''), PhoneNumberCheck.incomplete);
      expect(QatarMobileValidator.check('5587'), PhoneNumberCheck.incomplete);
      expect(
        QatarMobileValidator.check('5587654'),
        PhoneNumberCheck.incomplete,
      );
    });

    test('accepts 8 digits starting with 3, 5, 6 or 7', () {
      for (final number in ['33123456', '55876543', '66123456', '77123456']) {
        expect(
          QatarMobileValidator.check(number),
          PhoneNumberCheck.valid,
          reason: number,
        );
      }
    });

    test('rejects 8 digits with another first digit', () {
      for (final number in ['25628997', '44123456', '01234567', '99123456']) {
        expect(
          QatarMobileValidator.check(number),
          PhoneNumberCheck.invalid,
          reason: number,
        );
      }
    });

    test('rejects more than 8 digits', () {
      expect(
        QatarMobileValidator.check('2562899707'),
        PhoneNumberCheck.invalid,
      );
    });

    test('rejects anything that is not a digit', () {
      expect(QatarMobileValidator.check('5587 654'), PhoneNumberCheck.invalid);
      expect(QatarMobileValidator.check('+5587654'), PhoneNumberCheck.invalid);
      expect(QatarMobileValidator.check('5587654a'), PhoneNumberCheck.invalid);
    });
  });
}
