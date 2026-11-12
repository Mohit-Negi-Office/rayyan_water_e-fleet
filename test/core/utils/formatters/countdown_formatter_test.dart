import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/utils/formatters/countdown_formatter.dart';

void main() {
  group('CountdownFormatter.format', () {
    test('pads minutes and seconds to two digits', () {
      expect(CountdownFormatter.format(59), '00:59');
      expect(CountdownFormatter.format(5), '00:05');
      expect(CountdownFormatter.format(65), '01:05');
    });

    test('shows zero', () {
      expect(CountdownFormatter.format(0), '00:00');
    });

    test('never goes below zero', () {
      expect(CountdownFormatter.format(-3), '00:00');
    });
  });
}
