import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_color_scheme.dart';
import 'package:rayyan_driver/core/theme/app_text_styles.dart';
import 'package:rayyan_driver/core/theme/app_typography.dart';

/// Shorthand access to theme tokens.
extension ThemeContextX on BuildContext {
  /// Semantic colors.
  AppColorScheme get colors =>
      Theme.of(this).extension<AppColorScheme>() ?? AppColorScheme.light;

  /// Named text styles.
  AppTextStyles get textStyles =>
      Theme.of(this).extension<AppTextStyles>() ?? AppTypography.styles;

  /// Material text theme.
  TextTheme get text => Theme.of(this).textTheme;
}
