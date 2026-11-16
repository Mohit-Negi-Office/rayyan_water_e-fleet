import 'dart:convert';

/// `Authorization: Basic …` built from a username and password.
abstract final class BasicAuthorization {
  static const String header = 'Authorization';

  /// Header value for [username] and [password].
  static String value({required String username, required String password}) {
    final token = base64Encode(utf8.encode('$username:$password'));
    return 'Basic $token';
  }
}
