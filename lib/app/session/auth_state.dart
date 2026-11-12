import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  /// No driver signed in: only the splash and login are open.
  const factory AuthState.signedOut() = AuthSignedOut;

  /// Signed in.
  const factory AuthState.authenticated() = AuthAuthenticated;
}
