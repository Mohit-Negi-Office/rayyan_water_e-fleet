import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/app/router/app_routes.dart';
import 'package:rayyan_driver/features/onboarding/presentation/pages/splash_page.dart';

final onboardingRoutes = <RouteBase>[
  GoRoute(
    name: AppRoutes.splash.name,
    path: AppRoutes.splash.path,
    builder: (context, state) => const SplashPage(),
  ),
];
