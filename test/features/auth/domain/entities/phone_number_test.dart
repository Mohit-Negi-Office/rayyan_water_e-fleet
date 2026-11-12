import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/features/auth/domain/entities/phone_number.dart';

void main() {
  group('PhoneNumber', () {
    test('qatar uses +974', () {
      const phone = PhoneNumber.qatar('55876543');
      expect(phone.dialCode, '+974');
      expect(phone.e164, '+97455876543');
    });

    test('tryParse reads a Qatar number in E.164 form', () {
      expect(
        PhoneNumber.tryParse('+97455876543'),
        const PhoneNumber.qatar('55876543'),
      );
    });

    test('tryParse rejects other countries, missing digits and junk', () {
      expect(PhoneNumber.tryParse(null), isNull);
      expect(PhoneNumber.tryParse(''), isNull);
      expect(PhoneNumber.tryParse('+974'), isNull);
      expect(PhoneNumber.tryParse('+97155876543'), isNull);
      expect(PhoneNumber.tryParse('+974 5587'), isNull);
    });
  });
}
