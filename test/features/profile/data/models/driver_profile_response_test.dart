import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/error/app_exception.dart';
import 'package:rayyan_driver/features/profile/data/models/driver_details_model.dart';
import 'package:rayyan_driver/features/profile/data/models/driver_profile_response.dart';

import '../../../../helpers/fixture.dart';

void main() {
  test('reads the driver object from data', () {
    final driver = DriverProfileResponse.fromBody(
      fixture('driver_profile_success.json'),
    ).driver;
    final profile = DriverDetailsModel.fromJson(driver).toEntity();

    expect(driver['driverId'], '6af5e2860ab2b6bc2df57dfc');
    expect(driver['licenseNumber'], 'QL-28400322');
    expect(profile.name, 'Suresh Nair');
    expect(profile.code, 'DRV1007');
    expect(profile.email, 'suresh.drv1007@rayyanwater.qa');
    expect(profile.dialCode, '+974');
    expect(profile.phoneDigits, '66210222');
    expect(profile.zone, '1');
    expect(profile.routeId, 'RT-007');
    expect(profile.vehicleNumber, '318238');
    expect(profile.photoUrl, isNull);
  });

  test('rejects a body with no driver', () {
    expect(
      () => DriverProfileResponse.fromBody({
        'code': 200,
        'status': 'OK',
        'timestamp': 1,
        'data': <String, dynamic>{},
        'error': null,
      }),
      throwsA(isA<ServerException>()),
    );
  });
}
