import 'package:injectable/injectable.dart';

/// One-second countdowns, injectable so timers can be faked in tests.
@lazySingleton
class Ticker {
  const Ticker();

  /// Emits `seconds - 1` down to 0, one value per second.
  Stream<int> countdown(int seconds) => Stream.periodic(
    const Duration(seconds: 1),
    (elapsed) => seconds - elapsed - 1,
  ).take(seconds < 0 ? 0 : seconds);

  /// Fires every [interval] until cancelled (status polling).
  Stream<void> every(Duration interval) => Stream<void>.periodic(interval);
}
