import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/app/locale/locale_cubit.dart';
import 'package:rayyan_driver/app/locale/locale_state_x.dart';
import 'package:rayyan_driver/app/session/auth_cubit.dart';
import 'package:rayyan_driver/app/session/auth_state.dart';
import 'package:rayyan_driver/app/session/driver_profile_cubit.dart';
import 'package:rayyan_driver/core/l10n/generated/app_localizations.dart';
import 'package:rayyan_driver/core/theme/app_theme.dart';
import 'package:rayyan_driver/core/widgets/overlays/debug_tools_overlay.dart';

/// Root widget: app-wide Blocs, theme, localization and router.
class RayyanDriverApp extends StatelessWidget {
  const RayyanDriverApp({
    required this.router,
    required this.localeCubit,
    required this.authCubit,
    required this.profileCubit,
    this.onOpenLogs,
    super.key,
  });

  final GoRouter router;
  final LocaleCubit localeCubit;
  final AuthCubit authCubit;
  final DriverProfileCubit profileCubit;

  /// Opens the API inspector. Null on production, which hides the chip.
  final Future<void> Function()? onOpenLogs;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: localeCubit),
        BlocProvider.value(value: authCubit),
        BlocProvider.value(value: profileCubit),
      ],
      // The driver's profile belongs to the session.
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, auth) => switch (auth) {
          AuthAuthenticated() => profileCubit.load(),
          AuthSignedOut() => profileCubit.clear(),
        },
        child: _AppView(router: router, onOpenLogs: onOpenLogs),
      ),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView({required this.router, required this.onOpenLogs});

  final GoRouter router;
  final Future<void> Function()? onOpenLogs;

  @override
  Widget build(BuildContext context) {
    final locale = context.select((LocaleCubit c) => c.state.locale);
    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context).appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        final content = child ?? const SizedBox.shrink();
        final onOpenLogs = this.onOpenLogs;
        if (onOpenLogs == null) return content;
        return DebugToolsOverlay(onOpenLogs: onOpenLogs, child: content);
      },
      routerConfig: router,
    );
  }
}
