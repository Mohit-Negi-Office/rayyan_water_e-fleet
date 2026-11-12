import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';

/// Loading state for a screen or, with [AppLoadingView.compact], a section.
class AppLoadingView extends StatelessWidget {
  const AppLoadingView({super.key}) : isCompact = false;

  const AppLoadingView.compact({super.key}) : isCompact = true;

  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final indicator = CircularProgressIndicator(color: context.colors.brand);
    if (isCompact) {
      return Padding(
        padding: const EdgeInsets.all(AppSpacing.s4),
        child: Center(child: indicator),
      );
    }
    return Center(child: indicator);
  }
}
