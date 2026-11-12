import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';

/// Labelled value the driver cannot edit (Figma My Details `5673:39994`):
/// light grey box, grey text. [child] replaces the plain [value] (the
/// mobile number with its flag).
class ReadOnlyField extends StatelessWidget {
  const ReadOnlyField({
    required this.label,
    this.value,
    this.child,
    this.labelGap = _labelGap,
    super.key,
  }) : assert(value != null || child != null, 'value or child');

  static const double _labelGap = 6;
  static const double _padV = 14;

  final String label;
  final String? value;
  final Widget? child;
  final double labelGap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    return Semantics(
      readOnly: true,
      label: label,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: styles.bodyLight.copyWith(color: colors.textPrimary),
          ),
          SizedBox(height: labelGap),
          DecoratedBox(
            decoration: BoxDecoration(
              color: colors.fieldDisabled,
              borderRadius: BorderRadius.circular(AppRadius.card),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.s3,
                vertical: _padV,
              ),
              child: DefaultTextStyle.merge(
                style: styles.bodyLight.copyWith(color: colors.iconSecondary),
                child: child ?? Text(value ?? ''),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
