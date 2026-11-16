import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/network/api_client.dart';
import 'package:rayyan_driver/core/network/api_endpoints.dart';
import 'package:rayyan_driver/core/network/app_environment.dart';
import 'package:rayyan_driver/features/profile/data/models/driver_profile_response.dart';

abstract interface class ProfileRemoteDataSource {
  /// Driver object from `GET /user-service/v1/profile/driver`.
  Future<Map<String, dynamic>> requestProfile();
}

@LazySingleton(as: ProfileRemoteDataSource, env: [AppEnvironment.prod])
final class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  const ProfileRemoteDataSourceImpl(this._client);

  final ApiClient _client;

  @override
  Future<Map<String, dynamic>> requestProfile() async {
    final json = await _client.get<Map<String, dynamic>>(ApiEndpoints.profile);
    return DriverProfileResponse.fromBody(json).driver;
  }
}

/// The driver from the Figma frames.
@LazySingleton(as: ProfileRemoteDataSource, env: [AppEnvironment.mock])
final class ProfileMockDataSource implements ProfileRemoteDataSource {
  const ProfileMockDataSource();

  @override
  Future<Map<String, dynamic>> requestProfile() async => _demoDriver;
}

const _demoDriver = <String, dynamic>{
  'name': 'Ahmed Mirza',
  'driverCode': 'AD16426',
  'email': 'ahmed.mirza@gmail.com',
  'phoneNo': '2562899707',
  'countryCode': '971',
  'photo': 'assets/images/mock/driver_avatar_square.jpg',
  'vehicle': <String, dynamic>{'vehicleNumber': 'QA0922', 'routeId': 'RT-021'},
  'workDetails': <String, dynamic>{
    'zones': <Map<String, dynamic>>[
      {'name': 'Zone 2', 'number': 2},
    ],
  },
};
