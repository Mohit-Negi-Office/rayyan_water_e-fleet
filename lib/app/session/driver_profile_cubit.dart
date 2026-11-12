import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/app/session/driver_profile_state.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/features/profile/domain/usecases/get_profile.dart';

/// The signed-in driver, app-wide: the Home avatar, Profile and My
/// Details read it. Loaded on sign-in, cleared on logout.
@lazySingleton
class DriverProfileCubit extends Cubit<DriverProfileState> {
  DriverProfileCubit(this._getProfile)
    : super(const DriverProfileState.loading());

  final GetProfile _getProfile;

  Future<void> load() async {
    emit(const DriverProfileState.loading());
    final result = await _getProfile(const NoParams());
    if (isClosed) return;
    emit(switch (result) {
      Success(:final value) => DriverProfileState.loaded(value),
      Err(:final failure) => DriverProfileState.failure(failure),
    });
  }

  void clear() => emit(const DriverProfileState.loading());
}
