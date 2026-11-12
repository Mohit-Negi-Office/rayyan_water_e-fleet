import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/assets/app_svgs.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/inputs/outlined_field_box.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';

/// Flag, dial code and the local number ("+974 | Mobile Number"). Always
/// left-to-right. [isVerified] shows the teal check of a confirmed number;
/// read-only fields pass [initialValue].
class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({
    required this.dialCode,
    this.hint,
    this.initialValue,
    this.onChanged,
    this.onSubmitted,
    this.maxDigits,
    this.readOnly = false,
    this.isVerified = false,
    this.autofocus = false,
    this.verifiedLabel,
    this.action,
    super.key,
  });

  final String dialCode;
  final String? hint;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final int? maxDigits;
  final bool readOnly;
  final bool isVerified;
  final bool autofocus;

  /// Screen-reader label of the check.
  final String? verifiedLabel;

  /// Shown at the end instead of the check (the pencil on My Profile).
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    final maxDigits = this.maxDigits;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: OutlinedFieldBox(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s3),
        child: Row(
          children: [
            SvgPicture.asset(
              AppSvgs.flagQatar,
              width: AppIconSizes.brandMark,
              height: AppIconSizes.brandMark,
              excludeFromSemantics: true,
            ),
            const SizedBox(width: AppSpacing.s2),
            Text(
              dialCode,
              style: styles.fieldText.copyWith(color: colors.textPrimary),
            ),
            const SizedBox(width: AppSpacing.s2),
            const _Separator(),
            const SizedBox(width: AppSpacing.s2),
            Expanded(
              child: TextFormField(
                initialValue: initialValue,
                onChanged: onChanged,
                onFieldSubmitted: onSubmitted,
                readOnly: readOnly,
                autofocus: autofocus,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                autofillHints: const [AutofillHints.telephoneNumberNational],
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  if (maxDigits != null)
                    LengthLimitingTextInputFormatter(maxDigits),
                ],
                style: styles.fieldText.copyWith(color: colors.textPrimary),
                cursorColor: colors.textPrimary,
                decoration: OutlinedFieldBox.bareDecoration(
                  hintText: hint,
                  hintStyle: styles.fieldHint.copyWith(color: colors.textMuted),
                ),
              ),
            ),
            if (action != null)
              action!
            else if (isVerified)
              AppIcon(
                AppIcons.verified,
                size: AppIconSizes.inline,
                color: colors.accent,
                semanticLabel: verifiedLabel,
              ),
          ],
        ),
      ),
    );
  }
}

class _Separator extends StatelessWidget {
  const _Separator();

  static const double _height = 16;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: VerticalDivider(
        width: 1,
        thickness: 1,
        color: context.colors.inputBorder,
      ),
    );
  }
}
