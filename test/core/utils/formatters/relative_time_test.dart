import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/utils/formatters/relative_time.dart';

void main() {
  final now = DateTime(2026, 10, 12, 12);

  RelativeTime ago(Duration d) => RelativeTime.between(now.subtract(d), now);

  test('under a minute is just now, including future times', () {
    expect(ago(const Duration(seconds: 30)), const JustNow());
    expect(
      RelativeTime.between(now.add(const Duration(minutes: 5)), now),
      const JustNow(),
    );
  });

  test('uses the largest whole unit', () {
    expect(ago(const Duration(minutes: 59)), const MinutesAgo(59));
    expect(ago(const Duration(hours: 2, minutes: 40)), const HoursAgo(2));
    expect(ago(const Duration(days: 3, hours: 5)), const DaysAgo(3));
  });
}
