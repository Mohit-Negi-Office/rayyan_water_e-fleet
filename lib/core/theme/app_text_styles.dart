import 'package:flutter/material.dart';

/// Named text styles from Figma, read via `context.textStyles`.
@immutable
class AppTextStyles extends ThemeExtension<AppTextStyles> {
  const AppTextStyles({
    required this.displayTitle,
    required this.titleXl,
    required this.displayPoints,
    required this.pageTitle,
    required this.heroTitle,
    required this.sectionTitle,
    required this.sectionTitleOnBrand,
    required this.cardTitle,
    required this.headingLight,
    required this.buttonLarge,
    required this.bodyLight,
    required this.priceLarge,
    required this.body,
    required this.label,
    required this.priceSmall,
    required this.captionLight,
    required this.eyebrow,
    required this.sizeValue,
    required this.microLight,
    required this.microRegular,
    required this.badge,
    required this.microBold,
    required this.subtitleLight,
    required this.fieldText,
    required this.fieldHint,
    required this.fieldError,
    required this.priceMedium,
    required this.priceHero,
    required this.bodyAuto,
    required this.bodyLightAuto,
    required this.captionAuto,
    required this.labelAuto,
    required this.bodyLightLoose,
    required this.chipLight,
    required this.sheetTitle,
  });

  final TextStyle displayTitle;

  /// Large screen title (28 regular).
  final TextStyle titleXl;

  /// Points balance figure (32 regular).
  final TextStyle displayPoints;
  final TextStyle pageTitle;
  final TextStyle heroTitle;
  final TextStyle sectionTitle;
  final TextStyle sectionTitleOnBrand;
  final TextStyle cardTitle;

  /// Light 20 / 28 heading ("Welcome to", Figma `Headings/Light/H5`).
  final TextStyle headingLight;
  final TextStyle buttonLarge;
  final TextStyle bodyLight;
  final TextStyle priceLarge;
  final TextStyle body;
  final TextStyle label;
  final TextStyle priceSmall;
  final TextStyle captionLight;
  final TextStyle eyebrow;
  final TextStyle sizeValue;
  final TextStyle microLight;
  final TextStyle microRegular;
  final TextStyle badge;

  /// Payment tags ("PAID", "COD").
  final TextStyle microBold;

  /// Header subtitle and soft prompts on the login screens.
  final TextStyle subtitleLight;

  /// Input labels and values on white forms (login, Fill Your Details).
  final TextStyle fieldText;
  final TextStyle fieldHint;
  final TextStyle fieldError;

  /// Cart line price and order total (16 bold).
  final TextStyle priceMedium;

  /// Checkout total in the Place Order bar (20 bold).
  final TextStyle priceHero;

  /// 14 Regular, auto height: order status, "PAID", Total Amount.
  final TextStyle bodyAuto;

  /// 14 Light, auto height: order number, addresses, card rows.
  final TextStyle bodyLightAuto;

  /// 12 Light, auto height: "3 Items | 08:00 AM", Payment Status caption.
  final TextStyle captionAuto;

  /// 12 Regular, auto height: payment state on order cards.
  final TextStyle labelAuto;

  /// 14 Light on 21: FAQ answers and policy paragraphs.
  final TextStyle bodyLightLoose;

  /// 14 Light on 16: unselected filter chip.
  final TextStyle chipLight;

  /// 18 Regular: confirmation sheet title ("Are you sure you want to logout?").
  final TextStyle sheetTitle;

  @override
  AppTextStyles copyWith({
    TextStyle? displayTitle,
    TextStyle? titleXl,
    TextStyle? displayPoints,
    TextStyle? pageTitle,
    TextStyle? heroTitle,
    TextStyle? sectionTitle,
    TextStyle? sectionTitleOnBrand,
    TextStyle? cardTitle,
    TextStyle? headingLight,
    TextStyle? buttonLarge,
    TextStyle? bodyLight,
    TextStyle? priceLarge,
    TextStyle? body,
    TextStyle? label,
    TextStyle? priceSmall,
    TextStyle? captionLight,
    TextStyle? eyebrow,
    TextStyle? sizeValue,
    TextStyle? microLight,
    TextStyle? microRegular,
    TextStyle? badge,
    TextStyle? microBold,
    TextStyle? subtitleLight,
    TextStyle? fieldText,
    TextStyle? fieldHint,
    TextStyle? fieldError,
    TextStyle? priceMedium,
    TextStyle? priceHero,
    TextStyle? bodyAuto,
    TextStyle? bodyLightAuto,
    TextStyle? captionAuto,
    TextStyle? labelAuto,
    TextStyle? bodyLightLoose,
    TextStyle? chipLight,
    TextStyle? sheetTitle,
  }) {
    return AppTextStyles(
      displayTitle: displayTitle ?? this.displayTitle,
      titleXl: titleXl ?? this.titleXl,
      displayPoints: displayPoints ?? this.displayPoints,
      pageTitle: pageTitle ?? this.pageTitle,
      heroTitle: heroTitle ?? this.heroTitle,
      sectionTitle: sectionTitle ?? this.sectionTitle,
      sectionTitleOnBrand: sectionTitleOnBrand ?? this.sectionTitleOnBrand,
      cardTitle: cardTitle ?? this.cardTitle,
      headingLight: headingLight ?? this.headingLight,
      buttonLarge: buttonLarge ?? this.buttonLarge,
      bodyLight: bodyLight ?? this.bodyLight,
      priceLarge: priceLarge ?? this.priceLarge,
      body: body ?? this.body,
      label: label ?? this.label,
      priceSmall: priceSmall ?? this.priceSmall,
      captionLight: captionLight ?? this.captionLight,
      eyebrow: eyebrow ?? this.eyebrow,
      sizeValue: sizeValue ?? this.sizeValue,
      microLight: microLight ?? this.microLight,
      microRegular: microRegular ?? this.microRegular,
      badge: badge ?? this.badge,
      microBold: microBold ?? this.microBold,
      subtitleLight: subtitleLight ?? this.subtitleLight,
      fieldText: fieldText ?? this.fieldText,
      fieldHint: fieldHint ?? this.fieldHint,
      fieldError: fieldError ?? this.fieldError,
      priceMedium: priceMedium ?? this.priceMedium,
      priceHero: priceHero ?? this.priceHero,
      bodyAuto: bodyAuto ?? this.bodyAuto,
      bodyLightAuto: bodyLightAuto ?? this.bodyLightAuto,
      captionAuto: captionAuto ?? this.captionAuto,
      labelAuto: labelAuto ?? this.labelAuto,
      bodyLightLoose: bodyLightLoose ?? this.bodyLightLoose,
      chipLight: chipLight ?? this.chipLight,
      sheetTitle: sheetTitle ?? this.sheetTitle,
    );
  }

  @override
  AppTextStyles lerp(AppTextStyles? other, double t) {
    if (other == null) return this;
    TextStyle mix(TextStyle a, TextStyle b) => TextStyle.lerp(a, b, t) ?? a;
    return AppTextStyles(
      displayTitle: mix(displayTitle, other.displayTitle),
      titleXl: mix(titleXl, other.titleXl),
      displayPoints: mix(displayPoints, other.displayPoints),
      pageTitle: mix(pageTitle, other.pageTitle),
      heroTitle: mix(heroTitle, other.heroTitle),
      sectionTitle: mix(sectionTitle, other.sectionTitle),
      sectionTitleOnBrand: mix(sectionTitleOnBrand, other.sectionTitleOnBrand),
      cardTitle: mix(cardTitle, other.cardTitle),
      headingLight: mix(headingLight, other.headingLight),
      buttonLarge: mix(buttonLarge, other.buttonLarge),
      bodyLight: mix(bodyLight, other.bodyLight),
      priceLarge: mix(priceLarge, other.priceLarge),
      body: mix(body, other.body),
      label: mix(label, other.label),
      priceSmall: mix(priceSmall, other.priceSmall),
      captionLight: mix(captionLight, other.captionLight),
      eyebrow: mix(eyebrow, other.eyebrow),
      sizeValue: mix(sizeValue, other.sizeValue),
      microLight: mix(microLight, other.microLight),
      microRegular: mix(microRegular, other.microRegular),
      badge: mix(badge, other.badge),
      microBold: mix(microBold, other.microBold),
      subtitleLight: mix(subtitleLight, other.subtitleLight),
      fieldText: mix(fieldText, other.fieldText),
      fieldHint: mix(fieldHint, other.fieldHint),
      fieldError: mix(fieldError, other.fieldError),
      priceMedium: mix(priceMedium, other.priceMedium),
      priceHero: mix(priceHero, other.priceHero),
      bodyAuto: mix(bodyAuto, other.bodyAuto),
      bodyLightAuto: mix(bodyLightAuto, other.bodyLightAuto),
      captionAuto: mix(captionAuto, other.captionAuto),
      labelAuto: mix(labelAuto, other.labelAuto),
      bodyLightLoose: mix(bodyLightLoose, other.bodyLightLoose),
      chipLight: mix(chipLight, other.chipLight),
      sheetTitle: mix(sheetTitle, other.sheetTitle),
    );
  }
}
