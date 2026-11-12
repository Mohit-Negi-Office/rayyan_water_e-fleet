import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/app/router/app_routes.dart';
import 'package:rayyan_driver/app/router/not_found_page.dart';
import 'package:rayyan_driver/features/profile/presentation/pages/my_details_page.dart';
import 'package:rayyan_driver/features/profile/presentation/pages/profile_page.dart';
import 'package:rayyan_driver/features/support/domain/entities/policy_document.dart';
import 'package:rayyan_driver/features/support/presentation/pages/faqs_page.dart';
import 'package:rayyan_driver/features/support/presentation/pages/policy_page.dart';

/// Profile, My Details and the Support & More pages.
final accountRoutes = <RouteBase>[
  GoRoute(
    name: AppRoutes.profile.name,
    path: AppRoutes.profile.path,
    builder: (context, state) => const ProfilePage(),
  ),
  GoRoute(
    name: AppRoutes.myDetails.name,
    path: AppRoutes.myDetails.path,
    builder: (context, state) => const MyDetailsPage(),
  ),
  GoRoute(
    name: AppRoutes.faqs.name,
    path: AppRoutes.faqs.path,
    builder: (context, state) => const FaqsPage(),
  ),
  GoRoute(
    name: AppRoutes.policy.name,
    path: AppRoutes.policy.path,
    builder: (context, state) {
      final type = PolicyType.values
          .where((t) => t.name == state.pathParameters[AppRoutes.typeParam])
          .firstOrNull;
      return type == null ? const NotFoundPage() : PolicyPage(type: type);
    },
  ),
];
