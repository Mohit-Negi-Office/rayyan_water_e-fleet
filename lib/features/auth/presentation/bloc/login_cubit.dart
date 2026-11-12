import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/auth/domain/usecases/request_otp.dart';
import 'package:rayyan_driver/features/auth/presentation/bloc/login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._requestOtp) : super(const LoginState());

  final RequestOtp _requestOtp;

  void digitsChanged(String digits) =>
      emit(state.copyWith(digits: digits, failure: null));

  /// Continue: sends the OTP.
  Future<void> submit() async {
    if (!state.canContinue) return;
    emit(state.copyWith(isSubmitting: true, failure: null));
    final result = await _requestOtp(state.phone);
    if (isClosed) return;
    emit(switch (result) {
      Success() => state.copyWith(
        isSubmitting: false,
        otpSentCount: state.otpSentCount + 1,
      ),
      Err(:final failure) => state.copyWith(
        isSubmitting: false,
        failure: failure,
      ),
    });
  }
}
