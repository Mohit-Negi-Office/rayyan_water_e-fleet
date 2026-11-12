import 'package:flutter/widgets.dart';
import 'package:rayyan_driver/core/l10n/generated/app_localizations.dart';

/// Shorthand for the generated localizations.
extension L10nX on BuildContext {
  /// Localized strings for the current locale.
  AppLocalizations get l10n => AppLocalizations.of(this);
}
