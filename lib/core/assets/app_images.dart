/// Raster assets under `assets/images/`.
abstract final class AppImages {
  /// Bilingual Rayyan logo.
  static const String logo = 'assets/images/logo.png';

  /// Logo on the splash (120 × 81 in Figma `5000:97747`).
  static const double logoWidth = 120;
  static const double logoHeight = 81;

  /// Brand pattern behind the splash, centred crop (Figma `5000:97740`).
  static const String patternSplash = 'assets/images/pattern_splash.jpg';

  /// Brand pattern behind login and OTP, end-aligned crop (Figma
  /// `5000:98349`).
  static const String patternLogin = 'assets/images/pattern_login.jpg';

  /// Brand pattern inside the curved Home / Profile header (Figma
  /// `5665:38778`).
  static const String patternHeader = 'assets/images/pattern_header.jpg';

  /// Water surface at the foot of the splash (Figma "image 38").
  static const String waterTexture = 'assets/images/water_texture.jpg';

  /// Profile with an exit arrow: logout confirmation (Figma `5000:105538`).
  static const String logout = 'assets/images/illustrations/logout.png';
}
