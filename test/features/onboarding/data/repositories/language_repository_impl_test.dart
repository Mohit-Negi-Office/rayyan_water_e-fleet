import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rayyan_driver/core/error/app_exception.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/onboarding/data/datasources/language_local_data_source.dart';
import 'package:rayyan_driver/features/onboarding/data/repositories/language_repository_impl.dart';
import 'package:rayyan_driver/features/onboarding/domain/entities/app_language.dart';

class _MockLocal extends Mock implements LanguageLocalDataSource {}

void main() {
  late _MockLocal local;
  late LanguageRepositoryImpl repository;

  setUp(() {
    local = _MockLocal();
    repository = LanguageRepositoryImpl(local);
  });

  group('getSavedLanguage', () {
    test('maps a stored code to the language', () async {
      when(() => local.readLanguageCode()).thenAnswer((_) async => 'ar');
      expect(
        await repository.getSavedLanguage(),
        const Success<AppLanguage?>(AppLanguage.arabic),
      );
    });

    test('returns null when nothing is stored', () async {
      when(() => local.readLanguageCode()).thenAnswer((_) async => null);
      expect(
        await repository.getSavedLanguage(),
        const Success<AppLanguage?>(null),
      );
    });

    test('maps CacheException to CacheFailure', () async {
      when(
        () => local.readLanguageCode(),
      ).thenThrow(const CacheException('disk'));
      expect(
        await repository.getSavedLanguage(),
        const Err<AppLanguage?>(CacheFailure()),
      );
    });
  });

  group('saveLanguage', () {
    test('writes the language code', () async {
      when(() => local.writeLanguageCode(any())).thenAnswer((_) async {});
      final result = await repository.saveLanguage(AppLanguage.arabic);
      expect(result, isA<Success<void>>());
      verify(() => local.writeLanguageCode('ar')).called(1);
    });

    test('maps CacheException to CacheFailure', () async {
      when(
        () => local.writeLanguageCode(any()),
      ).thenThrow(const CacheException('disk'));
      expect(
        await repository.saveLanguage(AppLanguage.english),
        const Err<void>(CacheFailure()),
      );
    });
  });
}
