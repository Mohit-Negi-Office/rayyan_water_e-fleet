import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_images.dart';
import 'package:rayyan_driver/core/theme/app_gradients.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';

/// Full-screen navy background of the splash and login screens: the
/// brand pattern at the top under a navy wash, and a faint water texture
/// at the bottom (Figma `5000:97739`, `5000:98300`).
class BrandBackdrop extends StatelessWidget {
  const BrandBackdrop({
    this.pattern = AppImages.patternLogin,
    this.showWater = true,
    super.key,
  });

  /// Crop of the pattern for this screen ([AppImages.patternSplash] or
  /// [AppImages.patternLogin]).
  final String pattern;

  /// The water texture; hidden where the white login panel covers it.
  final bool showWater;

  // Measured on the 402 × 874 frame.
  static const double _patternHeight = 477;
  static const double _waterHeight = 452;
  static const double _waterStart = -177;
  static const double _waterWidth = 756;
  static const double _waterOpacity = 0.1;
  static const double _frameWidth = 402;

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.sizeOf(context).width / _frameWidth;
    return ColoredBox(
      color: context.colors.brandDeep,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: _patternHeight * scale,
            child: Image.asset(
              pattern,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(gradient: AppGradients.brandPatternWash),
          ),
          if (showWater) ...[
            Positioned(
              bottom: 0,
              left: _waterStart * scale,
              width: _waterWidth * scale,
              height: _waterHeight,
              child: Opacity(
                opacity: _waterOpacity,
                child: ClipRect(
                  child: Image.asset(
                    AppImages.waterTexture,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: _waterHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: AppGradients.brandWaterWash,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
