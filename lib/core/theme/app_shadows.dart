import 'package:flutter/painting.dart';
import 'package:rayyan_driver/core/theme/app_palette.dart';

/// Box shadow tokens.
abstract final class AppShadows {
  /// Product card, carousel indicator.
  static const List<BoxShadow> card = [
    BoxShadow(
      offset: Offset(0, 6),
      blurRadius: 16,
      color: AppPalette.teal600A5,
    ),
  ];

  /// Home category cards.
  static const List<BoxShadow> categoryCard = [
    BoxShadow(
      offset: Offset(0, 6),
      blurRadius: 23,
      color: AppPalette.teal600A5,
    ),
  ];

  /// Sheet-like bar at the foot of the order detail (Figma `5672:38307`).
  static const List<BoxShadow> bottomBar = [
    BoxShadow(blurRadius: 4, color: AppPalette.navy500A4),
    BoxShadow(offset: Offset(0, 8), blurRadius: 16, color: AppPalette.black8),
  ];
}
