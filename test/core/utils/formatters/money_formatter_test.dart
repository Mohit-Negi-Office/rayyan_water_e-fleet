import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/utils/formatters/money_formatter.dart';

void main() {
  group('MoneyFormatter.format', () {
    test('always shows two decimals with the QAR prefix', () {
      expect(MoneyFormatter.format(96), 'QAR 96.00');
      expect(MoneyFormatter.format(112.5), 'QAR 112.50');
    });

    test('formats zero', () {
      expect(MoneyFormatter.format(0), 'QAR 0.00');
    });

    test('rounds to the nearest dirham', () {
      expect(MoneyFormatter.format(19.996), 'QAR 20.00');
      expect(MoneyFormatter.format(6.004), 'QAR 6.00');
    });

    test('groups thousands', () {
      expect(MoneyFormatter.format(1250), 'QAR 1,250.00');
    });

    test('puts the minus sign before the currency', () {
      expect(MoneyFormatter.format(-6), '-QAR 6.00');
    });

    test('uses Western digits regardless of locale', () {
      expect(MoneyFormatter.format(150, locale: 'ar'), 'QAR 150.00');
    });
  });

  group('MoneyFormatter.formatMinor', () {
    test('converts minor units (dirhams) to QAR', () {
      expect(MoneyFormatter.formatMinor(9600), 'QAR 96.00');
      expect(MoneyFormatter.formatMinor(11250), 'QAR 112.50');
      expect(MoneyFormatter.formatMinor(5), 'QAR 0.05');
    });

    test('handles negative minor units', () {
      expect(MoneyFormatter.formatMinor(-600), '-QAR 6.00');
    });
  });
}
