import 'dart:io';

import 'package:injectable/injectable.dart';

/// Reads the `device-type` value for this device.
abstract interface class DeviceTypeReader {
  /// `IOS`, `ANDROID`, or `WEB`.
  String read();
}

/// The platform this app is running on.
@LazySingleton(as: DeviceTypeReader)
final class PlatformDeviceTypeReader implements DeviceTypeReader {
  const PlatformDeviceTypeReader();

  @override
  String read() =>
      deviceTypeName(isIos: Platform.isIOS, isAndroid: Platform.isAndroid);
}

/// API name for the running platform.
String deviceTypeName({required bool isIos, required bool isAndroid}) {
  if (isIos) return 'IOS';
  if (isAndroid) return 'ANDROID';
  return 'WEB';
}
