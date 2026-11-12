import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/app/session/auth_state.dart';

/// App-wide session state that drives the router redirect.
@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.signedOut());

  /// Marks the session as authenticated (OTP verified or restored).
  void signedIn() => emit(const AuthState.authenticated());

  /// Ends the session (logout or expired token).
  void signedOut() => emit(const AuthState.signedOut());
}
