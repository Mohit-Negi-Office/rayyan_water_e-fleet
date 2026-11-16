import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/app_exception.dart';
import 'package:rayyan_driver/core/storage/secure_storage.dart';
import 'package:rayyan_driver/core/storage/storage_keys.dart';
import 'package:rayyan_driver/features/profile/data/models/driver_details_model.dart';

/// Driver saved at OTP verify and refreshed from the profile endpoint.
/// Secure storage only: the payload is PII.
abstract interface class ProfileLocalDataSource {
  /// Null when this install has not stored a driver yet.
  Future<DriverDetailsModel?> read();

  /// Replaces the stored driver. [driver] is the profile `data` object.
  Future<void> write(Map<String, dynamic> driver);
}

@LazySingleton(as: ProfileLocalDataSource)
final class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  const ProfileLocalDataSourceImpl(this._storage);

  final SecureStorage _storage;

  @override
  Future<DriverDetailsModel?> read() async {
    final raw = await _storage.read(StorageKeys.driverProfile);
    if (raw == null || raw.isEmpty) return null;
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map) {
        throw const CacheException('Stored driver profile is unreadable');
      }
      return DriverDetailsModel.fromJson(Map<String, dynamic>.from(decoded));
    } on AppException {
      rethrow;
    } on Object catch (error) {
      throw CacheException(error.toString());
    }
  }

  @override
  Future<void> write(Map<String, dynamic> driver) async {
    try {
      await _storage.write(StorageKeys.driverProfile, jsonEncode(driver));
    } on AppException {
      rethrow;
    } on Object catch (error) {
      throw CacheException(error.toString());
    }
  }
}
