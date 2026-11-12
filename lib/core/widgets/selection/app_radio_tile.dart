import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';

/// Selectable option with a radio indicator (language, payment, slot…).
/// Styled from the language-selection export: tinted fill and brand border
/// when selected, grey outline otherwise.
class AppRadioTile<T> extends StatelessWidget {
  const AppRadioTile({
    required this.value,
    required this.groupValue,
    required this.label,
    required this.onChanged,
    this.isCentered = false,
    this.leading,
    super.key,
  });

  final T value;
  final T? groupValue;
  final String label;
  final ValueChanged<T> onChanged;

  /// Centres radio + label (side-by-side options) instead of spreading them.
  final bool isCentered;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isSelected = value == groupValue;
    final radius = BorderRadius.circular(AppRadius.card);
    final textStyle = isSelected
        ? context.textStyles.cardTitle.copyWith(color: colors.brand)
        : context.textStyles.cardTitle.copyWith(color: colors.textSecondary);
    return Semantics(
      selected: isSelected,
      inMutuallyExclusiveGroup: true,
      button: true,
      child: Material(
        color: isSelected ? colors.selectedSurface : colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: radius,
          side: BorderSide(color: isSelected ? colors.brand : colors.outline),
        ),
        child: InkWell(
          borderRadius: radius,
          onTap: () => onChanged(value),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: AppSpacing.minTapTarget,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s4),
              child: Row(
                mainAxisAlignment: isCentered
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  ?leading,
                  if (leading != null) const SizedBox(width: AppSpacing.s3),
                  AppRadioDot(isSelected: isSelected),
                  const SizedBox(width: AppSpacing.s4),
                  Flexible(
                    child: Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// The radio circle on its own (option rows, cards). Grey when
/// [isEnabled] is false.
class AppRadioDot extends StatelessWidget {
  const AppRadioDot({
    required this.isSelected,
    this.isEnabled = true,
    super.key,
  });

  static const double _size = 16;
  static const double _selectedRing = 4;
  static const double _ring = 1;

  final bool isSelected;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final idle = isEnabled ? colors.iconSecondary : colors.outline;
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? colors.brand : idle,
          width: isSelected ? _selectedRing : _ring,
        ),
      ),
    );
  }
}
