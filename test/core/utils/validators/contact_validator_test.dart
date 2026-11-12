import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/utils/validators/contact_validator.dart';

void main() {
  test('a blank name is missing', () {
    expect(ContactValidator.name('  '), FieldIssue.missing);
    expect(ContactValidator.name('Ahmed'), isNull);
  });

  test('email is missing, invalid or fine', () {
    expect(ContactValidator.email(''), FieldIssue.missing);
    expect(ContactValidator.email('Ahmed@gmail'), FieldIssue.invalid);
    expect(ContactValidator.email('Ahmed@gmail.com'), isNull);
  });
}
