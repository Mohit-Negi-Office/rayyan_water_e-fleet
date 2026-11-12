import 'package:rayyan_driver/core/error/app_exception.dart';
import 'package:rayyan_driver/core/error/exception_mapper.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/utils/app_logger.dart';

/// Outcome of a repository or use-case call.
sealed class Result<T> {
  const Result();
}

/// Successful outcome carrying [value].
final class Success<T> extends Result<T> {
  const Success(this.value);

  final T value;

  @override
  bool operator ==(Object other) => other is Success<T> && other.value == value;

  @override
  int get hashCode => Object.hash(Success, value);
}

/// Failed outcome carrying [failure].
final class Err<T> extends Result<T> {
  const Err(this.failure);

  final Failure failure;

  @override
  bool operator ==(Object other) => other is Err<T> && other.failure == failure;

  @override
  int get hashCode => Object.hash(Err, failure);
}

/// Runs [body] and converts thrown [AppException]s into [Err].
Future<Result<T>> guard<T>(Future<T> Function() body) async {
  try {
    return Success(await body());
  } on AppException catch (e) {
    return Err(e.toFailure());
  } catch (error, stackTrace) {
    AppLogger.error('Unexpected error in guard', error, stackTrace);
    return const Err(UnexpectedFailure());
  }
}
