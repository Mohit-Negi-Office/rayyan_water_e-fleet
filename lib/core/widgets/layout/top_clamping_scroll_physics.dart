import 'package:flutter/widgets.dart';

/// iOS bounce everywhere except the top edge, which stops dead like
/// Android. Under a pinned header, a top bounce would drag the content
/// down and open a gap of page background below the header; clamping
/// instead reports the pull as overscroll, which `RefreshIndicator` uses.
class TopClampingScrollPhysics extends BouncingScrollPhysics {
  const TopClampingScrollPhysics({super.parent});

  @override
  TopClampingScrollPhysics applyTo(ScrollPhysics? ancestor) =>
      TopClampingScrollPhysics(parent: buildParent(ancestor));

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    final top = position.minScrollExtent;
    // Already at the top and pulling further down.
    if (value < position.pixels && position.pixels <= top) {
      return value - position.pixels;
    }
    // Moving from inside the content to past the top.
    if (value < top && top < position.pixels) return value - top;
    return super.applyBoundaryConditions(position, value);
  }
}
