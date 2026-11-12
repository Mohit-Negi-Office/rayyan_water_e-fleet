import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_text_styles.dart';

/// Type scale from the Figma Final Designs text layers (Cocon Offc).
///
/// Figma sets most body copy in Light, titles, buttons and prices in Regular,
/// and only small prices, discount ribbons and badges in Bold. Styles
/// without a line height use Figma's "auto" for Cocon Offc, 1.375 × size
/// (a 16pt line is 22pt tall), with the extra space split evenly above and
/// below as Figma does.
abstract final class AppTypography {
  /// Latin family (`assets/fonts/Cocon/`).
  static const String fontFamily = 'Cocon';

  /// Arabic glyphs. Tajawal is a free stand-in.
  // TODO(figma): confirm the Arabic font with the designer.
  static const List<String> fontFamilyFallback = ['Tajawal'];

  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight bold = FontWeight.w700;

  /// Figma "auto" line height of Cocon Offc.
  static const double autoLineHeight = 1.375;

  static TextStyle _style(
    double size,
    FontWeight weight, {
    double? lineHeight,
    double letterSpacing = 0,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      fontSize: size,
      fontWeight: weight,
      height: lineHeight == null ? autoLineHeight : lineHeight / size,
      leadingDistribution: TextLeadingDistribution.even,
      letterSpacing: letterSpacing,
    );
  }

  /// All named styles. Case transforms (UPPERCASE / Capitalize) are applied
  /// to the string, not the style.
  static final AppTextStyles styles = AppTextStyles(
    displayTitle: _style(24, regular),
    titleXl: _style(28, regular),
    displayPoints: _style(32, regular),
    pageTitle: _style(16, regular), // screen and sheet titles
    heroTitle: _style(20, regular),
    headingLight: _style(20, light, lineHeight: 28), // Headings/Light/H5
    sectionTitle: _style(16, regular, lineHeight: 16),
    sectionTitleOnBrand: _style(16, regular, letterSpacing: 0.5),
    cardTitle: _style(14, regular, lineHeight: 20),
    buttonLarge: _style(16, regular, lineHeight: 24),
    bodyLight: _style(14, light, lineHeight: 20),
    priceLarge: _style(14, regular, lineHeight: 16),
    body: _style(13, regular, lineHeight: 16),
    label: _style(12, regular, lineHeight: 16),
    priceSmall: _style(12, bold, lineHeight: 16),
    captionLight: _style(12, light, lineHeight: 16),
    eyebrow: _style(12, regular, letterSpacing: 2),
    sizeValue: _style(13, regular),
    microLight: _style(10, light),
    microRegular: _style(10, regular, lineHeight: 12),
    badge: _style(8, bold),
    microBold: _style(10, bold), // order payment tags
    subtitleLight: _style(16, light),
    fieldText: _style(14, light, lineHeight: 20), // Input/Text/Value
    fieldHint: _style(14, light),
    fieldError: _style(14, light, lineHeight: 20), // Input/Text/Helper-Error
    priceMedium: _style(16, regular, lineHeight: 16),
    priceHero: _style(20, regular),
    bodyAuto: _style(14, regular),
    bodyLightAuto: _style(14, light),
    captionAuto: _style(12, light),
    labelAuto: _style(12, regular),
    bodyLightLoose: _style(14, light, lineHeight: 21),
    chipLight: _style(14, light, lineHeight: 16),
    sheetTitle: _style(18, regular),
  );

  /// Material [TextTheme] mapped from the named styles.
  static TextTheme textTheme(Color color) {
    final s = styles;
    return TextTheme(
      titleLarge: s.heroTitle,
      titleMedium: s.sectionTitle,
      titleSmall: s.cardTitle,
      bodyLarge: s.cardTitle,
      bodyMedium: s.bodyLight,
      bodySmall: s.body,
      labelLarge: s.label,
      labelMedium: s.label,
      labelSmall: s.microRegular,
    ).apply(bodyColor: color, displayColor: color);
  }
}
