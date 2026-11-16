import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rayyan_driver/core/network/api_debug_log.dart';

/// Prints each call in the debug console: URL, headers, body and response.
///
/// Added only for non-production flavors, so production stays quiet.
final class ApiDebugLogInterceptor extends Interceptor {
  ApiDebugLogInterceptor({void Function(String message)? write})
    : _write = write ?? _debugPrintBlock;

  final void Function(String message) _write;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _write(
      ApiDebugLog.request(
        method: options.method,
        url: options.uri.toString(),
        headers: options.headers,
        body: options.data,
      ),
    );
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    _write(
      ApiDebugLog.response(
        method: response.requestOptions.method,
        url: response.requestOptions.uri.toString(),
        statusCode: response.statusCode,
        headers: response.headers.map,
        body: response.data,
      ),
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _write(
      ApiDebugLog.response(
        method: err.requestOptions.method,
        url: err.requestOptions.uri.toString(),
        statusCode: err.response?.statusCode,
        headers: err.response?.headers.map ?? const {},
        body: err.response?.data ?? err.message,
      ),
    );
    handler.next(err);
  }
}

void _debugPrintBlock(String message) {
  for (final line in message.split('\n')) {
    debugPrint(line);
  }
}
