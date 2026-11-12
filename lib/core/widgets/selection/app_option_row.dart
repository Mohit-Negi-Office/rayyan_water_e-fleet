import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';
import 'package:rayyan_driver/core/widgets/selection/app_radio_tile.dart';

/// White row with an icon, a label and a radio at the end (delivery date,
/// slot, frequency). Selected labels are bold; disabled rows are grey.
/// [trailing] replaces the radio (the pencil on a chosen date).
class AppOptionRow extends StatelessWidget {
  const AppOptionRow({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.icon,
    this.leading,
    this.isEnabled = true,
    this.trailing,
    super.key,
  });

  static const double _height = 44;

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final String? icon;

  /// Any leading mark (a flag); wins over [icon].
  final Widget? leading;
  final bool isEnabled;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    final color = isEnabled ? colors.textPrimary : colors.textMuted;
    final icon = this.icon;
    final radius = BorderRadius.circular(AppRadius.card);
    return Semantics(
      selected: isSelected,
      enabled: isEnabled,
      inMutuallyExclusiveGroup: true,
      button: true,
      child: Material(
        color: colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: radius,
          side: BorderSide(color: colors.inputBorder),
        ),
        child: InkWell(
          borderRadius: radius,
          onTap: isEnabled ? onTap : null,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: _height),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s3),
              child: Row(
                children: [
                  if (leading != null) ...[
                    leading!,
                    const SizedBox(width: AppSpacing.s2),
                  ] else if (icon != null) ...[
                    AppIcon(icon, size: AppIconSizes.search, color: color),
                    const SizedBox(width: AppSpacing.s2),
                  ],
                  Expanded(
                    child: Text(
                      label,
                      style: (isSelected ? styles.priceSmall : styles.label)
                          .copyWith(color: color),
                    ),
                  ),
                  trailing ??
                      AppRadioDot(isSelected: isSelected, isEnabled: isEnabled),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
