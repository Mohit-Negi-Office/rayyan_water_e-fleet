import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/storage/key_value_storage.dart';
import 'package:rayyan_driver/core/storage/storage_keys.dart';
import 'package:rayyan_driver/core/utils/device_id_generator.dart';

/// Stable id sent as the `device-id` header.
abstract interface class DeviceIdStore {
  /// The id saved for this install, creating one on the first call.
  Future<String> fetch();
}

@LazySingleton(as: DeviceIdStore)
final class PersistentDeviceIdStore implements DeviceIdStore {
  PersistentDeviceIdStore(this._storage);

  final KeyValueStorage _storage;
  Future<String>? _pending;

  @override
  Future<String> fetch() => _pending ??= _readOrCreate();

  Future<String> _readOrCreate() async {
    final stored = await _storage.readString(StorageKeys.deviceId);
    if (stored != null && stored.isNotEmpty) return stored;
    final created = DeviceIdGenerator.create();
    await _storage.writeString(StorageKeys.deviceId, created);
    return created;
  }
}
