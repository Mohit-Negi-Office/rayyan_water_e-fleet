import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/profile/data/datasources/profile_local_data_source.dart';
import 'package:rayyan_driver/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:rayyan_driver/features/profile/data/models/driver_details_model.dart';
import 'package:rayyan_driver/features/profile/data/models/driver_profile_response.dart';
import 'package:rayyan_driver/features/profile/data/repositories/profile_repository_impl.dart';

import '../../../../helpers/fixture.dart';

class _MockLocal extends Mock implements ProfileLocalDataSource {}

class _MockRemote extends Mock implements ProfileRemoteDataSource {}

void main() {
  late _MockLocal local;
  late _MockRemote remote;
  late ProfileRepositoryImpl repository;
  late Map<String, dynamic> driver;

  setUpAll(() => registerFallbackValue(<String, dynamic>{}));

  setUp(() {
    local = _MockLocal();
    remote = _MockRemote();
    repository = ProfileRepositoryImpl(local, remote);
    driver = DriverProfileResponse.fromBody(
      fixture('driver_profile_success.json'),
    ).driver;
    when(() => local.write(any())).thenAnswer((_) async {});
  });

  test('shows the driver saved at login', () async {
    const stored = DriverDetailsModel(
      name: 'Suresh Nair',
      driverCode: 'DRV1007',
      email: 'driver.1007@example.com',
      phoneNo: '55001122',
      countryCode: '974',
      vehicle: DriverVehicleModel(vehicleNumber: '318238', routeId: 'RT-007'),
      workDetails: DriverWorkDetailsModel(
        zones: [DriverZoneModel(name: 'Doha North', number: 1)],
      ),
    );
    when(() => local.read()).thenAnswer((_) async => stored);

    final result = await repository.getProfile();

    expect(result, Success(stored.toEntity()));
    verifyNever(() => remote.requestProfile());
  });

  test('asks the server and stores the driver when nothing is saved', () async {
    when(() => local.read()).thenAnswer((_) async => null);
    when(() => remote.requestProfile()).thenAnswer((_) async => driver);

    final result = await repository.getProfile();

    expect(result, Success(DriverDetailsModel.fromJson(driver).toEntity()));
    verify(() => local.write(driver)).called(1);
  });

  test('stores the driver whenever the profile endpoint is hit', () async {
    when(() => remote.requestProfile()).thenAnswer((_) async => driver);

    final result = await repository.requestProfile();

    expect(result, Success(DriverDetailsModel.fromJson(driver).toEntity()));
    verify(() => local.write(driver)).called(1);
    verifyNever(() => local.read());
  });
}
