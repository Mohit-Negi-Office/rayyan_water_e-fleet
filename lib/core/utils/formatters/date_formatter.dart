import 'package:intl/intl.dart';

/// Date formats from `12_LOCALIZATION_AND_RTL.md`. Digits stay Western
/// (0-9) in Arabic too, matching [MoneyFormatter], until design decides.
abstract final class AppDateFormatter {
  static const int _minutesPerHour = 60;

  static DateFormat _format(String pattern, String locale) =>
      DateFormat(pattern, locale)..useNativeDigits = false;

  /// List section header: "Jun 24, 2026".
  static String listHeader(DateTime date, String locale) =>
      (DateFormat.yMMMd(locale)..useNativeDigits = false).format(date);

  /// Delivery slot: "08:00 AM - 12:00 PM". Minutes are from midnight.
  static String slotRange(int startMinute, int endMinute, String locale) {
    final format = _format('hh:mm a', locale);
    DateTime at(int minute) => DateTime(
      2000,
      1,
      1,
      minute ~/ _minutesPerHour,
      minute % _minutesPerHour,
    );
    return '${format.format(at(startMinute))} - '
        '${format.format(at(endMinute))}';
  }

  /// Delivery window between two times: "08:00 AM - 12:00 PM" on the order
  /// detail, "08:00 AM-12:00 PM" ([isCompact]) on order cards.
  static String timeRange(
    DateTime start,
    DateTime end,
    String locale, {
    bool isCompact = false,
  }) {
    final format = _format('hh:mm a', locale);
    final separator = isCompact ? '-' : ' - ';
    return '${format.format(start)}$separator${format.format(end)}';
  }

  /// Chosen delivery day: "Thu, 15 Oct".
  static String dayChip(DateTime date, String locale) =>
      _format('EEE, d MMM', locale).format(date);

  /// "24 Jun, 2026".
  static String fullDate(DateTime date, String locale) =>
      _format('d MMM, y', locale).format(date);

  /// Calendar header: "Oct 2026".
  static String monthTitle(DateTime date, String locale) =>
      _format('MMM y', locale).format(date);

  /// Policy update date: "October 2026".
  static String monthYear(DateTime date, String locale) =>
      _format('MMMM y', locale).format(date);

  /// Short weekday: "Mon".
  static String weekdayShort(DateTime date, String locale) =>
      _format('EEE', locale).format(date);

  /// One-letter weekday for the calendar header: "M".
  static String weekdayNarrow(DateTime date, String locale) =>
      _format('EEEEE', locale).format(date);

  /// Full weekday: "Thursday".
  static String weekdayLong(DateTime date, String locale) =>
      _format('EEEE', locale).format(date);

  /// Time of an event: "08:00 AM".
  static String time(DateTime date, String locale) =>
      _format('hh:mm a', locale).format(date);

  /// "15 Oct".
  static String dayMonth(DateTime date, String locale) =>
      _format('d MMM', locale).format(date);
}
