import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/features/onboarding/domain/entities/app_language.dart';
import 'package:rayyan_driver/features/onboarding/domain/repositories/language_repository.dart';

/// Saves the user's language choice.
@injectable
class SaveLanguage implements UseCase<void, AppLanguage> {
  const SaveLanguage(this._repository);

  final LanguageRepository _repository;

  @override
  Future<Result<void>> call(AppLanguage params) =>
      _repository.saveLanguage(params);
}
