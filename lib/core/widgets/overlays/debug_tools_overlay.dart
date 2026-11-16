import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/l10n/generated/app_localizations.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';

/// Dev and staging chip that opens the API request inspector.
///
/// The chip is omitted when [onOpenLogs] is null, which is how production
/// builds hide it.
class DebugToolsOverlay extends StatelessWidget {
  const DebugToolsOverlay({this.onOpenLogs, required this.child, super.key});

  final Future<void> Function()? onOpenLogs;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final onOpenLogs = this.onOpenLogs;
    final top = MediaQuery.viewPaddingOf(context).top + AppSpacing.s1;

    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        if (onOpenLogs != null)
          Positioned(
            top: top,
            left: 0,
            right: 0,
            child: Center(child: _OpenLogsChip(onOpenLogs: onOpenLogs)),
          ),
      ],
    );
  }
}

class _OpenLogsChip extends StatelessWidget {
  const _OpenLogsChip({required this.onOpenLogs});

  final Future<void> Function() onOpenLogs;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = context.colors;
    final radius = BorderRadius.circular(AppRadius.l);

    return Semantics(
      label: l10n.debugOpenLogsHint,
      button: true,
      child: Material(
        color: colors.brand,
        borderRadius: radius,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => onOpenLogs(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.s3,
              vertical: AppSpacing.s1,
            ),
            child: Text(
              l10n.debugOpenLogs,
              style: context.textStyles.label.copyWith(color: colors.onBrand),
            ),
          ),
        ),
      ),
    );
  }
}
