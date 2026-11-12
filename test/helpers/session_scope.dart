import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rayyan_driver/app/session/auth_cubit.dart';
import 'package:rayyan_driver/app/session/driver_profile_cubit.dart';
import 'package:rayyan_driver/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:rayyan_driver/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:rayyan_driver/features/profile/domain/usecases/get_profile.dart';

/// App-wide session cubits over the demo profile, for widget tests.
final class SessionCubits {
  SessionCubits()
    : auth = AuthCubit(),
      profile = DriverProfileCubit(
        const GetProfile(ProfileRepositoryImpl(ProfileMockDataSource())),
      );

  final AuthCubit auth;
  final DriverProfileCubit profile;

  Widget wrap(Widget child) => MultiBlocProvider(
    providers: [
      BlocProvider.value(value: auth),
      BlocProvider.value(value: profile),
    ],
    child: child,
  );

  Future<void> close() async {
    await auth.close();
    await profile.close();
  }
}
