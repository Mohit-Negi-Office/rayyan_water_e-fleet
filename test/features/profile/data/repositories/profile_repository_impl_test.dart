import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/profile/data/datasources/profile_local_data_source.dart';
import 'package:rayyan_driver/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:rayyan_driver/features/profile/data/models/driver_details_model.dart';
import 'package:rayyan_driver/features/profile/data/models/driver_profile_model.dart';
import 'package:rayyan_driver/features/profile/data/repositories/profile_repository_impl.dart';

class _MockLocal extends Mock implements ProfileLocalDataSource {}

class _MockRemote extends Mock implements ProfileRemoteDataSource {}

void main() {
  late _MockLocal local;
  late _MockRemote remote;
  late ProfileRepositoryImpl repository;

  setUp(() {
    local = _MockLocal();
    remote = _MockRemote();
    repository = ProfileRepositoryImpl(local, remote);
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
    verifyNever(() => remote.fetchProfile());
  });

  test('asks the server when nothing is stored', () async {
    const remoteDriver = DriverProfileModel(
      name: 'Ahmed Mirza',
      code: 'AD16426',
      email: 'ahmed.mirza@gmail.com',
      dialCode: '+971',
      phone: '2562899707',
      zone: '2',
      routeId: 'RT-021',
      vehicleNumber: 'QA0922',
    );
    when(() => local.read()).thenAnswer((_) async => null);
    when(() => remote.fetchProfile()).thenAnswer((_) async => remoteDriver);

    final result = await repository.getProfile();

    expect(result, Success(remoteDriver.toEntity()));
  });
}
