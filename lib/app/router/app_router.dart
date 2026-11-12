import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/app/router/app_redirect.dart';
import 'package:rayyan_driver/app/router/app_routes.dart';
import 'package:rayyan_driver/app/router/not_found_page.dart';
import 'package:rayyan_driver/app/router/routes/account_routes.dart';
import 'package:rayyan_driver/app/router/routes/auth_routes.dart';
import 'package:rayyan_driver/app/router/routes/onboarding_routes.dart';
import 'package:rayyan_driver/app/router/routes/orders_routes.dart';
import 'package:rayyan_driver/app/router/stream_listenable.dart';
import 'package:rayyan_driver/app/session/auth_cubit.dart';
import 'package:rayyan_driver/app/session/auth_state.dart';

/// Builds the app router. Re-evaluates redirects on session changes.
GoRouter createAppRouter({
  required AuthCubit authCubit,
  String? initialLocation,
}) {
  return GoRouter(
    initialLocation: initialLocation ?? AppRoutes.splash.path,
    refreshListenable: StreamListenable(authCubit.stream),
    redirect: (context, state) => AppRedirect.resolve(
      isAuthenticated: authCubit.state is AuthAuthenticated,
      uri: state.uri,
    ),
    errorBuilder: (context, state) => const NotFoundPage(),
    routes: [
      ...onboardingRoutes,
      ...authRoutes,
      ...ordersRoutes,
      ...accountRoutes,
    ],
  );
}
