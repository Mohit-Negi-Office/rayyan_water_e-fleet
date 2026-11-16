import 'package:dio/dio.dart';
import 'package:rayyan_driver/core/error/app_exception.dart';
import 'package:rayyan_driver/core/network/models/api_response_model.dart';

/// Converts a [DioException] into a typed [AppException].
extension DioExceptionX on DioException {
  /// The [AppException] that represents this error.
  AppException toAppException() {
    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
      case DioExceptionType.connectionError:
        return NetworkException(message ?? 'Network error');
      case DioExceptionType.badResponse:
        return _fromResponse();
      case DioExceptionType.badCertificate:
      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
        return ServerException(message ?? 'Request failed');
    }
  }

  AppException _fromResponse() {
    final statusCode = response?.statusCode;
    final envelope = ApiResponseModel.tryFrom(response?.data);
    if (envelope != null) return _fromEnvelope(envelope, statusCode);
    final body = response?.data is Map<String, dynamic>
        ? response?.data as Map<String, dynamic>
        : const <String, dynamic>{};
    final code = body['code'] is String ? body['code'] as String : null;
    return switch (statusCode) {
      401 => UnauthorizedException(message ?? 'Unauthorized'),
      422 => ValidationException(
        message ?? 'Validation failed',
        fieldErrors: _fieldErrors(body['errors']),
      ),
      _ => ServerException(
        message ?? 'Server error',
        statusCode: statusCode,
        code: code,
      ),
    };
  }

  AppException _fromEnvelope(ApiResponseModel envelope, int? statusCode) {
    final type = envelope.error?.type;
    final httpStatus = statusCode ?? envelope.code;
    return switch (httpStatus) {
      401 => UnauthorizedException(message ?? type ?? 'Unauthorized'),
      422 => ValidationException(
        message ?? type ?? 'Validation failed',
        fieldErrors: _fieldErrors(envelope.error?.data),
      ),
      _ => ServerException(
        message ?? type ?? 'Server error',
        statusCode: httpStatus,
        code: type,
      ),
    };
  }

  Map<String, String> _fieldErrors(Object? raw) {
    if (raw is! Map) return const {};
    return {
      for (final entry in raw.entries)
        entry.key.toString(): entry.value is List
            ? (entry.value as List).join('\n')
            : entry.value.toString(),
    };
  }
}
