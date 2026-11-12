import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rayyan_driver/core/assets/app_images.dart';
import 'package:rayyan_driver/core/theme/app_gradients.dart';
import 'package:rayyan_driver/core/widgets/layout/brand_wave.dart';

/// Navy pattern header with a wavy bottom edge (Home `5665:38771`, Profile
/// `5000:105288`). [crest] is the distance from the top of the screen to
/// the wave's crest; the header reaches [BrandWave.depth] further down at
/// the start edge. [child] is laid over it, under the status bar.
class CurvedBrandHeader extends StatelessWidget {
  const CurvedBrandHeader({required this.crest, this.child, super.key});

  /// Home: crest 148pt down the 874pt frame.
  static const double homeCrest = 148;

  /// Profile: crest 152pt down.
  static const double profileCrest = 152;

  // The navy wash runs from 451pt above the crest to 208pt below it
  // (Figma "Subtract" gradient, measured in the shape's own frame).
  static const double _washAbove = 262.014 + 189.497;
  static const double _washBelow = 469.992 - 262.014;

  final double crest;
  final Widget? child;

  double get height => crest + BrandWave.depth;

  @override
  Widget build(BuildContext context) {
    final rtl = Directionality.of(context) == TextDirection.rtl;
    final h = height;
    double align(double y) => -1 + 2 * y / h;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SizedBox(
        height: h,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipPath(
              clipper: BrandWaveHeaderClipper(crest: crest, rtl: rtl),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    AppImages.patternHeader,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0, align(crest - _washAbove)),
                        end: Alignment(0, align(crest + _washBelow)),
                        colors: AppGradients.headerWashColors,
                        stops: AppGradients.headerWashStops,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ?child,
          ],
        ),
      ),
    );
  }
}
