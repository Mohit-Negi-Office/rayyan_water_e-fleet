import 'package:flutter/material.dart';
import 'package:rayyan_driver/app/app.dart';
import 'package:rayyan_driver/app/di/injection.dart';
import 'package:rayyan_driver/app/locale/locale_cubit.dart';
import 'package:rayyan_driver/app/router/app_router.dart';
import 'package:rayyan_driver/app/session/auth_cubit.dart';
import 'package:rayyan_driver/app/session/driver_profile_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  final localeCubit = getIt<LocaleCubit>();
  await localeCubit.load();
  final authCubit = getIt<AuthCubit>();

  runApp(
    RayyanDriverApp(
      router: createAppRouter(authCubit: authCubit),
      localeCubit: localeCubit,
      authCubit: authCubit,
      profileCubit: getIt<DriverProfileCubit>(),
    ),
  );
}
