import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/network/api_client.dart';
import 'package:rayyan_driver/core/network/api_endpoints.dart';
import 'package:rayyan_driver/core/network/app_environment.dart';
import 'package:rayyan_driver/features/profile/data/models/driver_profile_model.dart';

abstract interface class ProfileRemoteDataSource {
  Future<DriverProfileModel> fetchProfile();
}

@LazySingleton(as: ProfileRemoteDataSource, env: [AppEnvironment.prod])
final class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  const ProfileRemoteDataSourceImpl(this._client);

  final ApiClient _client;

  @override
  Future<DriverProfileModel> fetchProfile() async =>
      DriverProfileModel.fromJson(
        await _client.get<Map<String, dynamic>>(ApiEndpoints.profile),
      );
}

/// The driver from the Figma frames.
@LazySingleton(as: ProfileRemoteDataSource, env: [AppEnvironment.mock])
final class ProfileMockDataSource implements ProfileRemoteDataSource {
  const ProfileMockDataSource();

  @override
  Future<DriverProfileModel> fetchProfile() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return const DriverProfileModel(
      name: 'Ahmed Mirza',
      code: 'AD16426',
      email: 'ahmed.mirza@gmail.com',
      dialCode: '+971',
      phone: '2562899707',
      zone: '2',
      routeId: 'RT-021',
      vehicleNumber: 'QA0922',
      photoUrl: 'assets/images/mock/driver_avatar_square.jpg',
    );
  }
}
