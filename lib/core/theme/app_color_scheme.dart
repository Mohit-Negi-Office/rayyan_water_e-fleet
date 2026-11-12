import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_color_scheme_lerp.dart';
import 'package:rayyan_driver/core/theme/app_color_scheme_light.dart';

/// Semantic colors used by features via `context.colors`.
@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  const AppColorScheme({
    required this.brand,
    required this.brandElevated,
    required this.onBrand,
    required this.accent,
    required this.accentSubtle,
    required this.accentTint,
    required this.background,
    required this.surface,
    required this.cardBorder,
    required this.selectedSurface,
    required this.outline,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textMuted,
    required this.iconPrimary,
    required this.iconSecondary,
    required this.disabled,
    required this.success,
    required this.error,
    required this.warning,
    required this.warningSurface,
    required this.info,
    required this.infoSurface,
    required this.successSurface,
    required this.errorSurface,
    required this.inputBorder,
    required this.textSubtle,
    required this.ribbon,
    required this.confirmed,
    required this.navGlow,
    required this.onAccentMuted,
    required this.promoVeil,
    required this.attention,
    required this.accentStrong,
    required this.onBrandMuted,
    required this.onBrandVeil,
    required this.positive,
    required this.hairline,
    required this.accentWash,
    required this.brandDeep,
    required this.chipFill,
    required this.fieldDisabled,
    required this.receiptEdge,
    required this.dangerStrong,
    required this.scrim,
    required this.overlayButton,
    required this.overlayButtonBorder,
  });

  /// Light scheme from Figma. No dark designs exist.
  static const AppColorScheme light = appLightColorScheme;

  final Color brand;
  final Color brandElevated;
  final Color onBrand;
  final Color accent;
  final Color accentSubtle;
  final Color accentTint;
  final Color background;
  final Color surface;
  final Color cardBorder;

  /// Background of a selected option (language selection).
  final Color selectedSurface;

  /// Border of an unselected option.
  final Color outline;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textMuted;
  final Color iconPrimary;
  final Color iconSecondary;
  final Color disabled;
  final Color success;
  final Color error;

  /// Status tints: icon colour + soft surface behind it.
  final Color warning;
  final Color warningSurface;
  final Color info;
  final Color infoSurface;
  final Color successSurface;
  final Color errorSurface;

  /// Outline of inputs and neutral buttons on a white page (login).
  final Color inputBorder;

  /// Soft prompt text ("Didn't receive the OTP?").
  final Color textSubtle;

  /// Side ribbon of an available coupon ("UPTO 20 % OFF").
  final Color ribbon;

  /// "Order Placed" check badge (green, not the teal used elsewhere).
  final Color confirmed;

  /// Glow above the bottom bar's curved edge.
  final Color navGlow;

  /// Secondary text on an `accent` (teal) surface.
  final Color onAccentMuted;

  /// Tint over a promo photo so white text reads on it.
  final Color promoVeil;

  /// Amber status icon (order on the way, points validity).
  final Color attention;

  /// Deep teal icon on a pale teal surface (How to Earn rules).
  final Color accentStrong;

  /// Secondary text and the soft strip on a `brand` (navy) surface.
  final Color onBrandMuted;
  final Color onBrandVeil;

  /// Status green: "Order Confirmed", "Order Scheduled", "PAID".
  final Color positive;

  /// Faint outline of option rows; soft teal fill of summary chips.
  final Color hairline;
  final Color accentWash;

  /// Deep navy of the splash, swipe-to-confirm and the boxed map / call buttons (Figma `Primary/Blue_600 - Base`).
  final Color brandDeep;

  /// Fill of unselected filter chips and the back button on list screens.
  final Color chipFill;

  /// Read-only input fill (My Details) and the outline of reason boxes.
  final Color fieldDisabled;

  /// Coloured strip above the order items ticket.
  final Color receiptEdge;

  /// Destructive call to action fill ("Submit" on Fail Delivery).
  final Color dangerStrong;

  /// Dimmed page behind a sheet.
  final Color scrim;

  /// Floating close button over a sheet.
  final Color overlayButton;

  /// Outline of [overlayButton].
  final Color overlayButtonBorder;

  @override
  AppColorScheme copyWith({
    Color? brand,
    Color? brandElevated,
    Color? onBrand,
    Color? accent,
    Color? accentSubtle,
    Color? accentTint,
    Color? background,
    Color? surface,
    Color? cardBorder,
    Color? selectedSurface,
    Color? outline,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textMuted,
    Color? iconPrimary,
    Color? iconSecondary,
    Color? disabled,
    Color? success,
    Color? error,
    Color? warning,
    Color? warningSurface,
    Color? info,
    Color? infoSurface,
    Color? successSurface,
    Color? errorSurface,
    Color? inputBorder,
    Color? textSubtle,
    Color? ribbon,
    Color? confirmed,
    Color? navGlow,
    Color? onAccentMuted,
    Color? promoVeil,
    Color? attention,
    Color? accentStrong,
    Color? onBrandMuted,
    Color? onBrandVeil,
    Color? positive,
    Color? hairline,
    Color? accentWash,
    Color? brandDeep,
    Color? chipFill,
    Color? fieldDisabled,
    Color? receiptEdge,
    Color? dangerStrong,
    Color? scrim,
    Color? overlayButton,
    Color? overlayButtonBorder,
  }) {
    return AppColorScheme(
      brand: brand ?? this.brand,
      brandElevated: brandElevated ?? this.brandElevated,
      onBrand: onBrand ?? this.onBrand,
      accent: accent ?? this.accent,
      accentSubtle: accentSubtle ?? this.accentSubtle,
      accentTint: accentTint ?? this.accentTint,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      cardBorder: cardBorder ?? this.cardBorder,
      selectedSurface: selectedSurface ?? this.selectedSurface,
      outline: outline ?? this.outline,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textMuted: textMuted ?? this.textMuted,
      iconPrimary: iconPrimary ?? this.iconPrimary,
      iconSecondary: iconSecondary ?? this.iconSecondary,
      disabled: disabled ?? this.disabled,
      success: success ?? this.success,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      warningSurface: warningSurface ?? this.warningSurface,
      info: info ?? this.info,
      infoSurface: infoSurface ?? this.infoSurface,
      successSurface: successSurface ?? this.successSurface,
      errorSurface: errorSurface ?? this.errorSurface,
      inputBorder: inputBorder ?? this.inputBorder,
      textSubtle: textSubtle ?? this.textSubtle,
      ribbon: ribbon ?? this.ribbon,
      confirmed: confirmed ?? this.confirmed,
      navGlow: navGlow ?? this.navGlow,
      onAccentMuted: onAccentMuted ?? this.onAccentMuted,
      promoVeil: promoVeil ?? this.promoVeil,
      attention: attention ?? this.attention,
      accentStrong: accentStrong ?? this.accentStrong,
      onBrandMuted: onBrandMuted ?? this.onBrandMuted,
      onBrandVeil: onBrandVeil ?? this.onBrandVeil,
      positive: positive ?? this.positive,
      hairline: hairline ?? this.hairline,
      accentWash: accentWash ?? this.accentWash,
      brandDeep: brandDeep ?? this.brandDeep,
      chipFill: chipFill ?? this.chipFill,
      fieldDisabled: fieldDisabled ?? this.fieldDisabled,
      receiptEdge: receiptEdge ?? this.receiptEdge,
      dangerStrong: dangerStrong ?? this.dangerStrong,
      scrim: scrim ?? this.scrim,
      overlayButton: overlayButton ?? this.overlayButton,
      overlayButtonBorder: overlayButtonBorder ?? this.overlayButtonBorder,
    );
  }

  @override
  AppColorScheme lerp(AppColorScheme? other, double t) =>
      other == null ? this : lerpColorScheme(this, other, t);
}
