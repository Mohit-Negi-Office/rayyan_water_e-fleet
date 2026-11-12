import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/features/support/domain/usecases/support_usecases.dart';
import 'package:rayyan_driver/features/support/presentation/bloc/faqs_state.dart';

/// FAQs, one question open at a time.
@injectable
class FaqsCubit extends Cubit<FaqsState> {
  FaqsCubit(this._getFaqs) : super(const FaqsState.loading());

  final GetFaqs _getFaqs;

  Future<void> load() async {
    emit(const FaqsState.loading());
    final result = await _getFaqs(const NoParams());
    if (isClosed) return;
    emit(switch (result) {
      Success(:final value) => FaqsState.loaded(
        value,
        expanded: value.isEmpty ? null : 0,
      ),
      Err(:final failure) => FaqsState.failure(failure),
    });
  }

  /// Opens [index], or closes it when it is already open.
  void toggle(int index) {
    final current = state;
    if (current is! FaqsLoaded) return;
    emit(current.copyWith(expanded: current.expanded == index ? null : index));
  }
}
