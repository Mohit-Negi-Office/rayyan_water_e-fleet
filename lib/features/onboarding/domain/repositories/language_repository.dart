import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/onboarding/domain/entities/app_language.dart';

/// Persists the user's language choice.
abstract interface class LanguageRepository {
  /// The saved language, or null on first launch.
  Future<Result<AppLanguage?>> getSavedLanguage();

  /// Saves [language] as the user's choice.
  Future<Result<void>> saveLanguage(AppLanguage language);
}
