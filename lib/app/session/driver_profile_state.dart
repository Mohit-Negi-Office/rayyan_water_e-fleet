import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/features/profile/domain/entities/driver_profile.dart';

part 'driver_profile_state.freezed.dart';

@freezed
sealed class DriverProfileState with _$DriverProfileState {
  const factory DriverProfileState.loading() = DriverProfileLoading;
  const factory DriverProfileState.loaded(DriverProfile profile) =
      DriverProfileLoaded;
  const factory DriverProfileState.failure(Failure failure) =
      DriverProfileFailure;

  const DriverProfileState._();

  DriverProfile? get profile => switch (this) {
    DriverProfileLoaded(:final profile) => profile,
    _ => null,
  };
}
