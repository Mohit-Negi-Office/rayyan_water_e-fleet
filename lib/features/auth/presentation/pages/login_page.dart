import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/app/di/injection.dart';
import 'package:rayyan_driver/app/router/app_routes.dart';
import 'package:rayyan_driver/core/assets/app_images.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/widgets/layout/wave_header_scaffold.dart';
import 'package:rayyan_driver/features/auth/presentation/bloc/login_cubit.dart';
import 'package:rayyan_driver/features/auth/presentation/bloc/login_state.dart';
import 'package:rayyan_driver/features/auth/presentation/widgets/login_form.dart';
import 'package:rayyan_driver/features/auth/presentation/widgets/login_legal_links.dart';

/// "Enter Mobile Number" (Figma `5000:98300`): the logo in place of a back
/// button, and Terms & Privacy at the foot.
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: const LoginView(),
    );
  }
}

/// Login content, separated from DI for testing.
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  /// Logo on the header (Figma `5000:98369`).
  static const double _logoWidth = 62;
  static const double _logoHeight = 44;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (before, now) => before.otpSentCount != now.otpSentCount,
      listener: (context, state) => context.pushNamed(
        AppRoutes.otp.name,
        queryParameters: {AppRoutes.phoneParam: state.phone.e164},
      ),
      child: WaveHeaderScaffold(
        title: l10n.authLoginTitle,
        subtitle: Text(l10n.authLoginSubtitle),
        leading: Image.asset(
          AppImages.logo,
          width: _logoWidth,
          height: _logoHeight,
          fit: BoxFit.cover,
          semanticLabel: l10n.appName,
        ),
        leadingTop: WaveHeaderScaffold.logoTop,
        footer: const LoginLegalLinks(),
        body: const LoginForm(),
      ),
    );
  }
}
