/// API paths, relative to [AppConfig.apiBaseUrl].
// TODO(backend): confirm the driver API paths.
abstract final class ApiEndpoints {
  /// Header for the running platform: `IOS`, `ANDROID`, or `WEB`.
  static const String deviceTypeHeader = 'device-type';

  /// Static `aes-key` for OTP verify until key exchange exists.
  static const String aesKeyHeader = 'aes-key';
  static const String aesKey = 'adf';

  /// Static `device-token` for OTP verify until push registration exists.
  static const String deviceTokenHeader = 'device-token';
  static const String deviceToken = 'adfasdf';

  /// Login OTP: `POST /user-service/v1/otp/send`.
  static const String authOtp = '/user-service/v1/otp/send';

  /// Login OTP verify: `POST /user-service/v1/otp/verify`.
  static const String authOtpVerify = '/user-service/v1/otp/verify';

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
