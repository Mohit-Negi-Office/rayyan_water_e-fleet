import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/features/profile/domain/entities/driver_profile.dart';
import 'package:rayyan_driver/features/profile/domain/repositories/profile_repository.dart';

@injectable
class GetProfile implements UseCase<DriverProfile, NoParams> {
  const GetProfile(this._repository);

  final ProfileRepository _repository;

  @override
  Future<Result<DriverProfile>> call(NoParams params) =>
      _repository.getProfile();
}
