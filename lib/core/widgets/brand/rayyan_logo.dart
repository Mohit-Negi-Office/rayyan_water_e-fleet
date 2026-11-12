import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_images.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';

/// Bilingual Rayyan logo. Never mirrored in RTL.
class RayyanLogo extends StatelessWidget {
  const RayyanLogo({this.scale = 1, super.key});

  /// Multiplier on the Figma size (120 × 81).
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.logo,
      width: AppImages.logoWidth * scale,
      height: AppImages.logoHeight * scale,
      semanticLabel: context.l10n.appName,
    );
  }
}
