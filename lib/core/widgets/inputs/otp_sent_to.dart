import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/buttons/app_text_link.dart';

/// Header subtitle of an OTP screen: "Please enter the 4 digit OTP sent to"
/// then the [target] (phone or email, kept left-to-right) and EDIT.
class OtpSentTo extends StatelessWidget {
  const OtpSentTo({
    required this.length,
    required this.target,
    required this.onEdit,
    super.key,
  });

  final int length;
  final String target;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.authOtpSubtitle(length)),
        Row(
          children: [
            Flexible(
              child: Text(
                target,
                textDirection: TextDirection.ltr,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: AppSpacing.s2),
            AppTextLink(
              label: l10n.authOtpEdit,
              color: context.colors.onBrand,
              onPressed: onEdit,
            ),
          ],
        ),
      ],
    );
  }
}
