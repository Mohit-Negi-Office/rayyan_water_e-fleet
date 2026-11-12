import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/core/utils/app_logger.dart';
import 'package:rayyan_driver/features/auth/domain/usecases/logout.dart';
import 'package:rayyan_driver/features/profile/presentation/bloc/logout_state.dart';

/// Logout from Profile. The session ends on the device even when the
/// server call fails.
@injectable
class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this._logout) : super(const LogoutState.idle());

  final Logout _logout;

  Future<void> logout() async {
    if (state is! LogoutIdle) return;
    emit(const LogoutState.inProgress());
    final result = await _logout(const NoParams());
    if (result case Err(:final failure)) {
      AppLogger.error('Logout failed', failure);
    }
    if (!isClosed) emit(const LogoutState.done());
  }
}
