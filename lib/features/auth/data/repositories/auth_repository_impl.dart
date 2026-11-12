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
      guard(() => _remote.requestOtp(phone.e164));

  @override
  Future<Result<void>> verifyOtp(PhoneNumber phone, String code) =>
      guard(() async {
        final tokens = await _remote.verifyOtp(phone: phone.e164, code: code);
        await _tokens.save(
          accessToken: tokens.accessToken,
          refreshToken: tokens.refreshToken,
        );
      });

  @override
  Future<Result<bool>> hasSession() => guard(_tokens.hasAccessToken);

  // TODO(backend): tell the server to revoke the refresh token.
  @override
  Future<Result<void>> logout() => guard(_tokens.clear);
}
