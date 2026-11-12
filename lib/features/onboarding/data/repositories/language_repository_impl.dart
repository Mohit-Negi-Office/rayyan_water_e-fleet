import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/onboarding/data/datasources/language_local_data_source.dart';
import 'package:rayyan_driver/features/onboarding/domain/entities/app_language.dart';
import 'package:rayyan_driver/features/onboarding/domain/repositories/language_repository.dart';

@LazySingleton(as: LanguageRepository)
final class LanguageRepositoryImpl implements LanguageRepository {
  const LanguageRepositoryImpl(this._local);

  final LanguageLocalDataSource _local;

  @override
  Future<Result<AppLanguage?>> getSavedLanguage() => guard(() async {
    final code = await _local.readLanguageCode();
    return AppLanguage.fromCode(code);
  });

  @override
  Future<Result<void>> saveLanguage(AppLanguage language) =>
      guard(() => _local.writeLanguageCode(language.code));
}
