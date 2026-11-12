import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/core/l10n/generated/app_localizations.dart';
import 'package:rayyan_driver/core/theme/app_theme.dart';

/// Localization delegates used by every widget test.
const testLocalizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

extension PumpApp on WidgetTester {
  /// Pumps [widget] inside the real theme and localizations.
  Future<void> pumpApp(Widget widget, {Locale locale = const Locale('en')}) {
    return pumpWidget(
      MaterialApp(
        theme: AppTheme.light(),
        locale: locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: testLocalizationsDelegates,
        home: widget,
      ),
    );
  }

  /// Like [pumpApp] but under a [GoRouter], for widgets that navigate or
  /// close sheets with `context.pop()`. [extraRoutes] stub destinations.
  Future<GoRouter> pumpRouted(
    Widget widget, {
    Locale locale = const Locale('en'),
    List<RouteBase> extraRoutes = const [],
  }) async {
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (_, _) => widget),
        ...extraRoutes,
      ],
    );
    addTearDown(router.dispose);
    await pumpWidget(
      MaterialApp.router(
        theme: AppTheme.light(),
        locale: locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: testLocalizationsDelegates,
        routerConfig: router,
      ),
    );
    return router;
  }
}
