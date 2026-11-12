import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/buttons/app_button.dart';

/// Title, options and a full-width button: "Deliver Until", "Delivery
/// Slot", "Cancel Delivery", "Select Resume Date" (Figma `5594:147375`).
class AppChoiceSheet extends StatelessWidget {
  const AppChoiceSheet({
    required this.title,
    required this.options,
    required this.actionLabel,
    required this.onAction,
    this.footer,
    super.key,
  });

  final String title;
  final List<Widget> options;
  final String actionLabel;

  /// Null keeps the button disabled.
  final VoidCallback? onAction;

  /// Between the options and the button ("Deliveries for your selected
  /// dates will be cancelled").
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final footer = this.footer;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(
            header: true,
            child: Text(
              title,
              style: context.textStyles.pageTitle.copyWith(
                color: context.colors.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.s4),
          for (final o in options) ...[
            o,
            const SizedBox(height: AppSpacing.s3),
          ],
          if (footer != null) ...[
            footer,
            const SizedBox(height: AppSpacing.s3),
          ],
          const SizedBox(height: AppSpacing.s3),
          AppButton(
            label: actionLabel,
            size: AppButtonSize.large,
            isExpanded: true,
            onPressed: onAction,
          ),
        ],
      ),
    );
  }
}

/// Small red "ⓘ" note inside a sheet ("All your deliveries from … will be
/// resumed").
class AppSheetNote extends StatelessWidget {
  const AppSheetNote(this.text, {required this.icon, super.key});

  final String text;
  final Widget icon;

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      icon,
      const SizedBox(width: AppSpacing.s2),
      Expanded(
        child: Text(
          text,
          style: context.textStyles.bodyLight.copyWith(
            color: context.colors.error,
          ),
        ),
      ),
    ],
  );
}
