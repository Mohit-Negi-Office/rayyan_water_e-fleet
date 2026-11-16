import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/profile/data/datasources/profile_local_data_source.dart';
import 'package:rayyan_driver/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:rayyan_driver/features/profile/domain/entities/driver_profile.dart';
import 'package:rayyan_driver/features/profile/domain/repositories/profile_repository.dart';

@LazySingleton(as: ProfileRepository)
final class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl(this._local, this._remote);

  final ProfileLocalDataSource _local;
  final ProfileRemoteDataSource _remote;

  /// The driver saved at OTP verify. Falls back to the profile endpoint
  /// when this install has no stored driver yet.
  @override
  Future<Result<DriverProfile>> getProfile() => guard(() async {
    final stored = await _local.read();
    if (stored != null) return stored.toEntity();
    return (await _remote.fetchProfile()).toEntity();
  });
}
