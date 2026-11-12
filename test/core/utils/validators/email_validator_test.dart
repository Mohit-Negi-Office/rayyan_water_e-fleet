import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/utils/validators/email_validator.dart';

void main() {
  group('EmailValidator.isValid', () {
    test('accepts ordinary addresses', () {
      expect(EmailValidator.isValid('Ahmed@gmail.com'), isTrue);
      expect(EmailValidator.isValid('ahmed.al-thani+orders@mail.qa'), isTrue);
    });

    test('ignores surrounding spaces', () {
      expect(EmailValidator.isValid('  ahmed@gmail.com '), isTrue);
    });

    test('rejects an address without a domain suffix', () {
      expect(EmailValidator.isValid('Ahmed@gmail'), isFalse);
    });

    test('rejects empty, missing @ and inner spaces', () {
      expect(EmailValidator.isValid(''), isFalse);
      expect(EmailValidator.isValid('ahmed.gmail.com'), isFalse);
      expect(EmailValidator.isValid('ahmed @gmail.com'), isFalse);
      expect(EmailValidator.isValid('ahmed@@gmail.com'), isFalse);
      expect(EmailValidator.isValid('@gmail.com'), isFalse);
    });

    test('rejects a one-letter domain suffix', () {
      expect(EmailValidator.isValid('ahmed@gmail.c'), isFalse);
    });
  });
}
