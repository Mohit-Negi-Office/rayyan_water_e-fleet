import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/error/failure_ui_x.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/buttons/app_button.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';
import 'package:rayyan_driver/core/widgets/states/app_state_layout.dart';

/// Renders a [Failure] in place of the content that failed to load.
class AppErrorView extends StatelessWidget {
  const AppErrorView({required this.failure, this.onRetry, super.key})
    : isCompact = false;

  /// Smaller variant for a single section or card.
  const AppErrorView.compact({required this.failure, this.onRetry, super.key})
    : isCompact = true;

  final Failure failure;
  final VoidCallback? onRetry;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final retry = onRetry;
    final icon = failure is NetworkFailure ? AppIcons.offline : AppIcons.error;
    return AppStateLayout(
      isCompact: isCompact,
      illustration: AppIcon(
        icon,
        size: AppIconSizes.state,
        color: context.colors.error,
        semanticLabel: failure.toTitle(l10n),
      ),
      title: failure.toTitle(l10n),
      message: failure.toMessage(l10n),
      action: retry != null && failure.isRetryable
          ? AppButton(
              label: l10n.commonRetry,
              leadingIcon: AppIcons.retry,
              variant: isCompact
                  ? AppButtonVariant.outline
                  : AppButtonVariant.primary,
              onPressed: retry,
            )
          : null,
    );
  }
}
