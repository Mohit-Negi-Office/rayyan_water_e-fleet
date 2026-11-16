import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rayyan_driver/app/session/driver_profile_cubit.dart';
import 'package:rayyan_driver/app/session/driver_profile_state.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:rayyan_driver/features/profile/data/models/driver_details_model.dart';
import 'package:rayyan_driver/features/profile/domain/entities/driver_profile.dart';
import 'package:rayyan_driver/features/profile/domain/usecases/get_profile.dart';
import 'package:rayyan_driver/features/profile/domain/usecases/request_profile.dart';

class _MockGetProfile extends Mock implements GetProfile {}

class _MockRequestProfile extends Mock implements RequestProfile {}

void main() {
  late _MockGetProfile getProfile;
  late _MockRequestProfile requestProfile;
  late DriverProfile profile;

  setUpAll(() async {
    registerFallbackValue(const NoParams());
    profile = DriverDetailsModel.fromJson(
      await const ProfileMockDataSource().requestProfile(),
    ).toEntity();
  });
  setUp(() {
    getProfile = _MockGetProfile();
    requestProfile = _MockRequestProfile();
  });

  test('the demo driver is the one in Figma', () {
    expect(profile.name, 'Ahmed Mirza');
    expect(profile.code, 'AD16426');
    expect(profile.routeId, 'RT-021');
  });

  blocTest<DriverProfileCubit, DriverProfileState>(
    'loads the driver',
    build: () {
      when(() => getProfile(any())).thenAnswer((_) async => Success(profile));
      return DriverProfileCubit(getProfile, requestProfile);
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
      return DriverProfileCubit(getProfile, requestProfile);
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

  blocTest<DriverProfileCubit, DriverProfileState>(
    'shows the driver stored from the profile endpoint',
    build: () {
      when(
        () => requestProfile(any()),
      ).thenAnswer((_) async => const Success(_storedDriver));
      return DriverProfileCubit(getProfile, requestProfile);
    },
    seed: () => DriverProfileState.loaded(profile),
    act: (cubit) => cubit.refresh(),
    expect: () => [const DriverProfileState.loaded(_storedDriver)],
  );

  blocTest<DriverProfileCubit, DriverProfileState>(
    'keeps the driver on screen when the profile call fails',
    build: () {
      when(
        () => requestProfile(any()),
      ).thenAnswer((_) async => const Err(NetworkFailure()));
      return DriverProfileCubit(getProfile, requestProfile);
    },
    seed: () => DriverProfileState.loaded(profile),
    act: (cubit) => cubit.refresh(),
    expect: () => const <DriverProfileState>[],
  );
}

const _storedDriver = DriverProfile(
  name: 'Suresh Nair',
  code: 'DRV1007',
  email: 'suresh.drv1007@rayyanwater.qa',
  dialCode: '+974',
  phoneDigits: '66210222',
  zone: '1',
  routeId: 'RT-007',
  vehicleNumber: '318238',
);
