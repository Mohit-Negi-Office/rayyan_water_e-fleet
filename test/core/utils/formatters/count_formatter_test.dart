import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/utils/formatters/count_formatter.dart';

void main() {
  test('groups thousands with Western digits', () {
    expect(CountFormatter.grouped(2530), '2,530');
    expect(CountFormatter.grouped(120), '120');
    expect(CountFormatter.grouped(1250000), '1,250,000');
    expect(CountFormatter.grouped(0), '0');
  });
}
