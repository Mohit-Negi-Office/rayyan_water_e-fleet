import 'package:flutter/widgets.dart';

/// A Figma illustration from `AppImages`, drawn at a fixed square size.
class AppIllustration extends StatelessWidget {
  const AppIllustration(this.asset, {this.size = emptyState, super.key});

  /// Full-screen empty states (Figma "Illustrations", 192 × 192).
  static const double emptyState = 192;

  /// Bottom-sheet confirmations (Figma 120 × 120).
  static const double sheet = 120;

  final String asset;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      asset,
      width: size,
      height: size,
      fit: BoxFit.contain,
      excludeFromSemantics: true,
    );
  }
}
