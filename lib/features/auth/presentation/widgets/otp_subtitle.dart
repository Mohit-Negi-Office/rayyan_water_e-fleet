import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/core/utils/formatters/phone_formatter.dart';
import 'package:rayyan_driver/core/widgets/inputs/otp_sent_to.dart';
import 'package:rayyan_driver/features/auth/domain/entities/otp_policy.dart';
import 'package:rayyan_driver/features/auth/domain/entities/phone_number.dart';

/// "Please enter the 4 digit OTP sent to / +974 55876543 EDIT". EDIT goes
/// back to the number, which is still filled in.
class OtpSubtitle extends StatelessWidget {
  const OtpSubtitle({required this.phone, super.key});

  final PhoneNumber phone;

  @override
  Widget build(BuildContext context) => OtpSentTo(
    length: OtpPolicy.codeLength,
    target: PhoneFormatter.international(
      dialCode: phone.dialCode,
      digits: phone.digits,
    ),
    onEdit: context.pop,
  );
}
