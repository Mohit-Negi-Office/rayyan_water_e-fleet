import 'package:flutter/widgets.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';

/// Body under a pinned navy header. Its top edge is the header's wave
/// ([clipper]), so content scrolled up disappears along that curve rather
/// than at a straight line. Put the wave's depth inside the scroll view as
/// top padding, not around it, or the viewport stops short of the curve.
class WaveClippedBody extends StatelessWidget {
  const WaveClippedBody({
    required this.clipper,
    required this.decoration,
    required this.child,
    super.key,
  });

  final CustomClipper<Path> clipper;

  /// Fill below the wave (page background or tint).
  final Decoration decoration;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colors.brand,
      child: ClipPath(
        clipper: clipper,
        child: DecoratedBox(decoration: decoration, child: child),
      ),
    );
  }
}
