import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:rayyan_driver/core/utils/formatters/date_formatter.dart';

void main() {
  setUpAll(() => initializeDateFormatting());

  test('list header reads "Jun 24, 2026"', () {
    expect(
      AppDateFormatter.listHeader(DateTime(2026, 6, 24), 'en'),
      'Jun 24, 2026',
    );
  });

  test('Arabic keeps Western digits', () {
    final text = AppDateFormatter.listHeader(DateTime(2026, 6, 24), 'ar');
    expect(text, contains('24'));
    expect(text, contains('2026'));
  });

  test('time of day reads "08:00 AM"', () {
    expect(AppDateFormatter.time(DateTime(2025, 2, 14, 8), 'en'), '08:00 AM');
    expect(
      AppDateFormatter.time(DateTime(2025, 2, 14, 22, 40), 'en'),
      '10:40 PM',
    );
  });

  test('day and month read "15 Oct"', () {
    expect(AppDateFormatter.dayMonth(DateTime(2026, 10, 15), 'en'), '15 Oct');
  });

  group('timeRange', () {
    final start = DateTime(2026, 6, 24, 8);
    final end = DateTime(2026, 6, 24, 12);

    test('spaced for order details: "08:00 AM - 12:00 PM"', () {
      expect(
        AppDateFormatter.timeRange(start, end, 'en'),
        '08:00 AM - 12:00 PM',
      );
    });

    test('tight for order cards: "08:00 AM-12:00 PM"', () {
      expect(
        AppDateFormatter.timeRange(start, end, 'en', isCompact: true),
        '08:00 AM-12:00 PM',
      );
    });
  });
}
