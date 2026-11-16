import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/app_exception.dart';
import 'package:rayyan_driver/core/storage/secure_storage.dart';
import 'package:rayyan_driver/core/storage/storage_keys.dart';
import 'package:rayyan_driver/features/auth/data/models/auth_session_model.dart';

/// Session and driver from OTP verify, in secure storage only.
/// Throws `CacheException`.
@lazySingleton
class AuthTokenLocalDataSource {
  const AuthTokenLocalDataSource(this._storage);

  final SecureStorage _storage;

  Future<void> save({
    required AuthSessionModel session,
    required Map<String, dynamic> driver,
  }) async {
    final encodedDriver = _encodeDriver(driver);
    try {
      await _storage.write(StorageKeys.driverProfile, encodedDriver);
      await _storage.write(StorageKeys.accessToken, session.token);
      await _storage.write(StorageKeys.refreshToken, session.refreshToken);
      await _storage.write(StorageKeys.sessionId, session.sessionId);
      await _storage.write(StorageKeys.publicKey, session.publicKey);
    } on Object {
      await _forgetQuietly();
      rethrow;
    }
  }

  Future<bool> hasAccessToken() async {
    final token = await _storage.read(StorageKeys.accessToken);
    return token != null && token.isNotEmpty;
  }

  Future<void> clear() async {
    await _storage.delete(StorageKeys.accessToken);
    await _storage.delete(StorageKeys.refreshToken);
    await _storage.delete(StorageKeys.sessionId);
    await _storage.delete(StorageKeys.publicKey);
    await _storage.delete(StorageKeys.driverProfile);
  }

  String _encodeDriver(Map<String, dynamic> driver) {
    try {
      return jsonEncode(driver);
    } on Object catch (error) {
      throw CacheException(error.toString());
    }
  }

  Future<void> _forgetQuietly() async {
    try {
      await clear();
    } on Object {
      // The original write failure is the one the caller handles.
    }
  }
}
