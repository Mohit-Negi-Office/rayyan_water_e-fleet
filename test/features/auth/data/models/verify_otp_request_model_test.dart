import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/features/auth/data/models/verify_otp_request_model.dart';

void main() {
  const json = {
    'countryCode': '974',
    'phoneNumber': '55876543',
    'otp': '2406',
    'type': 'LOGIN_DRIVER',
  };

  test('login driver body uses the typed number and code', () {
    expect(
      VerifyOtpRequestModel.loginDriver(
        phoneNumber: '55876543',
        otp: '2406',
      ).toJson(),
      json,
    );
  });

  test('round-trips through JSON', () {
    expect(VerifyOtpRequestModel.fromJson(json).toJson(), json);
  });
}
