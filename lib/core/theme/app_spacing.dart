/// Spacing scale. Figma spacing variables: "2" = 8, "3" = 12, "4" = 16, "7" = 32.
abstract final class AppSpacing {
  /// Inferred step — confirm with design.
  static const double s1 = 4;
  static const double s2 = 8;
  static const double s3 = 12;
  static const double s4 = 16;

  /// Observed gap between section title and content.
  static const double s6 = 24;
  static const double s7 = 32;

  /// Observed gap between Home sections.
  static const double s10 = 40;

  /// 20pt side margins (362pt content on a 402pt frame).
  static const double screenGutter = 20;

  /// Inline padding of Profile rows and the points card (Figma
  /// `4198:44341`, `4206:46711`).
  static const double tileInline = 14;

  /// Gap between grid cards.
  static const double cardGap = 16;

  /// Minimum tap target.
  static const double minTapTarget = 48;
}
