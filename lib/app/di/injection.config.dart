// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:rayyan_driver/app/di/register_module.dart' as _i935;
import 'package:rayyan_driver/app/locale/locale_cubit.dart' as _i536;
import 'package:rayyan_driver/app/session/auth_cubit.dart' as _i12;
import 'package:rayyan_driver/app/session/driver_profile_cubit.dart' as _i109;
import 'package:rayyan_driver/core/network/api_client.dart' as _i518;
import 'package:rayyan_driver/core/network/interceptors/accept_language_interceptor.dart'
    as _i1017;
import 'package:rayyan_driver/core/storage/key_value_storage.dart' as _i1054;
import 'package:rayyan_driver/core/storage/secure_storage.dart' as _i441;
import 'package:rayyan_driver/core/utils/clock.dart' as _i335;
import 'package:rayyan_driver/core/utils/ticker.dart' as _i941;
import 'package:rayyan_driver/features/auth/data/datasources/auth_mock_data_source.dart'
    as _i944;
import 'package:rayyan_driver/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i526;
import 'package:rayyan_driver/features/auth/data/datasources/auth_token_local_data_source.dart'
    as _i625;
import 'package:rayyan_driver/features/auth/data/repositories/auth_repository_impl.dart'
    as _i752;
import 'package:rayyan_driver/features/auth/domain/entities/phone_number.dart'
    as _i508;
import 'package:rayyan_driver/features/auth/domain/repositories/auth_repository.dart'
    as _i904;
import 'package:rayyan_driver/features/auth/domain/usecases/logout.dart'
    as _i295;
import 'package:rayyan_driver/features/auth/domain/usecases/request_otp.dart'
    as _i932;
import 'package:rayyan_driver/features/auth/domain/usecases/restore_session.dart'
    as _i104;
import 'package:rayyan_driver/features/auth/domain/usecases/verify_otp.dart'
    as _i141;
import 'package:rayyan_driver/features/auth/presentation/bloc/login_cubit.dart'
    as _i436;
import 'package:rayyan_driver/features/auth/presentation/bloc/otp_cubit.dart'
    as _i688;
import 'package:rayyan_driver/features/onboarding/data/datasources/language_local_data_source.dart'
    as _i400;
import 'package:rayyan_driver/features/onboarding/data/repositories/language_repository_impl.dart'
    as _i326;
import 'package:rayyan_driver/features/onboarding/domain/repositories/language_repository.dart'
    as _i870;
import 'package:rayyan_driver/features/onboarding/domain/usecases/get_saved_language.dart'
    as _i247;
import 'package:rayyan_driver/features/onboarding/domain/usecases/save_language.dart'
    as _i517;
import 'package:rayyan_driver/features/onboarding/presentation/bloc/splash_cubit.dart'
    as _i665;
import 'package:rayyan_driver/features/orders/data/datasources/orders_mock_data_source.dart'
    as _i300;
import 'package:rayyan_driver/features/orders/data/datasources/orders_remote_data_source.dart'
    as _i492;
import 'package:rayyan_driver/features/orders/data/repositories/delivery_orders_repository_impl.dart'
    as _i65;
import 'package:rayyan_driver/features/orders/domain/entities/order_list_scope.dart'
    as _i431;
import 'package:rayyan_driver/features/orders/domain/repositories/delivery_orders_repository.dart'
    as _i93;
import 'package:rayyan_driver/features/orders/domain/usecases/fail_delivery.dart'
    as _i272;
import 'package:rayyan_driver/features/orders/domain/usecases/order_usecases.dart'
    as _i106;
import 'package:rayyan_driver/features/orders/presentation/bloc/current_time_cubit.dart'
    as _i187;
import 'package:rayyan_driver/features/orders/presentation/bloc/fail_delivery_cubit.dart'
    as _i780;
import 'package:rayyan_driver/features/orders/presentation/bloc/order_detail_cubit.dart'
    as _i153;
import 'package:rayyan_driver/features/orders/presentation/bloc/orders_list_cubit.dart'
    as _i782;
import 'package:rayyan_driver/features/orders/presentation/bloc/reassign_cubit.dart'
    as _i660;
import 'package:rayyan_driver/features/profile/data/datasources/profile_remote_data_source.dart'
    as _i181;
import 'package:rayyan_driver/features/profile/data/repositories/profile_repository_impl.dart'
    as _i1051;
import 'package:rayyan_driver/features/profile/domain/repositories/profile_repository.dart'
    as _i286;
import 'package:rayyan_driver/features/profile/domain/usecases/get_profile.dart'
    as _i442;
import 'package:rayyan_driver/features/profile/presentation/bloc/logout_cubit.dart'
    as _i117;
import 'package:rayyan_driver/features/support/data/datasources/support_remote_data_source.dart'
    as _i494;
import 'package:rayyan_driver/features/support/data/repositories/support_repository_impl.dart'
    as _i348;
import 'package:rayyan_driver/features/support/domain/entities/policy_document.dart'
    as _i650;
import 'package:rayyan_driver/features/support/domain/repositories/support_repository.dart'
    as _i249;
import 'package:rayyan_driver/features/support/domain/usecases/support_usecases.dart'
    as _i603;
import 'package:rayyan_driver/features/support/presentation/bloc/faqs_cubit.dart'
    as _i50;
import 'package:rayyan_driver/features/support/presentation/bloc/policy_cubit.dart'
    as _i222;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

const String _mock = 'mock';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.lazySingleton<_i12.AuthCubit>(() => _i12.AuthCubit());
    gh.lazySingleton<_i335.Clock>(() => const _i335.Clock());
    gh.lazySingleton<_i941.Ticker>(() => const _i941.Ticker());
    gh.lazySingleton<_i526.AuthRemoteDataSource>(
      () => const _i944.AuthMockDataSource(),
      registerFor: {_mock},
    );
    gh.lazySingleton<_i181.ProfileRemoteDataSource>(
      () => const _i181.ProfileMockDataSource(),
      registerFor: {_mock},
    );
    gh.factory<_i187.CurrentTimeCubit>(
      () => _i187.CurrentTimeCubit(gh<_i335.Clock>()),
    );
    gh.lazySingleton<_i494.SupportRemoteDataSource>(
      () => const _i494.SupportMockDataSource(),
      registerFor: {_mock},
    );
    gh.lazySingleton<_i441.SecureStorage>(
      () => _i441.FlutterSecureStorageImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i625.AuthTokenLocalDataSource>(
      () => _i625.AuthTokenLocalDataSource(gh<_i441.SecureStorage>()),
    );
    gh.lazySingleton<_i1054.KeyValueStorage>(
      () => _i1054.SharedPrefsStorage(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i1017.AcceptLanguageInterceptor>(
      () => _i1017.AcceptLanguageInterceptor(gh<_i1054.KeyValueStorage>()),
    );
    gh.lazySingleton<_i492.OrdersRemoteDataSource>(
      () => _i300.OrdersMockDataSource(gh<_i335.Clock>()),
      registerFor: {_mock},
    );
    gh.lazySingleton<_i400.LanguageLocalDataSource>(
      () => _i400.LanguageLocalDataSourceImpl(gh<_i1054.KeyValueStorage>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(gh<_i1017.AcceptLanguageInterceptor>()),
    );
    gh.lazySingleton<_i518.ApiClient>(() => _i518.ApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i526.AuthRemoteDataSource>(
      () => _i526.AuthRemoteDataSourceImpl(gh<_i518.ApiClient>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i492.OrdersRemoteDataSource>(
      () => _i492.OrdersRemoteDataSourceImpl(gh<_i518.ApiClient>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i870.LanguageRepository>(
      () => _i326.LanguageRepositoryImpl(gh<_i400.LanguageLocalDataSource>()),
    );
    gh.lazySingleton<_i904.AuthRepository>(
      () => _i752.AuthRepositoryImpl(
        gh<_i526.AuthRemoteDataSource>(),
        gh<_i625.AuthTokenLocalDataSource>(),
      ),
    );
    gh.factory<_i295.Logout>(() => _i295.Logout(gh<_i904.AuthRepository>()));
    gh.factory<_i932.RequestOtp>(
      () => _i932.RequestOtp(gh<_i904.AuthRepository>()),
    );
    gh.factory<_i104.RestoreSession>(
      () => _i104.RestoreSession(gh<_i904.AuthRepository>()),
    );
    gh.factory<_i141.VerifyOtp>(
      () => _i141.VerifyOtp(gh<_i904.AuthRepository>()),
    );
    gh.factory<_i665.SplashCubit>(
      () => _i665.SplashCubit(gh<_i104.RestoreSession>()),
    );
    gh.lazySingleton<_i494.SupportRemoteDataSource>(
      () => _i494.SupportRemoteDataSourceImpl(gh<_i518.ApiClient>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i181.ProfileRemoteDataSource>(
      () => _i181.ProfileRemoteDataSourceImpl(gh<_i518.ApiClient>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i93.DeliveryOrdersRepository>(
      () =>
          _i65.DeliveryOrdersRepositoryImpl(gh<_i492.OrdersRemoteDataSource>()),
    );
    gh.lazySingleton<_i249.SupportRepository>(
      () => _i348.SupportRepositoryImpl(gh<_i494.SupportRemoteDataSource>()),
    );
    gh.factory<_i436.LoginCubit>(
      () => _i436.LoginCubit(gh<_i932.RequestOtp>()),
    );
    gh.factory<_i247.GetSavedLanguage>(
      () => _i247.GetSavedLanguage(gh<_i870.LanguageRepository>()),
    );
    gh.factory<_i517.SaveLanguage>(
      () => _i517.SaveLanguage(gh<_i870.LanguageRepository>()),
    );
    gh.lazySingleton<_i286.ProfileRepository>(
      () => _i1051.ProfileRepositoryImpl(gh<_i181.ProfileRemoteDataSource>()),
    );
    gh.factoryParam<_i688.OtpCubit, _i508.PhoneNumber, dynamic>(
      (phone, _) => _i688.OtpCubit(
        gh<_i141.VerifyOtp>(),
        gh<_i932.RequestOtp>(),
        gh<_i941.Ticker>(),
        phone,
      ),
    );
    gh.factory<_i272.FailDelivery>(
      () => _i272.FailDelivery(gh<_i93.DeliveryOrdersRepository>()),
    );
    gh.factory<_i106.GetOrders>(
      () => _i106.GetOrders(gh<_i93.DeliveryOrdersRepository>()),
    );
    gh.factory<_i106.GetOrderDetail>(
      () => _i106.GetOrderDetail(gh<_i93.DeliveryOrdersRepository>()),
    );
    gh.factory<_i106.ReassignOrder>(
      () => _i106.ReassignOrder(gh<_i93.DeliveryOrdersRepository>()),
    );
    gh.factory<_i106.CompleteDelivery>(
      () => _i106.CompleteDelivery(gh<_i93.DeliveryOrdersRepository>()),
    );
    gh.factory<_i117.LogoutCubit>(() => _i117.LogoutCubit(gh<_i295.Logout>()));
    gh.lazySingleton<_i536.LocaleCubit>(
      () => _i536.LocaleCubit(
        gh<_i247.GetSavedLanguage>(),
        gh<_i517.SaveLanguage>(),
      ),
    );
    gh.factoryParam<_i782.OrdersListCubit, _i431.OrderListScope, dynamic>(
      (scope, _) => _i782.OrdersListCubit(gh<_i106.GetOrders>(), scope),
    );
    gh.factory<_i603.GetPolicy>(
      () => _i603.GetPolicy(gh<_i249.SupportRepository>()),
    );
    gh.factory<_i603.GetFaqs>(
      () => _i603.GetFaqs(gh<_i249.SupportRepository>()),
    );
    gh.factoryParam<_i153.OrderDetailCubit, String, dynamic>(
      (orderId, _) => _i153.OrderDetailCubit(
        gh<_i106.GetOrderDetail>(),
        gh<_i106.CompleteDelivery>(),
        orderId,
      ),
    );
    gh.factory<_i442.GetProfile>(
      () => _i442.GetProfile(gh<_i286.ProfileRepository>()),
    );
    gh.factoryParam<_i660.ReassignCubit, String, dynamic>(
      (orderId, _) => _i660.ReassignCubit(gh<_i106.ReassignOrder>(), orderId),
    );
    gh.factoryParam<_i780.FailDeliveryCubit, String, dynamic>(
      (orderId, _) =>
          _i780.FailDeliveryCubit(gh<_i272.FailDelivery>(), orderId),
    );
    gh.factoryParam<_i222.PolicyCubit, _i650.PolicyType, dynamic>(
      (_type, _) => _i222.PolicyCubit(gh<_i603.GetPolicy>(), _type),
    );
    gh.lazySingleton<_i109.DriverProfileCubit>(
      () => _i109.DriverProfileCubit(gh<_i442.GetProfile>()),
    );
    gh.factory<_i50.FaqsCubit>(() => _i50.FaqsCubit(gh<_i603.GetFaqs>()));
    return this;
  }
}

class _$RegisterModule extends _i935.RegisterModule {}
