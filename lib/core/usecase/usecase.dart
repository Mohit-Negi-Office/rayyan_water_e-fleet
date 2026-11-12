import 'package:rayyan_driver/core/error/result.dart';

/// A single business action. Implementations expose one [call] method.
abstract interface class UseCase<T, P> {
  Future<Result<T>> call(P params);
}

/// Parameter object for use cases that take no input.
final class NoParams {
  const NoParams();

  @override
  bool operator ==(Object other) => other is NoParams;

  @override
  int get hashCode => (NoParams).hashCode;
}
