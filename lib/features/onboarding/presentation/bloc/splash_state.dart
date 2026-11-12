import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
sealed class SplashState with _$SplashState {
  const factory SplashState.loading() = SplashLoading;

  /// A session from an earlier launch: straight to today's orders.
  const factory SplashState.signedIn() = SplashSignedIn;

  /// No session: Enter Mobile Number.
  const factory SplashState.signedOut() = SplashSignedOut;
}
