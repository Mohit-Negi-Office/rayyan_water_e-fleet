import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';

/// Icon-only button with a 48pt hit area, tooltip and optional badge.
class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.iconSize = 20,
    this.color,
    this.backgroundColor,
    this.badgeCount = 0,
    super.key,
  });

  final String icon;
  final String tooltip;
  final VoidCallback? onPressed;
  final double iconSize;
  final Color? color;

  /// When set, draws the icon inside a rounded box (e.g. the header bell).
  final Color? backgroundColor;
  final int badgeCount;

  @override
  Widget build(BuildContext context) {
    final iconWidget = Badge(
      isLabelVisible: badgeCount > 0,
      label: Text('$badgeCount'),
      backgroundColor: context.colors.accent,
      textColor: context.colors.onBrand,
      child: AppIcon(icon, size: iconSize, color: color),
    );
    final background = backgroundColor;
    return IconButton(
      tooltip: tooltip,
      onPressed: onPressed,
      constraints: const BoxConstraints(
        minWidth: AppSpacing.minTapTarget,
        minHeight: AppSpacing.minTapTarget,
      ),
      style: background == null
          ? null
          : IconButton.styleFrom(
              backgroundColor: background,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.card),
              ),
            ),
      icon: iconWidget,
    );
  }
}
