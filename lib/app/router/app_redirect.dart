import 'package:rayyan_driver/app/router/app_routes.dart';

/// Pure redirect rules: (session, location) → new location or null.
abstract final class AppRedirect {
  /// Returns where to send the driver, or null to stay on [uri]. Every
  /// screen except the splash and login needs a session.
  static String? resolve({required bool isAuthenticated, required Uri uri}) {
    final path = uri.path;
    if (path == AppRoutes.splash.path) return null;
    final isOnLogin = _isUnder(path, AppRoutes.login.path);
    if (isAuthenticated) return isOnLogin ? AppRoutes.home.path : null;
    return isOnLogin ? null : AppRoutes.login.path;
  }

  static bool _isUnder(String path, String prefix) =>
      path == prefix || path.startsWith('$prefix/');
}
