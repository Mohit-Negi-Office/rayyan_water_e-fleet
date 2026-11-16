import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/error/app_exception.dart';
import 'package:rayyan_driver/core/storage/secure_storage.dart';
import 'package:rayyan_driver/core/storage/storage_keys.dart';
import 'package:rayyan_driver/features/auth/data/datasources/auth_token_local_data_source.dart';
import 'package:rayyan_driver/features/auth/data/models/auth_session_model.dart';
import 'package:rayyan_driver/features/profile/data/datasources/profile_local_data_source.dart';

import '../../../../helpers/fixture.dart';

void main() {
  const session = AuthSessionModel(
    sessionId: 'sess_01drv',
    token: 'session-token',
    publicKey: 'public-key',
    refreshToken: 'refresh-token',
  );

  late Map<String, dynamic> driver;
  late _MemoryStorage storage;
  late AuthTokenLocalDataSource source;

  setUp(() {
    driver = Map<String, dynamic>.from(
      fixture('verify_otp_success.json')['data']['driver'] as Map,
    );
    storage = _MemoryStorage();
    source = AuthTokenLocalDataSource(storage);
  });

  test('stores the session and the driver in secure storage', () async {
    await source.save(session: session, driver: driver);

    expect(storage.values[StorageKeys.accessToken], 'session-token');
    expect(storage.values[StorageKeys.refreshToken], 'refresh-token');
    expect(storage.values[StorageKeys.sessionId], 'sess_01drv');
    expect(storage.values[StorageKeys.publicKey], 'public-key');
    expect(jsonDecode(storage.values[StorageKeys.driverProfile]!), driver);
    expect(await source.hasAccessToken(), isTrue);
  });

  test('the stored driver is what Profile reads', () async {
    driver['photo'] = 'https://cdn.example.com/driver.jpg';
    await source.save(session: session, driver: driver);
    final stored = await ProfileLocalDataSourceImpl(storage).read();

    expect(stored?.toEntity().name, 'Suresh Nair');
    expect(stored?.toEntity().code, 'DRV1007');
    expect(stored?.toEntity().dialCode, '+974');
    expect(stored?.toEntity().zone, '1');
    expect(stored?.toEntity().vehicleNumber, '318238');
    expect(stored?.toEntity().photoUrl, 'https://cdn.example.com/driver.jpg');
  });

  test('clears the session and the driver together', () async {
    await source.save(session: session, driver: driver);
    await source.clear();

    expect(storage.values, isEmpty);
    expect(await source.hasAccessToken(), isFalse);
    expect(await ProfileLocalDataSourceImpl(storage).read(), isNull);
  });

  test('drops a partial write when a later key fails', () async {
    final flaky = _FailOnKey(StorageKeys.publicKey);
    final flakySource = AuthTokenLocalDataSource(flaky);

    await expectLater(
      flakySource.save(session: session, driver: driver),
      throwsA(isA<CacheException>()),
    );
    expect(flaky.values, isEmpty);
  });
}

final class _MemoryStorage implements SecureStorage {
  final values = <String, String>{};

  @override
  Future<void> delete(String key) async => values.remove(key);

  @override
  Future<String?> read(String key) async => values[key];

  @override
  Future<void> write(String key, String value) async => values[key] = value;
}

final class _FailOnKey implements SecureStorage {
  _FailOnKey(this._key);

  final String _key;
  final values = <String, String>{};

  @override
  Future<void> delete(String key) async => values.remove(key);

  @override
  Future<String?> read(String key) async => values[key];

  @override
  Future<void> write(String key, String value) async {
    if (key == _key) throw const CacheException('locked');
    values[key] = value;
  }
}
