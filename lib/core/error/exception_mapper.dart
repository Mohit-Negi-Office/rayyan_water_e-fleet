import 'package:rayyan_driver/core/error/app_exception.dart';
import 'package:rayyan_driver/core/error/failure.dart';

/// Maps data-layer exceptions to domain failures.
extension AppExceptionX on AppException {
  /// The [Failure] that represents this exception.
  Failure toFailure() => switch (this) {
    NetworkException() => const NetworkFailure(),
    ServerException(:final code) => ServerFailure(code: code),
    UnauthorizedException() => const UnauthorizedFailure(),
    ValidationException(:final fieldErrors) => ValidationFailure(fieldErrors),
    CacheException() => const CacheFailure(),
    // Callers fall back (e.g. to Doha); there is no copy for this yet.
    DeviceException() => const UnexpectedFailure(),
  };
}
