import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/storage/secure_storage.dart';
import 'package:rayyan_driver/core/storage/storage_keys.dart';
import 'package:rayyan_driver/features/profile/data/datasources/profile_local_data_source.dart';
import 'package:rayyan_driver/features/profile/data/models/driver_profile_response.dart';

import '../../../../helpers/fixture.dart';

void main() {
  test('stores the profile driver for the next read', () async {
    final driver = DriverProfileResponse.fromBody(
      fixture('driver_profile_success.json'),
    ).driver;
    final storage = _MemoryStorage();
    final source = ProfileLocalDataSourceImpl(storage);

    await source.write(driver);
    final stored = await source.read();

    expect(jsonDecode(storage.values[StorageKeys.driverProfile]!), driver);
    expect(stored?.toEntity().name, 'Suresh Nair');
    expect(stored?.toEntity().email, 'suresh.drv1007@rayyanwater.qa');
    expect(stored?.toEntity().zone, '1');
    expect(stored?.toEntity().routeId, 'RT-007');
  });
}

final class _MemoryStorage implements SecureStorage {
  final values = <String, String>{};

  @override
  Future<String?> read(String key) async => values[key];

  @override
  Future<void> write(String key, String value) async => values[key] = value;

  @override
  Future<void> delete(String key) async => values.remove(key);
}
