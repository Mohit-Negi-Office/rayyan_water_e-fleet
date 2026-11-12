import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/utils/formatters/countdown_formatter.dart';
import 'package:rayyan_driver/core/widgets/buttons/app_text_link.dart';

/// "Didn't receive the OTP?" followed by the countdown ("00:59") and then
/// "Resend".
class OtpResendRow extends StatelessWidget {
  const OtpResendRow({
    required this.secondsLeft,
    required this.onResend,
    super.key,
  });

  final int secondsLeft;

  /// Null while a resend is running.
  final VoidCallback? onResend;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final styles = context.textStyles;
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: AppSpacing.s2,
      children: [
        Text(
          l10n.authOtpNotReceived,
          style: styles.subtitleLight.copyWith(color: colors.textSubtle),
        ),
        if (secondsLeft > 0)
          Text(
            CountdownFormatter.format(secondsLeft),
            textDirection: TextDirection.ltr,
            style: styles.buttonLarge.copyWith(color: colors.brand),
          )
        else
          AppTextLink(label: l10n.authOtpResend, onPressed: onResend),
      ],
    );
  }
}
