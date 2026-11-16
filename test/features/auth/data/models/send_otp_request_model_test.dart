import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/features/auth/data/models/send_otp_request_model.dart';

void main() {
  const json = {
    'countryCode': '974',
    'phoneNumber': '55876543',
    'type': 'LOGIN_DRIVER',
  };

  test('login driver body uses the typed number', () {
    expect(SendOtpRequestModel.loginDriver('55876543').toJson(), json);
  });

  test('round-trips through JSON', () {
    expect(SendOtpRequestModel.fromJson(json).toJson(), json);
  });
}
