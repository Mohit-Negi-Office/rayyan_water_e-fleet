import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/widgets/layout/top_clamping_scroll_physics.dart';

void main() {
  const physics = TopClampingScrollPhysics();

  FixedScrollMetrics at(double pixels) => FixedScrollMetrics(
    minScrollExtent: 0,
    maxScrollExtent: 1000,
    pixels: pixels,
    viewportDimension: 800,
    axisDirection: AxisDirection.down,
    devicePixelRatio: 3,
  );

  test('pulling down at the top is refused, so nothing moves', () {
    expect(physics.applyBoundaryConditions(at(0), -30), -30);
  });

  test('a fling past the top stops at the top', () {
    // From 20 to -50: the 50 below the top is refused, the 20 is allowed.
    expect(physics.applyBoundaryConditions(at(20), -50), -50);
  });

  test('scrolling inside the content is untouched', () {
    expect(physics.applyBoundaryConditions(at(200), 150), 0);
  });

  test('the bottom edge still bounces', () {
    expect(physics.applyBoundaryConditions(at(1000), 1040), 0);
  });

  test('keeps the parent physics when applied', () {
    final applied = physics.applyTo(const AlwaysScrollableScrollPhysics());
    expect(applied, isA<TopClampingScrollPhysics>());
    expect(applied.parent, isA<AlwaysScrollableScrollPhysics>());
  });
}
