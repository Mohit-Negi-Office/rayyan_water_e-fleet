import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/error/app_exception.dart';
import 'package:rayyan_driver/features/auth/data/models/verify_otp_result_model.dart';

import '../../../../helpers/fixture.dart';

void main() {
  test('keeps the session and the full driver object', () {
    final body = fixture('verify_otp_success.json');
    final result = VerifyOtpResultModel.fromBody(body);

    expect(result.session.token, 'session-token');
    expect(result.session.refreshToken, 'refresh-token');
    expect(result.session.sessionId, 'sess_01drv');
    expect(result.session.refreshToken, isNot(result.session.sessionId));
    expect(result.driver['driverCode'], 'DRV1007');
    expect(result.driver['licenseNumber'], 'QL-00000000');
    expect(result.driver['emergencyContact'], {
      'contactName': 'Family',
      'contactNumber': '97400000000',
    });
  });

  test('rejects a body that is not the envelope', () {
    expect(
      () => VerifyOtpResultModel.fromBody({'ok': true}),
      throwsA(isA<ServerException>()),
    );
  });

  test('rejects a session that omits the refresh token', () {
    final body = fixture('verify_otp_success.json');
    final data = body['data'] as Map<String, dynamic>;
    data['session'] = {
      'sessionId': 'sess_01drv',
      'token': 'session-token',
      'publicKey': 'pk',
    };

    expect(
      () => VerifyOtpResultModel.fromBody(body),
      throwsA(isA<ServerException>()),
    );
  });

  test('rejects a driver with no code', () {
    final body = fixture('verify_otp_success.json');
    final data = body['data'] as Map<String, dynamic>;
    data['driver'] = {'name': 'Suresh Nair'};

    expect(
      () => VerifyOtpResultModel.fromBody(body),
      throwsA(isA<ServerException>()),
    );
  });
}
