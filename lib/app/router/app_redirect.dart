import 'package:rayyan_driver/app/router/app_routes.dart';

/// Pure redirect rules: (session, location) → new location or null.
abstract final class AppRedirect {
  /// Returns where to send the driver, or null to stay on [uri]. Every
  /// screen except the splash, login, and the public policy pages needs a
  /// session. Login opens Terms and Privacy before sign-in.
  static String? resolve({required bool isAuthenticated, required Uri uri}) {
    final path = uri.path;
    if (path == AppRoutes.splash.path) return null;
    final isOnLogin = _isUnder(path, AppRoutes.login.path);
    final isPublic = isOnLogin || _isPolicy(path);
    if (isAuthenticated) return isOnLogin ? AppRoutes.home.path : null;
    return isPublic ? null : AppRoutes.login.path;
  }

  /// `/support/policies/:type` only. FAQs and a bare policies path stay gated.
  static bool _isPolicy(String path) {
    final root = AppRoutes.policy.path.replaceFirst(
      '/:${AppRoutes.typeParam}',
      '',
    );
    if (!path.startsWith('$root/')) return false;
    final type = path.substring(root.length + 1);
    return type.isNotEmpty && !type.contains('/');
  }

  static bool _isUnder(String path, String prefix) =>
      path == prefix || path.startsWith('$prefix/');
}
