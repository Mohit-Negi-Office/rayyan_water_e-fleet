import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/features/auth/domain/usecases/restore_session.dart';
import 'package:rayyan_driver/features/onboarding/presentation/bloc/splash_cubit.dart';
import 'package:rayyan_driver/features/onboarding/presentation/bloc/splash_state.dart';

class _MockRestoreSession extends Mock implements RestoreSession {}

void main() {
  late _MockRestoreSession restore;

  setUpAll(() => registerFallbackValue(const NoParams()));
  setUp(() => restore = _MockRestoreSession());

  SplashCubit build() => SplashCubit(restore, minimumDuration: Duration.zero);

  blocTest<SplashCubit, SplashState>(
    'a kept session goes straight in',
    build: () {
      when(() => restore(any())).thenAnswer((_) async => const Success(true));
      return build();
    },
    act: (cubit) => cubit.start(),
    expect: () => const [SplashState.loading(), SplashState.signedIn()],
  );

  blocTest<SplashCubit, SplashState>(
    'no session goes to login',
    build: () {
      when(() => restore(any())).thenAnswer((_) async => const Success(false));
      return build();
    },
    act: (cubit) => cubit.start(),
    expect: () => const [SplashState.loading(), SplashState.signedOut()],
  );

  blocTest<SplashCubit, SplashState>(
    'an unreadable session goes to login',
    build: () {
      when(
        () => restore(any()),
      ).thenAnswer((_) async => const Err<bool>(CacheFailure()));
      return build();
    },
    act: (cubit) => cubit.start(),
    expect: () => const [SplashState.loading(), SplashState.signedOut()],
  );
}
