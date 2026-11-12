import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rayyan_driver/app/locale/locale_cubit.dart';
import 'package:rayyan_driver/app/locale/locale_state.dart';
import 'package:rayyan_driver/app/locale/locale_state_x.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/features/onboarding/domain/entities/app_language.dart';
import 'package:rayyan_driver/features/onboarding/domain/usecases/get_saved_language.dart';
import 'package:rayyan_driver/features/onboarding/domain/usecases/save_language.dart';

class _MockGet extends Mock implements GetSavedLanguage {}

class _MockSave extends Mock implements SaveLanguage {}

void main() {
  late _MockGet getSaved;
  late _MockSave save;

  setUpAll(() {
    registerFallbackValue(const NoParams());
    registerFallbackValue(AppLanguage.english);
  });

  setUp(() {
    getSaved = _MockGet();
    save = _MockSave();
  });

  LocaleCubit build() => LocaleCubit(getSaved, save);

  test('starts unset with no locale', () {
    final cubit = build();
    expect(cubit.state, const LocaleState.unset());
    expect(cubit.state.locale, isNull);
  });

  blocTest<LocaleCubit, LocaleState>(
    'load restores the saved language',
    setUp: () => when(
      () => getSaved(any()),
    ).thenAnswer((_) async => const Success(AppLanguage.arabic)),
    build: build,
    act: (cubit) => cubit.load(),
    expect: () => const [LocaleState.selected(AppLanguage.arabic)],
    verify: (cubit) => expect(cubit.state.locale, const Locale('ar')),
  );

  blocTest<LocaleCubit, LocaleState>(
    'load stays unset when nothing is saved or storage fails',
    setUp: () => when(
      () => getSaved(any()),
    ).thenAnswer((_) async => const Err(CacheFailure())),
    build: build,
    act: (cubit) => cubit.load(),
    expect: () => const [LocaleState.unset()],
  );

  blocTest<LocaleCubit, LocaleState>(
    'change applies and persists the language',
    setUp: () => when(
      () => save(any()),
    ).thenAnswer((_) async => const Success<void>(null)),
    build: build,
    act: (cubit) => cubit.change(AppLanguage.arabic),
    expect: () => const [LocaleState.selected(AppLanguage.arabic)],
    verify: (_) => verify(() => save(AppLanguage.arabic)).called(1),
  );

  blocTest<LocaleCubit, LocaleState>(
    'change still applies for the session when saving fails',
    setUp: () => when(
      () => save(any()),
    ).thenAnswer((_) async => const Err<void>(CacheFailure())),
    build: build,
    act: (cubit) => cubit.change(AppLanguage.english),
    expect: () => const [LocaleState.selected(AppLanguage.english)],
  );
}
