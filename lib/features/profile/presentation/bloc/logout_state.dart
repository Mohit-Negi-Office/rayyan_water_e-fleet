import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_state.freezed.dart';

@freezed
sealed class LogoutState with _$LogoutState {
  const factory LogoutState.idle() = LogoutIdle;
  const factory LogoutState.inProgress() = LogoutInProgress;

  /// The session is gone; the app returns to login.
  const factory LogoutState.done() = LogoutDone;
}
