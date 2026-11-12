import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/features/support/domain/entities/policy_document.dart';

part 'policy_state.freezed.dart';

@freezed
sealed class PolicyState with _$PolicyState {
  const factory PolicyState.loading() = PolicyLoading;
  const factory PolicyState.loaded(PolicyDocument document) = PolicyLoaded;
  const factory PolicyState.failure(Failure failure) = PolicyFailure;
}
