import 'package:rayyan_driver/core/error/app_exception.dart';
import 'package:rayyan_driver/core/network/models/api_response_model.dart';

/// Driver object from `GET /user-service/v1/profile/driver`.
///
/// The driver sits in `data`, with the same fields OTP verify stores.
final class DriverProfileResponse {
  const DriverProfileResponse(this.driver);

  final Map<String, dynamic> driver;

  factory DriverProfileResponse.fromBody(Map<String, dynamic> json) {
    final envelope = ApiResponseModel.tryFrom(json);
    final data = envelope?.data;
    if (envelope == null || envelope.hasError || data == null) {
      throw const ServerException('Profile response has no driver');
    }
    final name = data['name'];
    final code = data['driverCode'];
    if (name is! String || name.isEmpty || code is! String || code.isEmpty) {
      throw const ServerException('Profile response has no driver');
    }
    return DriverProfileResponse(Map<String, dynamic>.from(data));
  }
}
