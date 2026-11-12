import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/utils/ticker.dart';
import 'package:rayyan_driver/features/auth/domain/entities/otp_policy.dart';
import 'package:rayyan_driver/features/auth/domain/entities/phone_number.dart';
import 'package:rayyan_driver/features/auth/domain/usecases/request_otp.dart';
import 'package:rayyan_driver/features/auth/domain/usecases/verify_otp.dart';
import 'package:rayyan_driver/features/auth/presentation/bloc/otp_state.dart';

/// OTP entry, verification and the resend countdown for [phone].
@injectable
class OtpCubit extends Cubit<OtpState> {
  OtpCubit(
    this._verifyOtp,
    this._requestOtp,
    this._ticker,
    @factoryParam PhoneNumber phone,
  ) : super(OtpState(phone: phone));

  final VerifyOtp _verifyOtp;
  final RequestOtp _requestOtp;
  final Ticker _ticker;
  StreamSubscription<int>? _countdown;

  /// Starts the wait before "Resend" (the code was just sent).
  void start() => _restartCountdown(state);

  void codeChanged(String code) =>
      emit(state.copyWith(code: code, failure: null));

  Future<void> verify() async {
    if (!state.canVerify) return;
    emit(state.copyWith(isVerifying: true));
    final result = await _verifyOtp(
      VerifyOtpParams(phone: state.phone, code: state.code),
    );
    if (isClosed) return;
    emit(switch (result) {
      Success() => state.copyWith(isVerifying: false, isVerified: true),
      Err(:final failure) => state.copyWith(
        isVerifying: false,
        failure: failure,
      ),
    });
  }

  Future<void> resend() async {
    if (!state.canResend) return;
    emit(state.copyWith(isResending: true));
    final result = await _requestOtp(state.phone);
    if (isClosed) return;
    switch (result) {
      case Success():
        _restartCountdown(
          state.copyWith(isResending: false, code: '', failure: null),
        );
      case Err(:final failure):
        emit(state.copyWith(isResending: false, failure: failure));
    }
  }

  void _restartCountdown(OtpState from) {
    unawaited(_countdown?.cancel());
    emit(from.copyWith(secondsLeft: OtpPolicy.resendWaitSeconds));
    _countdown = _ticker
        .countdown(OtpPolicy.resendWaitSeconds)
        .listen((left) => emit(state.copyWith(secondsLeft: left)));
  }

  @override
  Future<void> close() async {
    await _countdown?.cancel();
    return super.close();
  }
}
