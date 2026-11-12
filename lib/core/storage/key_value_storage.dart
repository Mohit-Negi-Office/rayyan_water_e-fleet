import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/app_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Non-sensitive key/value storage. Tokens and PII go in [SecureStorage].
abstract interface class KeyValueStorage {
  /// Reads [key]; returns null when absent.
  Future<String?> readString(String key);

  /// Writes [value] under [key]. Throws [CacheException] on failure.
  Future<void> writeString(String key, String value);

  /// Removes [key].
  Future<void> remove(String key);
}

@LazySingleton(as: KeyValueStorage)
final class SharedPrefsStorage implements KeyValueStorage {
  const SharedPrefsStorage(this._prefs);

  final SharedPreferences _prefs;

  @override
  Future<String?> readString(String key) async => _prefs.getString(key);

  @override
  Future<void> writeString(String key, String value) async {
    final isSaved = await _prefs.setString(key, value);
    if (!isSaved) throw CacheException('Failed to write $key');
  }

  @override
  Future<void> remove(String key) async {
    final isRemoved = await _prefs.remove(key);
    if (!isRemoved) throw CacheException('Failed to remove $key');
  }
}
