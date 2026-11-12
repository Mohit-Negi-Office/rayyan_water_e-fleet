import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';

/// Filter chip over the order lists (Figma `5665:38795`): navy with a
/// white outline and white text when selected, light grey otherwise.
class AppChip extends StatelessWidget {
  const AppChip({
    required this.label,
    required this.onTap,
    this.isSelected = false,
    this.icon,
    this.isOutlined = false,
    this.isSmall = false,
    super.key,
  });

  static const double height = 36;
  static const double _smallHeight = 32;

  final String label;
  final VoidCallback? onTap;
  final bool isSelected;
  final String? icon;

  /// Grey outline when not selected, for chips on a white sheet.
  final bool isOutlined;

  /// Smaller text and height (quick phrases on "Special Instruction").
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final foreground = isSelected ? colors.onBrand : colors.textPrimary;
    final leading = icon;
    return Semantics(
      button: true,
      selected: isSelected,
      child: Material(
        color: isSelected ? colors.brand : colors.chipFill,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.card),
          side: isSelected
              ? BorderSide(color: colors.surface)
              : isOutlined
              ? BorderSide(color: colors.inputBorder)
              : BorderSide.none,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(AppRadius.card),
          onTap: onTap,
          child: Container(
            constraints: BoxConstraints(
              minHeight: isSmall ? _smallHeight : height,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: isSmall ? AppSpacing.s3 : AppSpacing.s4,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (leading != null) ...[
                  AppIcon(leading, size: AppSpacing.s4, color: foreground),
                  const SizedBox(width: AppSpacing.s2),
                ],
                Text(
                  label,
                  style:
                      (isSmall
                              ? context.textStyles.label
                              : isSelected
                              ? context.textStyles.priceLarge
                              : context.textStyles.chipLight)
                          .copyWith(color: foreground),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// One option in [AppChipTabs].
final class AppChipItem<T> {
  const AppChipItem({required this.value, required this.label, this.icon});

  final T value;
  final String label;
  final String? icon;
}

/// Horizontally scrolling single-choice chips (category tabs).
class AppChipTabs<T> extends StatelessWidget {
  const AppChipTabs({
    required this.items,
    required this.selected,
    required this.onSelected,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.screenGutter,
    ),
    super.key,
  });

  final List<AppChipItem<T>> items;
  final T selected;
  final ValueChanged<T> onSelected;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppChip.height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: padding,
        itemCount: items.length,
        separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.s2),
        itemBuilder: (context, index) {
          final item = items[index];
          return AppChip(
            key: ValueKey(item.value),
            label: item.label,
            icon: item.icon,
            isSelected: item.value == selected,
            onTap: () => onSelected(item.value),
          );
        },
      ),
    );
  }
}
