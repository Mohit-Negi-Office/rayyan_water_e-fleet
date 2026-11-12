import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/support/domain/entities/policy_document.dart';
import 'package:rayyan_driver/features/support/domain/usecases/support_usecases.dart';
import 'package:rayyan_driver/features/support/presentation/bloc/policy_state.dart';

/// One of the static pages (About Us, Terms & Conditions, Privacy policy).
@injectable
class PolicyCubit extends Cubit<PolicyState> {
  PolicyCubit(this._getPolicy, @factoryParam this._type)
    : super(const PolicyState.loading());

  final GetPolicy _getPolicy;
  final PolicyType _type;

  Future<void> load() async {
    emit(const PolicyState.loading());
    final result = await _getPolicy(_type);
    if (isClosed) return;
    emit(switch (result) {
      Success(:final value) => PolicyState.loaded(value),
      Err(:final failure) => PolicyState.failure(failure),
    });
  }
}
