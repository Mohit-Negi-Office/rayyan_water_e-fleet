import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';
import 'package:rayyan_driver/core/widgets/selection/app_check_option.dart';

/// White option card with its radio at the end: "1 Month", "I Want
/// Refund", "Pay upfront" (Figma `5594:147624`). [child] shows under the
/// label (a calendar, a stepper, the refund amount).
class AppChoiceCard extends StatelessWidget {
  const AppChoiceCard({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.icon,
    this.isProminent = false,
    this.child,
    super.key,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  /// Leading 20pt brand icon ("Pay as you go").
  final String? icon;

  /// Regular 16 black label whether chosen or not (payment types).
  final bool isProminent;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    final radius = BorderRadius.circular(AppRadius.card);
    final icon = this.icon;
    final child = this.child;
    final style = isProminent
        ? styles.pageTitle.copyWith(color: colors.textPrimary)
        : isSelected
        ? styles.cardTitle.copyWith(color: colors.textPrimary)
        : styles.bodyLight.copyWith(color: colors.textSecondary);
    return Semantics(
      selected: isSelected,
      inMutuallyExclusiveGroup: true,
      button: true,
      child: Material(
        color: colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: radius,
          side: BorderSide(color: colors.hairline),
        ),
        child: InkWell(
          borderRadius: radius,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.tileInline,
              vertical: AppSpacing.s4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    if (icon != null) ...[
                      AppIcon(
                        icon,
                        size: AppIconSizes.header,
                        color: colors.brand,
                      ),
                      const SizedBox(width: AppSpacing.s2),
                    ],
                    Expanded(child: Text(label, style: style)),
                    const SizedBox(width: AppSpacing.s2),
                    AppCheckIndicator(
                      isSelected: isSelected,
                      control: AppCheckControl.radio,
                    ),
                  ],
                ),
                if (child != null) ...[
                  const SizedBox(height: AppSpacing.s3),
                  child,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
