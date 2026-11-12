/// API paths, relative to [AppConfig.apiBaseUrl].
// TODO(backend): confirm the driver API paths.
abstract final class ApiEndpoints {
  static const String authOtp = '/driver/auth/otp';
  static const String authOtpVerify = '/driver/auth/otp/verify';
  static const String profile = '/driver/me';
  static String policy(String type) => '/policies/$type';
  static const String faqs = '/driver/faqs';

  /// Orders of a list: `scope` is `today`, `past` or `reassigned`.
  static const String orders = '/driver/orders';
  static String order(String id) => '/driver/orders/$id';
  static String orderReassign(String id) => '/driver/orders/$id/reassign';
  static String orderFail(String id) => '/driver/orders/$id/fail';
  static String orderComplete(String id) => '/driver/orders/$id/complete';
}
