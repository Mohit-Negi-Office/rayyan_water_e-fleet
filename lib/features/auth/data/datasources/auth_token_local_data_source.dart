import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/storage/secure_storage.dart';
import 'package:rayyan_driver/core/storage/storage_keys.dart';

/// Session tokens, in secure storage only. Throws `CacheException`.
@lazySingleton
class AuthTokenLocalDataSource {
  const AuthTokenLocalDataSource(this._storage);

  final SecureStorage _storage;

  Future<void> save({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(StorageKeys.accessToken, accessToken);
    await _storage.write(StorageKeys.refreshToken, refreshToken);
  }

  Future<bool> hasAccessToken() async {
    final token = await _storage.read(StorageKeys.accessToken);
    return token != null && token.isNotEmpty;
  }

  Future<void> clear() async {
    await _storage.delete(StorageKeys.accessToken);
    await _storage.delete(StorageKeys.refreshToken);
  }
}
