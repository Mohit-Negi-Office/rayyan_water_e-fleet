import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/network/api_debug_log.dart';

void main() {
  const url = 'https://api-dev.rayyanwater.com/user-service/v1/otp/send';

  test('request log includes the url, headers and body', () {
    final text = ApiDebugLog.request(
      method: 'POST',
      url: url,
      headers: const {
        'device-id': 'device-123',
        'Authorization': 'Bearer static',
      },
      body: const {
        'countryCode': '974',
        'phoneNumber': '55876543',
        'type': 'LOGIN_DRIVER',
      },
    );

    expect(text, contains('API REQUEST'));
    expect(text, contains('POST $url'));
    expect(text, contains('"device-id": "device-123"'));
    expect(text, contains('"Authorization": "Bearer static"'));
    expect(text, contains('"countryCode": "974"'));
    expect(text, contains('"phoneNumber": "55876543"'));
    expect(text, contains('"type": "LOGIN_DRIVER"'));
  });

  test('response log pretty-prints a JSON string body', () {
    final text = ApiDebugLog.response(
      method: 'POST',
      url: url,
      statusCode: 200,
      headers: const {
        'content-type': ['application/json'],
      },
      body: '{"message":"OTP sent"}',
    );

    expect(text, contains('API RESPONSE'));
    expect(text, contains('POST $url'));
    expect(text, contains('Status: 200'));
    expect(text, contains('"message": "OTP sent"'));
  });
}
