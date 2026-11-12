import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/features/auth/data/models/auth_tokens_model.dart';

import '../../../../helpers/fixture.dart';

void main() {
  test('reads the verify response', () {
    final model = AuthTokensModel.fromJson(fixture('auth_tokens.json'));
    expect(model.accessToken, 'access-123');
    expect(model.refreshToken, 'refresh-456');
  });

  test('round-trips through JSON', () {
    final json = fixture('auth_tokens.json');
    expect(AuthTokensModel.fromJson(json).toJson(), json);
  });
}
