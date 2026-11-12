/// How long ago something happened, in the largest whole unit ("2h").
sealed class RelativeTime {
  const RelativeTime();

  /// Compares [then] with [now]; future times count as just now.
  factory RelativeTime.between(DateTime then, DateTime now) {
    final elapsed = now.difference(then);
    if (elapsed.inMinutes < 1) return const JustNow();
    if (elapsed.inHours < 1) return MinutesAgo(elapsed.inMinutes);
    if (elapsed.inDays < 1) return HoursAgo(elapsed.inHours);
    return DaysAgo(elapsed.inDays);
  }
}

final class JustNow extends RelativeTime {
  const JustNow();

  @override
  bool operator ==(Object other) => other is JustNow;

  @override
  int get hashCode => (JustNow).hashCode;
}

final class MinutesAgo extends RelativeTime {
  const MinutesAgo(this.minutes);
  final int minutes;

  @override
  bool operator ==(Object other) =>
      other is MinutesAgo && other.minutes == minutes;

  @override
  int get hashCode => Object.hash(MinutesAgo, minutes);
}

final class HoursAgo extends RelativeTime {
  const HoursAgo(this.hours);
  final int hours;

  @override
  bool operator ==(Object other) => other is HoursAgo && other.hours == hours;

  @override
  int get hashCode => Object.hash(HoursAgo, hours);
}

final class DaysAgo extends RelativeTime {
  const DaysAgo(this.days);
  final int days;

  @override
  bool operator ==(Object other) => other is DaysAgo && other.days == days;

  @override
  int get hashCode => Object.hash(DaysAgo, days);
}
