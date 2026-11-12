import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rayyan_driver/app/session/driver_profile_cubit.dart';
import 'package:rayyan_driver/app/session/driver_profile_state.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:rayyan_driver/features/profile/domain/entities/driver_profile.dart';
import 'package:rayyan_driver/features/profile/domain/usecases/get_profile.dart';

class _MockGetProfile extends Mock implements GetProfile {}

void main() {
  late _MockGetProfile getProfile;
  late DriverProfile profile;

  setUpAll(() async {
    registerFallbackValue(const NoParams());
    profile = (await const ProfileMockDataSource().fetchProfile()).toEntity();
  });
  setUp(() => getProfile = _MockGetProfile());

  test('the demo driver is the one in Figma', () {
    expect(profile.name, 'Ahmed Mirza');
    expect(profile.code, 'AD16426');
    expect(profile.routeId, 'RT-021');
  });

  blocTest<DriverProfileCubit, DriverProfileState>(
    'loads the driver',
    build: () {
      when(() => getProfile(any())).thenAnswer((_) async => Success(profile));
      return DriverProfileCubit(getProfile);
    },
    act: (cubit) => cubit.load(),
    expect: () => [
      const DriverProfileState.loading(),
      DriverProfileState.loaded(profile),
    ],
  );

  blocTest<DriverProfileCubit, DriverProfileState>(
    'shows a failure and clears on logout',
    build: () {
      when(
        () => getProfile(any()),
      ).thenAnswer((_) async => const Err(NetworkFailure()));
      return DriverProfileCubit(getProfile);
    },
    act: (cubit) async {
      await cubit.load();
      cubit.clear();
    },
    expect: () => const [
      DriverProfileState.loading(),
      DriverProfileState.failure(NetworkFailure()),
      DriverProfileState.loading(),
    ],
  );
}
