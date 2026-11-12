import 'package:equatable/equatable.dart';

/// A mobile number: country dial code plus the local digits.
final class PhoneNumber extends Equatable {
  const PhoneNumber({required this.dialCode, required this.digits});

  /// A Qatar (+974) number. Login only accepts local numbers.
  const PhoneNumber.qatar(this.digits) : dialCode = qatarDialCode;

  static const String qatarDialCode = '+974';
  static final RegExp _qatarE164 = RegExp(r'^\+974(\d+)$');

  final String dialCode;
  final String digits;

  /// "+97455876543", used in route parameters and API calls.
  String get e164 => '$dialCode$digits';

  /// Reads a Qatar number from [e164]; null for anything else.
  static PhoneNumber? tryParse(String? e164) {
    final match = _qatarE164.firstMatch(e164 ?? '');
    final digits = match?.group(1);
    return digits == null ? null : PhoneNumber.qatar(digits);
  }

  @override
  List<Object?> get props => [dialCode, digits];
}
