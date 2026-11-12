import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/app/router/app_router.dart';
import 'package:rayyan_driver/core/l10n/generated/app_localizations.dart';
import 'package:rayyan_driver/core/theme/app_theme.dart';

import 'pump_app.dart';
import 'session_scope.dart';

extension PumpRouter on WidgetTester {
  /// Pumps the real app router at [location]. Signed out unless
  /// [signedIn].
  Future<(GoRouter, SessionCubits)> pumpRouter(
    String location, {
    bool signedIn = false,
  }) async {
    final session = SessionCubits();
    addTearDown(session.close);
    if (signedIn) {
      session.auth.signedIn();
      await session.profile.load();
    }
    final router = createAppRouter(
      authCubit: session.auth,
      initialLocation: location,
    );
    addTearDown(router.dispose);
    await pumpWidget(
      session.wrap(
        MaterialApp.router(
          theme: AppTheme.light(),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: testLocalizationsDelegates,
          routerConfig: router,
        ),
      ),
    );
    await pumpAndSettle();
    return (router, session);
  }
}
