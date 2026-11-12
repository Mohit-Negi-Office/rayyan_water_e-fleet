import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/utils/formatters/ordinal_formatter.dart';

void main() {
  test('English ordinals', () {
    final cases = {
      1: '1st',
      2: '2nd',
      3: '3rd',
      4: '4th',
      11: '11th',
      12: '12th',
      13: '13th',
      21: '21st',
      22: '22nd',
      23: '23rd',
      28: '28th',
    };
    for (final MapEntry(:key, :value) in cases.entries) {
      expect(OrdinalFormatter.format(key, 'en'), value, reason: '$key');
    }
  });

  test('Arabic shows the plain number', () {
    expect(OrdinalFormatter.format(12, 'ar'), '12');
  });
}
