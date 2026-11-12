import 'package:injectable/injectable.dart';

/// Current time, injectable so time-based logic can be tested.
@lazySingleton
class Clock {
  const Clock();

  DateTime now() => DateTime.now();
}
