import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:rayyan_driver/core/utils/formatters/date_formatter.dart';

void main() {
  setUpAll(() => initializeDateFormatting());

  test('slot range is "hh:mm AM - hh:mm PM"', () {
    expect(
      AppDateFormatter.slotRange(8 * 60, 12 * 60, 'en'),
      '08:00 AM - 12:00 PM',
    );
    expect(
      AppDateFormatter.slotRange(14 * 60, 18 * 60, 'en'),
      '02:00 PM - 06:00 PM',
    );
  });

  test('day chip is "Thu, 15 Oct"', () {
    expect(
      AppDateFormatter.dayChip(DateTime(2026, 10, 15), 'en'),
      'Thu, 15 Oct',
    );
  });

  test('full date is "24 Jun, 2026"', () {
    expect(
      AppDateFormatter.fullDate(DateTime(2026, 6, 24), 'en'),
      '24 Jun, 2026',
    );
  });

  test('month title is "Oct 2026"', () {
    expect(
      AppDateFormatter.monthTitle(DateTime(2026, 10, 3), 'en'),
      'Oct 2026',
    );
  });

  test('month and year is "October 2026"', () {
    expect(
      AppDateFormatter.monthYear(DateTime(2026, 10), 'en'),
      'October 2026',
    );
  });

  test('Arabic keeps Western digits', () {
    expect(
      AppDateFormatter.slotRange(8 * 60, 12 * 60, 'ar'),
      contains('08:00'),
    );
  });
}
