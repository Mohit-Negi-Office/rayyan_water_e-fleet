import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/core/utils/app_logger.dart';
import 'package:rayyan_driver/features/auth/domain/usecases/restore_session.dart';
import 'package:rayyan_driver/features/onboarding/presentation/bloc/splash_state.dart';

/// Shows the splash for at least [minimumDuration], then decides whether
/// the app starts on Home or on login.
@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit(
    this._restoreSession, {
    @ignoreParam this.minimumDuration = defaultMinimumDuration,
  }) : super(const SplashState.loading());

  static const Duration defaultMinimumDuration = Duration(milliseconds: 1500);

  final RestoreSession _restoreSession;
  final Duration minimumDuration;

  Future<void> start() async {
    emit(const SplashState.loading());
    final results = await Future.wait([
      _restoreSession(const NoParams()),
      Future<void>.delayed(minimumDuration),
    ]);
    if (isClosed) return;
    final result = results.first as Result<bool>;
    if (result case Err(:final failure)) {
      AppLogger.error('Could not read the session', failure);
    }
    emit(switch (result) {
      Success(value: true) => const SplashState.signedIn(),
      Success() || Err() => const SplashState.signedOut(),
    });
  }
}
