import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rayyan_driver/core/error/failure_ui_x.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/widgets/inputs/otp_entry_form.dart';
import 'package:rayyan_driver/features/auth/domain/entities/otp_policy.dart';
import 'package:rayyan_driver/features/auth/presentation/bloc/otp_cubit.dart';
import 'package:rayyan_driver/features/auth/presentation/bloc/otp_state.dart';

/// OTP boxes, "Incorrect OTP", the resend row and Verify.
class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<OtpCubit>();
    return BlocBuilder<OtpCubit, OtpState>(
      builder: (context, state) {
        final error = state.isIncorrect
            ? l10n.authOtpIncorrect
            : state.failure?.toMessage(l10n);
        return OtpEntryForm(
          length: OtpPolicy.codeLength,
          code: state.code,
          secondsLeft: state.secondsLeft,
          errorText: error,
          isVerifying: state.isVerifying,
          onCodeChanged: cubit.codeChanged,
          onVerify: state.canVerify ? cubit.verify : null,
          onResend: state.canResend ? cubit.resend : null,
        );
      },
    );
  }
}
