/// Failures returned to domain and presentation (never thrown).
sealed class Failure {
  const Failure();
}

/// No connection or timeout.
final class NetworkFailure extends Failure {
  const NetworkFailure();

  @override
  bool operator ==(Object other) => other is NetworkFailure;

  @override
  int get hashCode => (NetworkFailure).hashCode;
}

/// The server rejected the request; [code] selects specific copy.
final class ServerFailure extends Failure {
  const ServerFailure({this.code});

  final String? code;

  @override
  bool operator ==(Object other) =>
      other is ServerFailure && other.code == code;

  @override
  int get hashCode => Object.hash(ServerFailure, code);
}

/// Session missing or expired; handled centrally by the auth redirect.
final class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure();

  @override
  bool operator ==(Object other) => other is UnauthorizedFailure;

  @override
  int get hashCode => (UnauthorizedFailure).hashCode;
}

/// Field-level validation errors keyed by field name.
final class ValidationFailure extends Failure {
  const ValidationFailure(this.fieldErrors);

  final Map<String, String> fieldErrors;

  @override
  bool operator ==(Object other) =>
      other is ValidationFailure &&
      other.fieldErrors.length == fieldErrors.length &&
      fieldErrors.entries.every((e) => other.fieldErrors[e.key] == e.value);

  @override
  int get hashCode => Object.hash(
    ValidationFailure,
    Object.hashAllUnordered(
      fieldErrors.entries.map((e) => Object.hash(e.key, e.value)),
    ),
  );
}

/// Local storage failure.
final class CacheFailure extends Failure {
  const CacheFailure();

  @override
  bool operator ==(Object other) => other is CacheFailure;

  @override
  int get hashCode => (CacheFailure).hashCode;
}

/// Anything not covered above.
final class UnexpectedFailure extends Failure {
  const UnexpectedFailure();

  @override
  bool operator ==(Object other) => other is UnexpectedFailure;

  @override
  int get hashCode => (UnexpectedFailure).hashCode;
}
