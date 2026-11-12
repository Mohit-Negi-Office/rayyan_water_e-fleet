import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/app/router/app_routes.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/widgets/buttons/app_button.dart';
import 'package:rayyan_driver/core/widgets/states/app_empty_view.dart';

/// Shown for unknown routes and broken deep links.
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: AppEmptyView(
          title: l10n.notFoundTitle,
          message: l10n.notFoundMessage,
          action: AppButton(
            label: l10n.commonGoHome,
            onPressed: () => context.goNamed(AppRoutes.home.name),
          ),
        ),
      ),
    );
  }
}
