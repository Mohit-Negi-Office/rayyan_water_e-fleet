import 'package:flutter/widgets.dart';

/// The one wave of the driver app: the top edge of the white login panel
/// (Figma "Union" `5000:98354`) and, flipped over, the bottom edge of the
/// navy Home / Profile header (Figma "Subtract" `5665:38779`). Drawn on
/// the 402pt Figma frame and stretched to the real width; mirrored in RTL.
abstract final class BrandWave {
  /// Drop from the crest to the start edge.
  static const double depth = 43.4355;

  /// Adds the wave from the start edge to the end edge, [top] being the
  /// crest line.
  static void addCurve(
    Path path,
    Size size, {
    double top = 0,
    bool rtl = false,
  }) {
    final sx = size.width / _frameWidth;
    double x(double v) => rtl ? size.width - v * sx : v * sx;
    double y(double v) => top + v;
    path
      ..lineTo(x(0), y(depth))
      ..cubicTo(
        x(31.0526),
        y(13.2457),
        x(79.9895),
        y(-2.98474),
        x(143.432),
        y(0.455078),
      )
      ..cubicTo(
        x(249.062),
        y(6.18232),
        x(319.224),
        y(19.8311),
        x(_frameWidth),
        y(2.3291),
      );
  }

  static const double _frameWidth = 402;
}

/// Everything under the wave: the white login panel.
class BrandWavePanelClipper extends CustomClipper<Path> {
  const BrandWavePanelClipper({this.rtl = false});

  final bool rtl;

  @override
  Path getClip(Size size) {
    final path = Path()..moveTo(rtl ? size.width : 0, size.height);
    BrandWave.addCurve(path, size, rtl: rtl);
    return path
      ..lineTo(rtl ? 0 : size.width, size.height)
      ..close();
  }

  @override
  bool shouldReclip(BrandWavePanelClipper oldClipper) => oldClipper.rtl != rtl;
}

/// Everything above the wave: the navy header. [crest] is how far down the
/// wave's crest line sits.
class BrandWaveHeaderClipper extends CustomClipper<Path> {
  const BrandWaveHeaderClipper({required this.crest, this.rtl = false});

  final double crest;
  final bool rtl;

  @override
  Path getClip(Size size) {
    final path = Path()..moveTo(rtl ? size.width : 0, 0);
    BrandWave.addCurve(path, size, top: crest, rtl: rtl);
    return path
      ..lineTo(rtl ? 0 : size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(BrandWaveHeaderClipper oldClipper) =>
      oldClipper.crest != crest || oldClipper.rtl != rtl;
}
