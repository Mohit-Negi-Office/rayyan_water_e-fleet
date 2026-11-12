import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A Figma-exported SVG icon from `AppIcons`, drawn at a square [size]
/// whatever box it sits in.
///
/// Exports are black, so the glyph is recoloured with [color] (falling back
/// to the ambient [IconTheme]). Pass `tint: false` for multicolour marks
/// (Google, Apple, brand art) so their own fills are kept.
class AppIcon extends StatelessWidget {
  const AppIcon(
    this.asset, {
    this.size = 24,
    this.color,
    this.matchTextDirection = false,
    this.tint = true,
    this.semanticLabel,
    super.key,
  });

  final String asset;
  final double size;
  final Color? color;

  /// Mirror the glyph in RTL; for directional arrows and chevrons.
  final bool matchTextDirection;

  /// `false` keeps the SVG's own colours.
  final bool tint;

  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final resolved = color ?? IconTheme.of(context).color;
    final filter = tint && resolved != null
        ? ColorFilter.mode(resolved, BlendMode.srcIn)
        : null;
    // Shrink-wraps under loose constraints and centres the glyph under
    // tight ones, so a fixed-size box (a 48pt button) never stretches it.
    return Center(
      widthFactor: 1,
      heightFactor: 1,
      child: SvgPicture.asset(
        asset,
        width: size,
        height: size,
        colorFilter: filter,
        matchTextDirection: matchTextDirection,
        semanticsLabel: semanticLabel,
        excludeFromSemantics: semanticLabel == null,
      ),
    );
  }
}
