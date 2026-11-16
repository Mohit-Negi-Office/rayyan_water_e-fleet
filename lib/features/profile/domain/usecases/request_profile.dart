import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/features/profile/domain/entities/driver_profile.dart';
import 'package:rayyan_driver/features/profile/domain/repositories/profile_repository.dart';

/// Loads the signed-in driver from the profile endpoint and stores it.
@injectable
class RequestProfile implements UseCase<DriverProfile, NoParams> {
  const RequestProfile(this._repository);

  final ProfileRepository _repository;

  @override
  Future<Result<DriverProfile>> call(NoParams params) =>
      _repository.requestProfile();
}
