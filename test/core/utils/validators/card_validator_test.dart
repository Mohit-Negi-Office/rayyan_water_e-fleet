import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/utils/validators/card_validator.dart';

void main() {
  group('CardValidator.isValidNumber', () {
    test(
      'accepts numbers that pass the Luhn check, with or without spaces',
      () {
        expect(CardValidator.isValidNumber('4111111111111111'), isTrue);
        expect(CardValidator.isValidNumber('4111 1111 1111 1111'), isTrue);
        expect(CardValidator.isValidNumber('5555555555554444'), isTrue);
      },
    );

    test('rejects a wrong check digit, short numbers and letters', () {
      expect(CardValidator.isValidNumber('4111111111111112'), isFalse);
      expect(CardValidator.isValidNumber('411111111111'), isFalse);
      expect(CardValidator.isValidNumber('4111a11111111111'), isFalse);
      expect(CardValidator.isValidNumber(''), isFalse);
    });
  });

  group('CardValidator.isValidExpiry', () {
    final now = DateTime(2026, 10, 19);

    test('accepts this month and later', () {
      expect(CardValidator.isValidExpiry('10/26', now: now), isTrue);
      expect(CardValidator.isValidExpiry('08/28', now: now), isTrue);
    });

    test('rejects past months, bad months and bad shapes', () {
      expect(CardValidator.isValidExpiry('09/26', now: now), isFalse);
      expect(CardValidator.isValidExpiry('13/28', now: now), isFalse);
      expect(CardValidator.isValidExpiry('00/28', now: now), isFalse);
      expect(CardValidator.isValidExpiry('0828', now: now), isFalse);
      expect(CardValidator.isValidExpiry('8/28', now: now), isFalse);
    });
  });

  test('isValidCvv takes 3 or 4 digits', () {
    expect(CardValidator.isValidCvv('242'), isTrue);
    expect(CardValidator.isValidCvv('2424'), isTrue);
    expect(CardValidator.isValidCvv('24'), isFalse);
    expect(CardValidator.isValidCvv('24a'), isFalse);
  });

  group('CardValidator.brandOf', () {
    test('detects the network from the first digits', () {
      expect(CardValidator.brandOf('4111'), CardBrand.visa);
      expect(CardValidator.brandOf('5555 5555'), CardBrand.mastercard);
      expect(CardValidator.brandOf('2221000000000009'), CardBrand.mastercard);
      expect(CardValidator.brandOf('378282246310005'), CardBrand.amex);
      expect(CardValidator.brandOf('6011'), CardBrand.other);
      expect(CardValidator.brandOf(''), CardBrand.other);
    });
  });

  test('group splits digits in fours', () {
    expect(CardValidator.group('9732934224542411'), '9732 9342 2454 2411');
    expect(CardValidator.group('97329'), '9732 9');
    expect(CardValidator.group(''), '');
  });
}
