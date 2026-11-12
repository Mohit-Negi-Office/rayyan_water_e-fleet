import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';

/// Fixed-height multi-line box for a written reason ("Leave Reason" on
/// Re-Assign Order `5000:101218`, "Reason" on Fail Delivery `5691:37021`):
/// white, a faint outline, the text starting at the top.
class AppTextArea extends StatelessWidget {
  const AppTextArea({
    required this.hint,
    required this.height,
    this.controller,
    this.onChanged,
    this.maxLength = defaultMaxLength,
    super.key,
  });

  static const int defaultMaxLength = 300;

  /// Figma padding: 12 across, 14 down.
  static const EdgeInsets _padding = EdgeInsets.symmetric(
    horizontal: AppSpacing.s3,
    vertical: 14,
  );

  final String hint;
  final double height;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.card),
      borderSide: BorderSide(color: colors.fieldDisabled),
    );
    return SizedBox(
      height: height,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        maxLength: maxLength,
        expands: true,
        maxLines: null,
        textAlignVertical: TextAlignVertical.top,
        keyboardType: TextInputType.multiline,
        textCapitalization: TextCapitalization.sentences,
        style: styles.bodyLight.copyWith(color: colors.textPrimary),
        cursorColor: colors.textPrimary,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: styles.bodyLight.copyWith(color: colors.textMuted),
          counterText: '',
          filled: true,
          fillColor: colors.surface,
          isDense: true,
          contentPadding: _padding,
          border: border,
          enabledBorder: border,
          focusedBorder: border,
        ),
      ),
    );
  }
}
