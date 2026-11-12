/// Exceptions thrown by data sources (data layer only).
sealed class AppException implements Exception {
  const AppException(this.message);

  /// Developer-facing detail. Never shown to users.
  final String message;
}

/// No connection, timeout, or DNS failure.
final class NetworkException extends AppException {
  const NetworkException(super.message);
}

/// Non-2xx response from the API.
final class ServerException extends AppException {
  const ServerException(super.message, {this.statusCode, this.code});

  final int? statusCode;
  final String? code;
}

/// Missing or expired session (HTTP 401).
final class UnauthorizedException extends AppException {
  const UnauthorizedException(super.message);
}

/// Request rejected with field-level errors (HTTP 422).
final class ValidationException extends AppException {
  const ValidationException(super.message, {this.fieldErrors = const {}});

  final Map<String, String> fieldErrors;
}

/// Local storage read/write failed.
final class CacheException extends AppException {
  const CacheException(super.message);
}

/// A phone feature is off or not allowed (e.g. location permission).
final class DeviceException extends AppException {
  const DeviceException(super.message);
}
