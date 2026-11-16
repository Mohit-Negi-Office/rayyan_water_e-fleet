import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/features/auth/data/models/auth_session_model.dart';

import '../../../../helpers/fixture.dart';

void main() {
  test('reads the verify session', () {
    final model = AuthSessionModel.fromJson(_session());
    expect(model.sessionId, 'sess_01drv');
    expect(model.token, 'session-token');
    expect(model.refreshToken, 'refresh-token');
    expect(model.publicKey, contains('BEGIN PUBLIC KEY'));
  });

  test('round-trips through JSON', () {
    final json = _session();
    expect(AuthSessionModel.fromJson(json).toJson(), json);
  });
}

Map<String, dynamic> _session() => Map<String, dynamic>.from(
  fixture('verify_otp_success.json')['data']['session'] as Map,
);
