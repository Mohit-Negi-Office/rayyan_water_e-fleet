import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/buttons/app_button.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';
import 'package:rayyan_driver/core/widgets/overlays/app_bottom_sheet.dart';

/// Illustration, title, message and one primary action. Used for "Remove
/// from Favourites?", "outside our delivery area" and delete confirmations.
class AppConfirmSheet extends StatelessWidget {
  const AppConfirmSheet({
    required this.title,
    required this.actionLabel,
    this.message,
    this.illustration,
    this.cancelLabel,
    this.isDestructive = false,
    super.key,
  });

  final String title;
  final String? message;
  final String actionLabel;

  /// Figma illustration; an icon stands in until assets are exported.
  final Widget? illustration;

  /// Adds an outlined button before the action that resolves to false
  /// ("Not Now").
  final String? cancelLabel;

  /// Red action and outline ("Delete" account).
  final bool isDestructive;

  /// Shows the sheet; resolves to true when the action is tapped.
  static Future<bool> show(
    BuildContext context, {
    required String title,
    required String actionLabel,
    String? message,
    Widget? illustration,
    String? cancelLabel,
    bool isDestructive = false,
  }) async {
    final result = await showAppBottomSheet<bool>(
      context: context,
      builder: (_) => AppConfirmSheet(
        title: title,
        message: message,
        actionLabel: actionLabel,
        illustration: illustration,
        cancelLabel: cancelLabel,
        isDestructive: isDestructive,
      ),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    final body = message;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        illustration ??
            AppIcon(
              AppIcons.info,
              size: AppIconSizes.illustration,
              color: colors.accent,
            ),
        const SizedBox(height: AppSpacing.s4),
        Text(
          title,
          style: styles.sheetTitle.copyWith(color: colors.textPrimary),
        ),
        if (body != null) ...[
          const SizedBox(height: AppSpacing.s3),
          Text(
            body,
            style: styles.bodyLightAuto.copyWith(color: colors.iconSecondary),
          ),
        ],
        const SizedBox(height: AppSpacing.s4),
        _Actions(
          actionLabel: actionLabel,
          cancelLabel: cancelLabel,
          isDestructive: isDestructive,
        ),
      ],
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions({
    required this.actionLabel,
    required this.cancelLabel,
    required this.isDestructive,
  });

  final String actionLabel;
  final String? cancelLabel;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final action = AppButton(
      label: actionLabel,
      variant: isDestructive
          ? AppButtonVariant.danger
          : AppButtonVariant.primary,
      size: AppButtonSize.large,
      isExpanded: true,
      onPressed: () => context.pop(true),
    );
    final cancel = cancelLabel;
    if (cancel == null) return action;
    return Row(
      children: [
        Expanded(
          child: AppButton(
            label: cancel,
            variant: AppButtonVariant.outline,
            size: AppButtonSize.large,
            isExpanded: true,
            onPressed: () => context.pop(false),
          ),
        ),
        const SizedBox(width: AppSpacing.s4),
        Expanded(child: action),
      ],
    );
  }
}
