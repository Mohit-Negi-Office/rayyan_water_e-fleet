import 'package:alice/alice.dart';
import 'package:flutter/widgets.dart';
import 'package:rayyan_driver/app/app.dart';
import 'package:rayyan_driver/app/di/injection.dart';
import 'package:rayyan_driver/app/flavor.dart';
import 'package:rayyan_driver/app/locale/locale_cubit.dart';
import 'package:rayyan_driver/app/router/app_router.dart';
import 'package:rayyan_driver/app/session/auth_cubit.dart';
import 'package:rayyan_driver/app/session/driver_profile_cubit.dart';
import 'package:rayyan_driver/core/debug/api_log_inspector.dart';
import 'package:rayyan_driver/core/network/app_config.dart';

/// Starts the app for [flavor]: DI, session, then [runApp].
Future<void> bootstrap({required AppFlavor flavor}) async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.use(flavor);
  if (AppConfig.enableLogs && !getIt.isRegistered<Alice>()) {
    getIt.registerSingleton<Alice>(ApiLogInspector.create());
  }
  await configureDependencies();

  final navigatorKey = GlobalKey<NavigatorState>();
  if (getIt.isRegistered<Alice>()) {
    getIt<Alice>().setNavigatorKey(navigatorKey);
  }

  final localeCubit = getIt<LocaleCubit>();
  await localeCubit.load();
  final authCubit = getIt<AuthCubit>();

  runApp(
    RayyanDriverApp(
      router: createAppRouter(authCubit: authCubit, navigatorKey: navigatorKey),
      localeCubit: localeCubit,
      authCubit: authCubit,
      profileCubit: getIt<DriverProfileCubit>(),
      onOpenLogs: getIt.isRegistered<Alice>()
          ? () => ApiLogInspector.open(getIt<Alice>())
          : null,
    ),
  );
}
