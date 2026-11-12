import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/app/locale/locale_state.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/core/utils/app_logger.dart';
import 'package:rayyan_driver/features/onboarding/domain/entities/app_language.dart';
import 'package:rayyan_driver/features/onboarding/domain/usecases/get_saved_language.dart';
import 'package:rayyan_driver/features/onboarding/domain/usecases/save_language.dart';

/// App-wide language. Read by `MaterialApp.router(locale: …)`.
@lazySingleton
class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit(this._getSavedLanguage, this._saveLanguage)
    : super(const LocaleState.unset());

  final GetSavedLanguage _getSavedLanguage;
  final SaveLanguage _saveLanguage;

  /// Restores the saved language, if any.
  Future<void> load() async {
    final result = await _getSavedLanguage(const NoParams());
    if (isClosed) return;
    switch (result) {
      case Success(value: final AppLanguage language):
        emit(LocaleState.selected(language));
      case Success():
        emit(const LocaleState.unset());
      case Err(:final failure):
        AppLogger.error('Could not read saved language', failure);
        emit(const LocaleState.unset());
    }
  }

  /// Switches to [language] immediately and persists it.
  /// If saving fails the choice still applies for this session.
  Future<void> change(AppLanguage language) async {
    emit(LocaleState.selected(language));
    final result = await _saveLanguage(language);
    if (result case Err(:final failure)) {
      AppLogger.error('Could not save language', failure);
    }
  }
}
