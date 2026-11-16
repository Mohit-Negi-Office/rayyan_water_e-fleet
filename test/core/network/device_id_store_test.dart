import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/network/device_id_store.dart';
import 'package:rayyan_driver/core/storage/key_value_storage.dart';
import 'package:rayyan_driver/core/storage/storage_keys.dart';

void main() {
  test('returns the id already saved for this install', () async {
    final storage = _MemoryStorage()
      ..values[StorageKeys.deviceId] = 'stored-id';
    final store = PersistentDeviceIdStore(storage);

    expect(await store.fetch(), 'stored-id');
    expect(await store.fetch(), 'stored-id');
    expect(storage.writes, 0);
  });

  test('creates one id and keeps it', () async {
    final storage = _MemoryStorage();
    final store = PersistentDeviceIdStore(storage);

    final first = await store.fetch();
    final second = await store.fetch();

    expect(second, first);
    expect(storage.values[StorageKeys.deviceId], first);
    expect(storage.writes, 1);
  });

  test('parallel fetches share one new id', () async {
    final storage = _MemoryStorage();
    final store = PersistentDeviceIdStore(storage);

    final ids = await Future.wait([store.fetch(), store.fetch()]);

    expect(ids[1], ids[0]);
    expect(storage.writes, 1);
  });
}

final class _MemoryStorage implements KeyValueStorage {
  final values = <String, String>{};
  var writes = 0;

  @override
  Future<String?> readString(String key) async => values[key];

  @override
  Future<void> writeString(String key, String value) async {
    writes += 1;
    values[key] = value;
  }

  @override
  Future<void> remove(String key) async {
    values.remove(key);
  }
}
