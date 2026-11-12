import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/features/onboarding/domain/entities/app_language.dart';
import 'package:rayyan_driver/features/onboarding/domain/repositories/language_repository.dart';

/// Reads the saved language; null means the user hasn't chosen yet.
@injectable
class GetSavedLanguage implements UseCase<AppLanguage?, NoParams> {
  const GetSavedLanguage(this._repository);

  final LanguageRepository _repository;

  @override
  Future<Result<AppLanguage?>> call(NoParams params) =>
      _repository.getSavedLanguage();
}
