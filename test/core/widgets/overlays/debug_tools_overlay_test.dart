import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/l10n/generated/app_localizations.dart';
import 'package:rayyan_driver/core/theme/app_theme.dart';
import 'package:rayyan_driver/core/widgets/overlays/debug_tools_overlay.dart';

void main() {
  testWidgets('shows the open logs chip when a callback is provided', (
    tester,
  ) async {
    var opened = false;

    await _pumpOverlay(tester, onOpenLogs: () async => opened = true);

    expect(find.text('content'), findsOneWidget);
    expect(find.text('Open logs'), findsOneWidget);

    await tester.tap(find.text('Open logs'));
    await tester.pump();

    expect(opened, isTrue);
  });

  testWidgets('keeps the chip visible while the callback is running', (
    tester,
  ) async {
    final completer = Completer<void>();

    await _pumpOverlay(tester, onOpenLogs: () => completer.future);

    await tester.tap(find.text('Open logs'));
    await tester.pump();

    expect(find.text('Open logs'), findsOneWidget);

    completer.complete();
    await tester.pumpAndSettle();

    expect(find.text('Open logs'), findsOneWidget);
  });

  testWidgets('hides the chip when no callback is provided', (tester) async {
    await _pumpOverlay(tester);

    expect(find.text('Open logs'), findsNothing);
  });
}

Future<void> _pumpOverlay(
  WidgetTester tester, {
  Future<void> Function()? onOpenLogs,
}) {
  return tester.pumpWidget(
    MaterialApp(
      theme: AppTheme.light(),
      locale: const Locale('en'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: DebugToolsOverlay(
        onOpenLogs: onOpenLogs,
        child: const Scaffold(body: Text('content')),
      ),
    ),
  );
}
