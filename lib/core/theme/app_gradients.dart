import 'package:flutter/painting.dart';
import 'package:rayyan_driver/core/theme/app_palette.dart';

/// Gradient tokens.
abstract final class AppGradients {
  /// Light blue background of list screens (notifications, products,
  /// locations), measured from the screenshots.
  static const LinearGradient pageTint = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppPalette.blue100, AppPalette.blue50],
  );

  /// Home body background (sits over a 30%-opacity background image).
  static final LinearGradient pageBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppPalette.mist100.withValues(alpha: 0),
      AppPalette.mist100.withValues(alpha: 0.3),
      AppPalette.mist100,
    ],
    stops: const [0, 0.657, 0.924],
  );

  /// Footer "From the heart of Qatar" lines.
  static final LinearGradient dividerBrand = LinearGradient(
    begin: AlignmentDirectional.centerStart,
    end: AlignmentDirectional.centerEnd,
    colors: [AppPalette.navy700.withValues(alpha: 0), AppPalette.navy700],
  );

  /// Faded rule beside "Choose language" (navy at 50% at the inner end).
  static final LinearGradient dividerBrandSoft = LinearGradient(
    begin: AlignmentDirectional.centerStart,
    end: AlignmentDirectional.centerEnd,
    colors: [
      AppPalette.white.withValues(alpha: 0),
      AppPalette.navy700.withValues(alpha: 0.5),
    ],
  );

  /// Blue tint over the top of the splash photo (first 197.5pt of 874pt).
  static final LinearGradient splashTopTint = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppPalette.blue500.withValues(alpha: 0.29),
      AppPalette.white.withValues(alpha: 0),
    ],
    stops: const [0, 197.5 / 874],
  );

  /// Darkening toward the bottom of the splash photo (263pt → 605pt).
  static final LinearGradient splashBottomShade = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppPalette.black.withValues(alpha: 0), AppPalette.black],
    stops: const [263 / 874, 605 / 874],
  );

  /// Grey rules beside "Or Login With", measured from the login export.
  static final LinearGradient dividerNeutral = LinearGradient(
    begin: AlignmentDirectional.centerStart,
    end: AlignmentDirectional.centerEnd,
    colors: [AppPalette.white.withValues(alpha: 0), AppPalette.gray300],
  );

  /// Section title rule on the navy band.
  static final LinearGradient dividerOnBrand = LinearGradient(
    begin: AlignmentDirectional.centerStart,
    end: AlignmentDirectional.centerEnd,
    colors: [AppPalette.white.withValues(alpha: 0), AppPalette.white],
  );

  /// Ring behind the product card's cart button: white, fading to olive
  /// at the bottom edge (Figma `5167:101891`).
  static const LinearGradient cardActionRing = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppPalette.white, AppPalette.white, AppPalette.olive400],
    stops: [0, 0.596154, 1],
  );

  /// Border of the navy points card: teal at the top end fading to white
  /// at the bottom start (Figma `4804:69645`).
  static const LinearGradient pointsCardBorder = LinearGradient(
    begin: AlignmentDirectional(0.95, -1),
    end: AlignmentDirectional(-0.85, 0.68),
    colors: [AppPalette.teal600, AppPalette.white],
  );

  /// 1px rule between rows of the order summary card, fading at both ends
  /// (Figma `5482:141781`).
  static final LinearGradient cardRule = LinearGradient(
    colors: [
      AppPalette.blue200.withValues(alpha: 0),
      AppPalette.blue200.withValues(alpha: 0.6),
      AppPalette.blue200.withValues(alpha: 0),
    ],
  );

  /// Amber wash fading down a notice card ("Payment failed…"), Figma
  /// `4589:100466`.
  static final LinearGradient noticeWash = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppPalette.amber400.withValues(alpha: 0.15),
      AppPalette.white.withValues(alpha: 0),
    ],
  );

  /// Driver list screens (Home, Past Orders, Re-Assigned, Profile): a
  /// diagonal blue wash at 60% over white (Figma `5665:38771`, 148°).
  static final LinearGradient listWash = LinearGradient(
    begin: const Alignment(-1.33, -0.91),
    end: const Alignment(1.33, 0.91),
    colors: [
      AppPalette.blue150.withValues(alpha: 0.6),
      AppPalette.blue75.withValues(alpha: 0.6),
    ],
    stops: const [0.0089, 0.596],
  );

  /// Driver detail screens (Order Detail, My Details): a vertical wash
  /// that reaches its end colour 77% down a 1600pt frame (Figma
  /// `5000:100074`), so a phone screen only shows its upper part.
  static const LinearGradient detailWash = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment(0, 1.83),
    colors: [AppPalette.blue120, AppPalette.blue60],
  );

  /// Navy wash over the splash / login pattern (Figma `5000:97741`). The
  /// pattern shows through at about 5% under the header, measured from the
  /// Figma render, and disappears by mid-screen.
  static final LinearGradient brandPatternWash = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppPalette.navy700.withValues(alpha: 0.95),
      AppPalette.navy700.withValues(alpha: 0.965),
      AppPalette.navy700,
    ],
    stops: const [0, 0.21682, 0.53776],
  );

  /// Lower half of the splash, over the water texture (Figma
  /// `5000:97743`).
  static final LinearGradient brandWaterWash = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppPalette.navy700,
      AppPalette.navy690.withValues(alpha: 0.7),
      AppPalette.navy650.withValues(alpha: 0.7),
    ],
    stops: const [0.0366, 0.4336, 0.9454],
  );

  /// Navy wash over the pattern of the curved Home / Profile header
  /// (Figma "Subtract" `5665:38779`), as stops along its own height.
  static final List<Color> headerWashColors = [
    AppPalette.navy650.withValues(alpha: 0),
    AppPalette.navy690.withValues(alpha: 0.93),
    AppPalette.navy700,
  ];
  static const List<double> headerWashStops = [0, 0.198088, 1];

  /// Strong rule under the Re-assign sheet field (Figma `5000:101219`).
  static final LinearGradient sheetRule = LinearGradient(
    colors: [
      AppPalette.blue200.withValues(alpha: 0.4),
      AppPalette.blue200,
      AppPalette.blue200.withValues(alpha: 0.4),
    ],
    stops: const [0, 0.50481, 1],
  );

  /// Soft teal fade behind order item thumbnails (Figma `5672:37933`).
  static final LinearGradient thumbWash = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppPalette.white.withValues(alpha: 0),
      AppPalette.teal600.withValues(alpha: 0.07),
    ],
  );
}
