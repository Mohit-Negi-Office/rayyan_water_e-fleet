import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/widgets/buttons/app_button.dart';
import 'package:rayyan_driver/core/widgets/inputs/field_frame.dart';
import 'package:rayyan_driver/core/widgets/inputs/otp_input.dart';
import 'package:rayyan_driver/core/widgets/inputs/otp_resend_row.dart';

/// OTP boxes, an optional error, the resend row and Verify: every "Verify
/// Mobile Number" / "Verify Your Email" screen.
class OtpEntryForm extends StatelessWidget {
  const OtpEntryForm({
    required this.length,
    required this.code,
    required this.secondsLeft,
    required this.onCodeChanged,
    required this.onVerify,
    required this.onResend,
    this.errorText,
    this.isVerifying = false,
    super.key,
  });

  final int length;
  final String code;
  final int secondsLeft;
  final ValueChanged<String> onCodeChanged;

  /// Null while Verify is not possible.
  final VoidCallback? onVerify;

  /// Null while Resend is not possible.
  final VoidCallback? onResend;
  final String? errorText;
  final bool isVerifying;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final error = errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OtpInput(
          length: length,
          value: code,
          onChanged: onCodeChanged,
          onSubmitted: onVerify,
          semanticLabel: l10n.authOtpFieldLabel(length),
          // The design opens without the keyboard; tapping a box opens it.
          autofocus: false,
        ),
        if (error != null) ...[
          const SizedBox(height: AppSpacing.s2),
          FieldErrorText(error),
          const SizedBox(height: AppSpacing.s4),
        ] else
          const SizedBox(height: AppSpacing.s6),
        OtpResendRow(secondsLeft: secondsLeft, onResend: onResend),
        const SizedBox(height: AppSpacing.s7),
        AppButton(
          label: l10n.authOtpVerify,
          onPressed: onVerify,
          size: AppButtonSize.large,
          isExpanded: true,
          isLoading: isVerifying,
        ),
      ],
    );
  }
}
