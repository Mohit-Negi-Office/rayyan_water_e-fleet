import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rayyan_driver/app/di/injection.dart';
import 'package:rayyan_driver/app/session/auth_cubit.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/widgets/layout/wave_header_scaffold.dart';
import 'package:rayyan_driver/features/auth/domain/entities/phone_number.dart';
import 'package:rayyan_driver/features/auth/presentation/bloc/otp_cubit.dart';
import 'package:rayyan_driver/features/auth/presentation/bloc/otp_state.dart';
import 'package:rayyan_driver/features/auth/presentation/widgets/otp_form.dart';
import 'package:rayyan_driver/features/auth/presentation/widgets/otp_subtitle.dart';

/// "Verify Mobile Number" for [phone] (Figma `5000:98397`). A correct
/// code signs the driver in and the router opens Home.
class OtpPage extends StatelessWidget {
  const OtpPage({required this.phone, super.key});

  final PhoneNumber phone;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OtpCubit>(param1: phone)..start(),
      child: OtpView(phone: phone),
    );
  }
}

/// OTP content, separated from DI for testing.
class OtpView extends StatelessWidget {
  const OtpView({required this.phone, super.key});

  final PhoneNumber phone;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocListener<OtpCubit, OtpState>(
      listenWhen: (before, now) => !before.isVerified && now.isVerified,
      listener: (context, _) => context.read<AuthCubit>().signedIn(),
      child: WaveHeaderScaffold(
        title: l10n.authOtpTitle,
        subtitle: OtpSubtitle(phone: phone),
        body: const OtpForm(),
      ),
    );
  }
}
