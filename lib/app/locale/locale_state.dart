import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rayyan_driver/features/onboarding/domain/entities/app_language.dart';

part 'locale_state.freezed.dart';

@freezed
sealed class LocaleState with _$LocaleState {
  /// No language chosen yet; the device locale is used.
  const factory LocaleState.unset() = LocaleUnset;

  /// The user picked [language].
  const factory LocaleState.selected(AppLanguage language) = LocaleSelected;
}
