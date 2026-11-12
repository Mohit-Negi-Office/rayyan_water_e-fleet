import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';

/// 32pt deep-navy box with a 16pt white glyph: directions and call on the
/// order detail (Figma `5672:37945`). It only draws the mark; the card
/// around it takes the tap, so the target stays well over 48pt without
/// changing the card's Figma height.
class AppSquareIconMark extends StatelessWidget {
  const AppSquareIconMark({required this.icon, super.key});

  static const double size = 32;

  final String icon;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.brandDeep,
        borderRadius: BorderRadius.circular(AppRadius.l),
      ),
      child: SizedBox.square(
        dimension: size,
        child: AppIcon(icon, size: AppIconSizes.inline, color: colors.onBrand),
      ),
    );
  }
}
