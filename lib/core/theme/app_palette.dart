import 'package:flutter/painting.dart';

/// Raw palette from Figma "Final Designs". Only `core/theme/` may use these.
abstract final class AppPalette {
  static const Color navy700 = Color(0xFF04247C);
  static const Color navy600 = Color(0xFF13338B);
  static const Color blue500 = Color(0xFF3E6AE1);
  static const Color blue100 = Color(0xFFDCE7FB);
  static const Color blue50 = Color(0xFFEAF4FF);
  static const Color teal600 = Color(0xFF00AEA9);
  static const Color teal200 = Color(0xFFC8E6ED);

  /// Figma `Secondary/Green_200`: subtitle on the teal mosque banner.
  static const Color green200 = Color(0xFFCCEFEE);

  /// Teal veil over the Subscribe & Save photo (export: #028884 @ 60%).
  static const Color teal700A60 = Color(0x99028884);
  static const Color teal50 = Color(0xFFEEFAF9);
  static const Color teal600A5 = Color(0x0D00AEA9);

  /// Bottom bar glow (export: teal at 10%).
  static const Color teal600A10 = Color(0x1A00AEA9);
  static const Color mist100 = Color(0xFFE8F1F5);
  static const Color mist50 = Color(0xFFF3F7FA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color slate700 = Color(0xFF3F4A56);
  static const Color gray600 = Color(0xFF74787B);
  static const Color gray500 = Color(0xFF818181);
  static const Color gray400 = Color(0xFFA7A8A9);
  static const Color gray300 = Color(0xFFC4C4C4);
  static const Color red700 = Color(0xFFB70022);

  /// Measured from the login exports: input outline on white, and the
  /// "Didn't receive the OTP?" prompt.
  // TODO(figma): confirm `gray100` / `slate500` against tokens.
  static const Color gray100 = Color(0xFFE6E9F2);
  static const Color slate500 = Color(0xFF617475);

  /// Coupon ribbon navy, measured from the Coupon Code export.
  // TODO(figma): confirm against tokens.
  static const Color navy500 = Color(0xFF002F86);

  /// Glow at the foot of the product card's cart button (Figma
  /// `5167:101891`).
  static const Color olive400 = Color(0xFFB4B65D);

  /// "Order Placed" check badge, measured from the checkout export.
  // TODO(figma): confirm against tokens.
  static const Color green500 = Color(0xFF01C783);

  /// Qatar flag maroon, measured from the +974 country flag.
  static const Color qatarMaroon = Color(0xFF751A46);

  /// Measured from the notification screenshots (order on the way).
  // TODO(figma): confirm `orange500` / `orange50` / `red50` against tokens.
  static const Color orange500 = Color(0xFFF5A524);
  static const Color orange50 = Color(0xFFFFF6E6);
  static const Color red50 = Color(0xFFFCEBEE);

  /// Figma `Icon/Warning`.
  static const Color warning700 = Color(0xFFB37B16);

  /// Figma `Icon/Info`.
  static const Color info500 = Color(0xFF2E90FA);

  /// Amber status icon (order on the way, points validity), Figma
  /// `3876:75508` / `4592:117060`.
  static const Color amber400 = Color(0xFFFFB020);

  /// Deep teal rule icons on How to Earn, Figma `4592:117060`.
  static const Color teal800 = Color(0xFF007A76);

  /// "Worth" on the navy points card, Figma `4804:69645`.
  static const Color gray200 = Color(0xFFE2E2E2);

  /// 10% white strip on the navy points card.
  static const Color white10 = Color(0x1AFFFFFF);

  /// Status green ("Order Confirmed", "PAID"), Figma `5482:141781`.
  static const Color green600 = Color(0xFF009A43);

  /// Soft rule between rows of the order summary card.
  static const Color blue200 = Color(0xFFCFE1FF);

  /// 5% navy outline of option rows and schedule cards (Figma
  /// `5594:147624`).
  static const Color navy700A5 = Color(0x0D04247C);

  /// 8% teal fill of the "2 Deliveries a week" chips.
  static const Color teal600A8 = Color(0x1400AEA9);

  /// Driver app: unselected filter chip and list back button fill.
  static const Color gray50 = Color(0xFFF9F9F9);

  /// Figma `Input/Background/Disabled` and `Input/Border/Default`.
  static const Color gray75 = Color(0xFFF8F8F8);

  /// Strip above the order items ticket (driver order detail).
  static const Color blue300 = Color(0xFFCCDEFF);

  /// "Submit" on Fail Delivery (Figma `5691:36953`).
  static const Color red800 = Color(0xFFB40324);

  /// Driver page backgrounds: soft blue washes over white.
  static const Color blue150 = Color(0xFFC8DBFF);
  static const Color blue75 = Color(0xFFE7F0FF);
  static const Color blue120 = Color(0xFFE0EBFF);
  static const Color blue60 = Color(0xFFECF2FF);
  static const Color blue40 = Color(0xFFEFF4FF);

  /// Splash / login navy wash (Figma `5000:97741`).
  static const Color navy650 = Color(0xFF052886);
  static const Color navy690 = Color(0xFF04247D);

  /// Dimmed, blurred page behind a sheet (Figma `5000:101213`).
  static const Color scrim = Color(0x660D0D0D);

  /// Floating close button over a sheet: black at 30%.
  static const Color black30 = Color(0x4D000000);
  static const Color white25 = Color(0x40FFFFFF);

  /// Shadows of the order detail's bottom bar.
  static const Color navy500A4 = Color(0x0A002F86);
  static const Color black8 = Color(0x14000000);
}
