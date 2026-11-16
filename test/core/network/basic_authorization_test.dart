import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/network/basic_authorization.dart';

void main() {
  test('builds a Basic token from the username and password', () {
    expect(
      BasicAuthorization.value(username: 'user', password: 'secret'),
      'Basic ${base64Encode(utf8.encode('user:secret'))}',
    );
  });
}
