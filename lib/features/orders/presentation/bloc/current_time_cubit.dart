import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/utils/clock.dart';

/// "Current Time" on the Home header, updated every minute.
@injectable
class CurrentTimeCubit extends Cubit<DateTime> {
  CurrentTimeCubit(this._clock) : super(_clock.now()) {
    _scheduleNext();
  }

  final Clock _clock;
  Timer? _timer;

  void _scheduleNext() {
    final now = _clock.now();
    final nextMinute = DateTime(
      now.year,
      now.month,
      now.day,
      now.hour,
      now.minute + 1,
    );
    _timer = Timer(nextMinute.difference(now), () {
      if (isClosed) return;
      emit(_clock.now());
      _scheduleNext();
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
