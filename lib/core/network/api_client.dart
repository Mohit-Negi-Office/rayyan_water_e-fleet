import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/app_exception.dart';
import 'package:rayyan_driver/core/network/dio_exception_mapper.dart';

/// Thin Dio wrapper used by every remote data source.
/// Throws [AppException]s only.
@lazySingleton
final class ApiClient {
  const ApiClient(this._dio);

  final Dio _dio;

  /// GET [path] and return the decoded body.
  Future<T> get<T>(String path, {Map<String, dynamic>? query}) =>
      _send(() => _dio.get<T>(path, queryParameters: query));

  /// POST [data] to [path] and return the decoded body.
  Future<T> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? headers,
  }) => _send(() => _dio.post<T>(path, data: data, options: _options(headers)));

  /// POST [data] to [path]. An empty success body still counts as success.
  Future<void> postAllowingEmpty(
    String path, {
    Object? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      await _dio.post<dynamic>(path, data: data, options: _options(headers));
    } on DioException catch (error) {
      throw error.toAppException();
    }
  }

  /// PUT [data] to [path] and return the decoded body.
  Future<T> put<T>(String path, {Object? data}) =>
      _send(() => _dio.put<T>(path, data: data));

  /// DELETE [path] and return the decoded body.
  Future<T> delete<T>(String path, {Object? data}) =>
      _send(() => _dio.delete<T>(path, data: data));

  Options? _options(Map<String, dynamic>? headers) =>
      headers == null ? null : Options(headers: headers);

  Future<T> _send<T>(Future<Response<T>> Function() request) async {
    try {
      final response = await request();
      final data = response.data;
      if (data == null) {
        throw ServerException(
          'Empty response body',
          statusCode: response.statusCode,
        );
      }
      return data;
    } on DioException catch (e) {
      throw e.toAppException();
    }
  }
}
