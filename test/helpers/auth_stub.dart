import 'package:mocktail/mocktail.dart';
import 'package:rayyan_driver/app/di/injection.dart';
import 'package:rayyan_driver/core/utils/ticker.dart';
import 'package:rayyan_driver/features/auth/data/datasources/auth_mock_data_source.dart';
import 'package:rayyan_driver/features/auth/data/datasources/auth_token_local_data_source.dart';
import 'package:rayyan_driver/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:rayyan_driver/features/auth/domain/entities/phone_number.dart';
import 'package:rayyan_driver/features/auth/domain/usecases/request_otp.dart';
import 'package:rayyan_driver/features/auth/domain/usecases/verify_otp.dart';
import 'package:rayyan_driver/features/auth/presentation/bloc/login_cubit.dart';
import 'package:rayyan_driver/features/auth/presentation/bloc/otp_cubit.dart';

class _MockTokens extends Mock implements AuthTokenLocalDataSource {}

/// Registers the login cubits over the demo auth data, so routes that build
/// the login screens work without the full DI graph. The countdown never
/// ticks.
void registerAuthStub() {
  final tokens = _MockTokens();
  when(
    () => tokens.save(
      accessToken: any(named: 'accessToken'),
      refreshToken: any(named: 'refreshToken'),
    ),
  ).thenAnswer((_) async {});
  final repo = AuthRepositoryImpl(const AuthMockDataSource(), tokens);
  if (getIt.isRegistered<LoginCubit>()) getIt.unregister<LoginCubit>();
  if (getIt.isRegistered<OtpCubit>()) getIt.unregister<OtpCubit>();
  getIt
    ..registerFactory<LoginCubit>(() => LoginCubit(RequestOtp(repo)))
    ..registerFactoryParam<OtpCubit, PhoneNumber, void>(
      (phone, _) =>
          OtpCubit(VerifyOtp(repo), RequestOtp(repo), const _Still(), phone),
    );
}

class _Still extends Ticker {
  const _Still();

  @override
  Stream<int> countdown(int seconds) => const Stream.empty();
}
