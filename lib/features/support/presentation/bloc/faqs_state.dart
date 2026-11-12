import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/features/support/domain/entities/faq.dart';

part 'faqs_state.freezed.dart';

@freezed
sealed class FaqsState with _$FaqsState {
  const factory FaqsState.loading() = FaqsLoading;

  /// [expanded] is the open question, if any (the first one to start).
  const factory FaqsState.loaded(List<Faq> faqs, {int? expanded}) = FaqsLoaded;
  const factory FaqsState.failure(Failure failure) = FaqsFailure;
}
