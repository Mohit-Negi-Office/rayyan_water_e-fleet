import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:rayyan_driver/features/auth/data/datasources/auth_token_local_data_source.dart';
import 'package:rayyan_driver/features/auth/domain/entities/phone_number.dart';
import 'package:rayyan_driver/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
final class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._remote, this._tokens);

  final AuthRemoteDataSource _remote;
  final AuthTokenLocalDataSource _tokens;

  @override
  Future<Result<void>> requestOtp(PhoneNumber phone) =>
      guard(() => _remote.requestOtp(phone.digits));

  @override
  Future<Result<void>> verifyOtp(PhoneNumber phone, String code) =>
      guard(() async {
        final result = await _remote.verifyOtp(phone: phone.digits, code: code);
        await _tokens.save(session: result.session, driver: result.driver);
      });

  @override
  Future<Result<bool>> hasSession() => guard(_tokens.hasAccessToken);

  /// Tells the server first, while the access token is still stored, then
  /// forgets the session on the device even when that call fails.
  @override
  Future<Result<void>> logout() async {
    final notified = await guard(_remote.logout);
    final cleared = await guard(_tokens.clear);
    if (cleared case Err()) return cleared;
    return notified;
  }
}
