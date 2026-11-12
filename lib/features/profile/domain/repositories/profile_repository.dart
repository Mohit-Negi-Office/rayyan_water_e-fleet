import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/profile/domain/entities/driver_profile.dart';

abstract interface class ProfileRepository {
  Future<Result<DriverProfile>> getProfile();
}
