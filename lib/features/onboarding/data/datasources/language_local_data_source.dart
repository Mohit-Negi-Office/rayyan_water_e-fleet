import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/storage/key_value_storage.dart';
import 'package:rayyan_driver/core/storage/storage_keys.dart';

/// Reads and writes the language code in local storage.
abstract interface class LanguageLocalDataSource {
  Future<String?> readLanguageCode();

  Future<void> writeLanguageCode(String code);
}

@LazySingleton(as: LanguageLocalDataSource)
final class LanguageLocalDataSourceImpl implements LanguageLocalDataSource {
  const LanguageLocalDataSourceImpl(this._storage);

  final KeyValueStorage _storage;

  @override
  Future<String?> readLanguageCode() =>
      _storage.readString(StorageKeys.languageCode);

  @override
  Future<void> writeLanguageCode(String code) =>
      _storage.writeString(StorageKeys.languageCode, code);
}
