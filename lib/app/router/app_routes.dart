/// Route names and paths. Never use string literals at call sites.
abstract final class AppRoutes {
  static const splash = (name: 'splash', path: '/');
  static const login = (name: 'login', path: '/login');
  static const otp = (name: 'otp', path: 'otp'); // child of login

  /// Today's orders.
  static const home = (name: 'home', path: '/home');
  static const pastOrders = (name: 'pastOrders', path: '/orders/past');
  static const reassignedOrders = (
    name: 'reassignedOrders',
    path: '/orders/reassigned',
  );
  static const orderDetail = (name: 'orderDetail', path: '/orders/:orderId');

  /// "Fail Delivery": choose a reason for the order.
  static const failDelivery = (
    name: 'failDelivery',
    path: '/orders/:orderId/fail',
  );

  static const profile = (name: 'profile', path: '/profile');
  static const myDetails = (name: 'myDetails', path: '/profile/details');
  static const faqs = (name: 'faqs', path: '/support/faqs');
  static const policy = (name: 'policy', path: '/support/policies/:type');

  /// Login: the number in E.164 form ("+97455876543").
  static const String phoneParam = 'phone';
  static const String orderIdParam = 'orderId';
  static const String typeParam = 'type';
}
