import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/app_exception.dart';

/// Encrypted storage for tokens and other sensitive values.
abstract interface class SecureStorage {
  /// Reads [key]; returns null when absent.
  Future<String?> read(String key);

  /// Writes [value] under [key].
  Future<void> write(String key, String value);

  /// Deletes [key].
  Future<void> delete(String key);
}

@LazySingleton(as: SecureStorage)
final class FlutterSecureStorageImpl implements SecureStorage {
  const FlutterSecureStorageImpl(this._storage);

  final FlutterSecureStorage _storage;

  @override
  Future<String?> read(String key) => _run(() => _storage.read(key: key));

  @override
  Future<void> write(String key, String value) =>
      _run(() => _storage.write(key: key, value: value));

  @override
  Future<void> delete(String key) => _run(() => _storage.delete(key: key));

  Future<T> _run<T>(Future<T> Function() body) async {
    try {
      return await body();
    } on Exception catch (e) {
      throw CacheException(e.toString());
    }
  }
}
