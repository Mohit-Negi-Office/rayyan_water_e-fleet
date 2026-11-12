import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/app/router/app_routes.dart';
import 'package:rayyan_driver/app/router/not_found_page.dart';
import 'package:rayyan_driver/features/auth/domain/entities/phone_number.dart';
import 'package:rayyan_driver/features/auth/presentation/pages/login_page.dart';
import 'package:rayyan_driver/features/auth/presentation/pages/otp_page.dart';

/// Mobile login: number → OTP. The redirect opens Home once signed in.
final authRoutes = <RouteBase>[
  GoRoute(
    name: AppRoutes.login.name,
    path: AppRoutes.login.path,
    builder: (context, state) => const LoginPage(),
    routes: [
      GoRoute(
        name: AppRoutes.otp.name,
        path: AppRoutes.otp.path,
        builder: (context, state) {
          final query = state.uri.queryParameters;
          final phone = PhoneNumber.tryParse(query[AppRoutes.phoneParam]);
          if (phone == null) return const NotFoundPage();
          return OtpPage(phone: phone);
        },
      ),
    ],
  ),
];
