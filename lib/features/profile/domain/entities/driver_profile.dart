import 'package:equatable/equatable.dart';

/// The signed-in driver, as shown on Profile and My Details.
final class DriverProfile extends Equatable {
  const DriverProfile({
    required this.name,
    required this.code,
    required this.email,
    required this.dialCode,
    required this.phoneDigits,
    required this.zone,
    required this.routeId,
    required this.vehicleNumber,
    this.photoUrl,
  });

  final String name;

  /// Driver ID under the name ("AD16426").
  final String code;
  final String email;

  /// "+971".
  final String dialCode;
  final String phoneDigits;
  final String zone;
  final String routeId;
  final String vehicleNumber;
  final String? photoUrl;

  @override
  List<Object?> get props => [
    name,
    code,
    email,
    dialCode,
    phoneDigits,
    zone,
    routeId,
    vehicleNumber,
    photoUrl,
  ];
}
