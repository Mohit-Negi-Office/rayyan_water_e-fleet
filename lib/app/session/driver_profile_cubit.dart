import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/app/session/driver_profile_state.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/features/profile/domain/usecases/get_profile.dart';
import 'package:rayyan_driver/features/profile/domain/usecases/request_profile.dart';

/// The signed-in driver, app-wide: the Home avatar, Profile and My
/// Details read it. Loaded on sign-in, cleared on logout.
@lazySingleton
class DriverProfileCubit extends Cubit<DriverProfileState> {
  DriverProfileCubit(this._getProfile, this._requestProfile)
    : super(const DriverProfileState.loading());

  final GetProfile _getProfile;
  final RequestProfile _requestProfile;

  Future<void> load() async {
    emit(const DriverProfileState.loading());
    final result = await _getProfile(const NoParams());
    if (isClosed) return;
    emit(switch (result) {
      Success(:final value) => DriverProfileState.loaded(value),
      Err(:final failure) => DriverProfileState.failure(failure),
    });
  }

  /// Loads the profile endpoint and shows the driver it stored.
  /// A failed call leaves the driver already on screen.
  Future<void> refresh() async {
    final result = await _requestProfile(const NoParams());
    if (isClosed) return;
    if (result case Success(:final value)) {
      emit(DriverProfileState.loaded(value));
    }
  }

  void clear() => emit(const DriverProfileState.loading());
}
