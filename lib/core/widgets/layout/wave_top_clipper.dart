import 'package:flutter/widgets.dart';

/// Clips a wavy top edge, low on the start side and rising to the end, as
/// on the product detail sheet and the My Favourite header. Mirrored when
/// [isRtl].
class WaveTopClipper extends CustomClipper<Path> {
  const WaveTopClipper({required this.depth, this.isRtl = false});

  /// Height of the wave band.
  final double depth;
  final bool isRtl;

  @override
  Path getClip(Size size) {
    final w = size.width;
    double x(double fraction) => isRtl ? w * (1 - fraction) : w * fraction;
    return Path()
      ..moveTo(x(0), depth * 1.4)
      ..cubicTo(x(0.25), depth * 0.1, x(0.55), depth * 0.6, x(1), 0)
      ..lineTo(x(1), size.height)
      ..lineTo(x(0), size.height)
      ..close();
  }

  @override
  bool shouldReclip(WaveTopClipper oldClipper) =>
      oldClipper.depth != depth || oldClipper.isRtl != isRtl;
}
