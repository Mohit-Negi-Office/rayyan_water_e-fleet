import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/features/auth/domain/usecases/logout.dart';
import 'package:rayyan_driver/features/profile/presentation/bloc/logout_cubit.dart';
import 'package:rayyan_driver/features/profile/presentation/bloc/logout_state.dart';

class _MockLogout extends Mock implements Logout {}

void main() {
  late _MockLogout logout;

  setUpAll(() => registerFallbackValue(const NoParams()));
  setUp(() => logout = _MockLogout());

  blocTest<LogoutCubit, LogoutState>(
    'ends the session',
    build: () {
      when(
        () => logout(any()),
      ).thenAnswer((_) async => const Success<void>(null));
      return LogoutCubit(logout);
    },
    act: (cubit) => cubit.logout(),
    expect: () => const [LogoutState.inProgress(), LogoutState.done()],
  );

  blocTest<LogoutCubit, LogoutState>(
    'ends the session on the device even when the call fails',
    build: () {
      when(
        () => logout(any()),
      ).thenAnswer((_) async => const Err<void>(CacheFailure()));
      return LogoutCubit(logout);
    },
    act: (cubit) => cubit.logout(),
    expect: () => const [LogoutState.inProgress(), LogoutState.done()],
  );
}
