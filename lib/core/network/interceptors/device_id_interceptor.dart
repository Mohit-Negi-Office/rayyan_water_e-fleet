import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/network/device_id_store.dart';

/// Adds the install's device id to every request.
@lazySingleton
final class DeviceIdInterceptor extends Interceptor {
  DeviceIdInterceptor(this._deviceId);

  static const String headerName = 'device-id';

  final DeviceIdStore _deviceId;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers[headerName] = await _deviceId.fetch();
    handler.next(options);
  }
}
