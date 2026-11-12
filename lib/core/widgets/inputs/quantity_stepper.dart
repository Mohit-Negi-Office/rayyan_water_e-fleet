import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_shadows.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';

/// Layouts of [QuantityStepper].
enum QuantityStepperSize {
  /// Floating pill on a product card.
  compact,

  /// Full-width bar on product detail.
  wide,
}

/// "− 03 +" quantity control.
class QuantityStepper extends StatelessWidget {
  const QuantityStepper({
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.incrementTooltip,
    required this.decrementTooltip,
    this.size = QuantityStepperSize.compact,
    super.key,
  });

  static const double _buttonSize = 32;

  /// COCO minus is drawn at 11.64 in Figma (`3075:20362`).
  static const double _minusSize = 11.64;

  final int quantity;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final String incrementTooltip;
  final String decrementTooltip;
  final QuantityStepperSize size;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isWide = size == QuantityStepperSize.wide;
    final count = Text(
      quantity.toString().padLeft(2, '0'),
      style: context.textStyles.cardTitle.copyWith(color: colors.textPrimary),
    );
    final minus = _RoundButton(
      icon: AppIcons.minusCoco,
      iconSize: _minusSize,
      tooltip: decrementTooltip,
      onPressed: onDecrement,
      isFilled: false,
    );
    final plus = _RoundButton(
      icon: AppIcons.plusCoco,
      iconSize: AppIconSizes.inline,
      tooltip: incrementTooltip,
      onPressed: onIncrement,
      isFilled: true,
    );
    return Semantics(
      value: '$quantity',
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.s1),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          border: isWide ? Border.all(color: colors.cardBorder) : null,
          boxShadow: isWide ? null : AppShadows.card,
        ),
        child: Row(
          mainAxisSize: isWide ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            minus,
            if (isWide)
              count
            else
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s3),
                child: count,
              ),
            plus,
          ],
        ),
      ),
    );
  }
}

class _RoundButton extends StatelessWidget {
  const _RoundButton({
    required this.icon,
    required this.iconSize,
    required this.tooltip,
    required this.onPressed,
    required this.isFilled,
  });

  final String icon;
  final double iconSize;
  final String tooltip;
  final VoidCallback? onPressed;
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Tooltip(
      message: tooltip,
      child: Material(
        color: isFilled ? colors.brand : colors.surface,
        shape: CircleBorder(
          side: isFilled ? BorderSide.none : BorderSide(color: colors.outline),
        ),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onPressed,
          child: SizedBox.square(
            dimension: QuantityStepper._buttonSize,
            child: AppIcon(
              icon,
              size: iconSize,
              color: isFilled ? colors.onBrand : colors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
