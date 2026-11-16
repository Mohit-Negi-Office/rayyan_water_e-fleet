/// `Authorization: Bearer …` from the access token saved at OTP verify.
abstract final class BearerAuthorization {
  /// Header value for [token].
  static String value(String token) => 'Bearer $token';
}
