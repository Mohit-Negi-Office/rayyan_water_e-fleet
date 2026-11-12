import 'package:flutter/widgets.dart';
import 'package:rayyan_driver/app/locale/locale_state.dart';
import 'package:rayyan_driver/features/onboarding/domain/entities/app_language.dart';

/// UI helpers for [LocaleState].
extension LocaleStateX on LocaleState {
  /// The chosen language, or null when unset.
  AppLanguage? get languageOrNull => switch (this) {
    LocaleSelected(:final language) => language,
    LocaleUnset() => null,
  };

  /// Locale for `MaterialApp`; null falls back to the device locale.
  Locale? get locale => switch (languageOrNull) {
    final AppLanguage language => Locale(language.code),
    null => null,
  };
}
