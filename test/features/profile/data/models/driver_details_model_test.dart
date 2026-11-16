import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/features/profile/data/models/driver_details_model.dart';

import '../../../../helpers/fixture.dart';

void main() {
  test('maps the verify driver onto the profile', () {
    final profile = DriverDetailsModel.fromJson(_driver()).toEntity();

    expect(profile.name, 'Suresh Nair');
    expect(profile.code, 'DRV1007');
    expect(profile.email, 'driver.1007@example.com');
    expect(profile.dialCode, '+974');
    expect(profile.phoneDigits, '55001122');
    expect(profile.zone, '1');
    expect(profile.routeId, 'RT-007');
    expect(profile.vehicleNumber, '318238');
    expect(profile.photoUrl, isNull);
  });

  test('keeps a photo url and drops a blank photo', () {
    final url = DriverDetailsModel.fromJson({
      ..._driver(),
      'photo': ' https://cdn.example.com/driver.jpg ',
    }).toEntity();
    expect(url.photoUrl, 'https://cdn.example.com/driver.jpg');

    final blank = DriverDetailsModel.fromJson({
      ..._driver(),
      'photo': '',
    }).toEntity();
    expect(blank.photoUrl, isNull);
  });

  test('joins every zone number and keeps a dial code that already has +', () {
    final profile = const DriverDetailsModel(
      name: 'A',
      driverCode: 'D1',
      countryCode: '+974',
      workDetails: DriverWorkDetailsModel(
        zones: [
          DriverZoneModel(name: 'Doha North', number: 1),
          DriverZoneModel(name: 'Lusail', number: 2),
          DriverZoneModel(name: 'Unnumbered'),
        ],
      ),
    ).toEntity();

    expect(profile.dialCode, '+974');
    expect(profile.zone, '1, 2');
  });

  test('leaves vehicle fields empty when the server omits them', () {
    final profile = const DriverDetailsModel(
      name: 'A',
      driverCode: 'D1',
    ).toEntity();

    expect(profile.zone, isEmpty);
    expect(profile.routeId, isEmpty);
    expect(profile.vehicleNumber, isEmpty);
    expect(profile.dialCode, isEmpty);
  });

  test('round-trips through JSON', () {
    final model = DriverDetailsModel.fromJson(_driver());
    expect(
      DriverDetailsModel.fromJson(model.toJson()).toJson(),
      model.toJson(),
    );
  });
}

Map<String, dynamic> _driver() => Map<String, dynamic>.from(
  fixture('verify_otp_success.json')['data']['driver'] as Map,
);
