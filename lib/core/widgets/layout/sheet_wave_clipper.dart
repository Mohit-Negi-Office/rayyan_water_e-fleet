import 'package:flutter/widgets.dart';

/// Clips the product detail sheet's top edge: low on the start side, a
/// crest a third of the way across, a shallow dip near the end and a small
/// lift at the end edge. Measured from the export; mirrored when [isRtl].
class SheetWaveClipper extends CustomClipper<Path> {
  const SheetWaveClipper({required this.depth, this.isRtl = false});

  /// How far below the crest the start edge is. Everything else scales
  /// with it; the crest is at the top of the box.
  final double depth;
  final bool isRtl;

  /// Crest and dip, as fractions of the width.
  static const double _crest = 0.31;
  static const double _dip = 0.82;

  /// Dip and end-edge heights, as fractions of [depth].
  static const double _dipDepth = 0.25;
  static const double _endDepth = 0.06;

  @override
  Path getClip(Size size) {
    final w = size.width;
    double x(double fraction) => isRtl ? w * (1 - fraction) : w * fraction;
    double y(double fraction) => depth * fraction;
    return Path()
      ..moveTo(x(0), y(1))
      // Steep rise from the start edge to the crest.
      ..cubicTo(x(0.1), y(0.33), x(0.19), 0, x(_crest), 0)
      // Long, gentle fall to the dip.
      ..cubicTo(x(0.44), 0, x(0.65), y(_dipDepth), x(_dip), y(_dipDepth))
      // Small lift to the end edge.
      ..cubicTo(x(0.88), y(_dipDepth), x(0.94), y(0.16), x(1), y(_endDepth))
      ..lineTo(x(1), size.height)
      ..lineTo(x(0), size.height)
      ..close();
  }

  @override
  bool shouldReclip(SheetWaveClipper oldClipper) =>
      oldClipper.depth != depth || oldClipper.isRtl != isRtl;
}
