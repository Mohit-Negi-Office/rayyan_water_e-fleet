import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';

/// Control drawn by [AppCheckOption].
enum AppCheckControl { checkbox, radio }

/// Label with a checkbox or radio: filter rows (control at the end) and
/// "Set this address as default" (control at the start).
class AppCheckOption extends StatelessWidget {
  const AppCheckOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.control = AppCheckControl.checkbox,
    this.isControlLeading = false,
    this.labelStyle,
    super.key,
  });

  static const double _controlSize = 20;

  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final AppCheckControl control;
  final bool isControlLeading;

  /// Replaces the default label style. Color is kept as given.
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    final fallback =
        (isSelected || (isControlLeading && control == AppCheckControl.checkbox)
                ? styles.cardTitle
                : styles.label)
            .copyWith(color: colors.textPrimary);
    final text = Text(label, style: labelStyle ?? fallback);
    final indicator = AppCheckIndicator(
      isSelected: isSelected,
      control: control,
    );
    return Semantics(
      checked: control == AppCheckControl.checkbox ? isSelected : null,
      selected: control == AppCheckControl.radio ? isSelected : null,
      inMutuallyExclusiveGroup: control == AppCheckControl.radio,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.l),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: AppSpacing.minTapTarget),
          child: Row(
            children: isControlLeading
                ? [
                    indicator,
                    const SizedBox(width: AppSpacing.s3),
                    Expanded(child: text),
                  ]
                : [Expanded(child: text), indicator],
          ),
        ),
      ),
    );
  }
}

/// The checkbox or radio of [AppCheckOption], on its own for rows with
/// their own layout ("Redeem points").
class AppCheckIndicator extends StatelessWidget {
  const AppCheckIndicator({
    required this.isSelected,
    this.control = AppCheckControl.checkbox,
    super.key,
  });

  final bool isSelected;
  final AppCheckControl control;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    const size = AppCheckOption._controlSize;
    return switch (control) {
      AppCheckControl.checkbox => AnimatedContainer(
        duration: kThemeAnimationDuration,
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: isSelected ? colors.brand : colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.xs),
          border: Border.all(color: isSelected ? colors.brand : colors.outline),
        ),
        child: isSelected
            ? Icon(Icons.check_rounded, size: size - 6, color: colors.onBrand)
            : null,
      ),
      AppCheckControl.radio => AnimatedContainer(
        duration: kThemeAnimationDuration,
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colors.surface,
          border: Border.all(
            color: isSelected ? colors.brand : colors.outline,
            width: isSelected ? 6 : 1,
          ),
        ),
      ),
    };
  }
}
