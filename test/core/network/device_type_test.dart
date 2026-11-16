import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/network/device_type.dart';

void main() {
  test('names an iPhone IOS', () {
    expect(deviceTypeName(isIos: true, isAndroid: false), 'IOS');
  });

  test('names an Android phone ANDROID', () {
    expect(deviceTypeName(isIos: false, isAndroid: true), 'ANDROID');
  });

  test('names anything else WEB', () {
    expect(deviceTypeName(isIos: false, isAndroid: false), 'WEB');
  });

  test('reads the host platform', () {
    expect(
      const PlatformDeviceTypeReader().read(),
      deviceTypeName(isIos: Platform.isIOS, isAndroid: Platform.isAndroid),
    );
  });
}
