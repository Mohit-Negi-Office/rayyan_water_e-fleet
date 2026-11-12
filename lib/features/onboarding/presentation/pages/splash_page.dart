import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/app/di/injection.dart';
import 'package:rayyan_driver/app/router/app_routes.dart';
import 'package:rayyan_driver/app/session/auth_cubit.dart';
import 'package:rayyan_driver/core/assets/app_images.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/brand/brand_backdrop.dart';
import 'package:rayyan_driver/features/onboarding/presentation/bloc/splash_cubit.dart';
import 'package:rayyan_driver/features/onboarding/presentation/bloc/splash_state.dart';

/// Splash (Figma `5000:97739`): logo, app name and tagline on the navy
/// pattern, then Home or login.
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SplashCubit>()..start(),
      child: const SplashView(),
    );
  }
}

/// Splash content, separated from DI for testing.
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  /// Logo to app name (Figma gap 20).
  static const double _logoGap = 20;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    final l10n = context.l10n;
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        switch (state) {
          case SplashLoading():
            break;
          case SplashSignedIn():
            context.read<AuthCubit>().signedIn();
            context.goNamed(AppRoutes.home.name);
          case SplashSignedOut():
            context.goNamed(AppRoutes.login.name);
        }
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              const BrandBackdrop(pattern: AppImages.patternSplash),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppImages.logo,
                      width: AppImages.logoWidth,
                      height: AppImages.logoHeight,
                      fit: BoxFit.cover,
                      semanticLabel: l10n.appName,
                    ),
                    const SizedBox(height: _logoGap),
                    Text(
                      l10n.appName,
                      textAlign: TextAlign.center,
                      style: styles.heroTitle.copyWith(color: colors.onBrand),
                    ),
                    const SizedBox(height: AppSpacing.s2),
                    Text(
                      l10n.splashTagline,
                      textAlign: TextAlign.center,
                      style: styles.captionAuto.copyWith(
                        color: colors.inputBorder,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
