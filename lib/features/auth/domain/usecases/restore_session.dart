import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/features/auth/domain/repositories/auth_repository.dart';

/// True when the driver is still signed in from an earlier launch.
@injectable
class RestoreSession implements UseCase<bool, NoParams> {
  const RestoreSession(this._repository);

  final AuthRepository _repository;

  @override
  Future<Result<bool>> call(NoParams params) => _repository.hasSession();
}
