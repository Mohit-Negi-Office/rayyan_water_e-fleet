import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/inputs/field_frame.dart';
import 'package:rayyan_driver/core/widgets/inputs/outlined_field_box.dart';

/// Looks of [AppTextField].
enum AppTextFieldVariant {
  /// White box on a tinted page (address form).
  filled,

  /// Outlined 48pt box on a white page (Fill Your Details). The error sits
  /// under the box and the outline stays grey.
  outlined,
}

/// Labelled text input ("Zone*", "Name*").
class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.label,
    this.controller,
    this.hint,
    this.isRequired = false,
    this.errorText,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.autofillHints,
    this.inputFormatters,
    this.variant = AppTextFieldVariant.filled,
    super.key,
  });

  final String label;
  final TextEditingController? controller;
  final String? hint;

  /// Appends "*" to the label.
  final bool isRequired;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final AppTextFieldVariant variant;

  @override
  Widget build(BuildContext context) => switch (variant) {
    AppTextFieldVariant.filled => _buildFilled(context),
    AppTextFieldVariant.outlined => _buildOutlined(context),
  };

  TextField _field(BuildContext context, TextStyle style, InputDecoration d) =>
      TextField(
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        textCapitalization: textCapitalization,
        autofillHints: autofillHints,
        inputFormatters: inputFormatters,
        style: style,
        cursorColor: context.colors.textPrimary,
        decoration: d,
      );

  Widget _buildOutlined(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    return FieldFrame(
      label: label,
      isRequired: isRequired,
      errorText: errorText,
      child: OutlinedFieldBox(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s3),
        child: Center(
          child: _field(
            context,
            styles.fieldText.copyWith(color: colors.textPrimary),
            OutlinedFieldBox.bareDecoration(
              hintText: hint ?? label,
              hintStyle: styles.fieldHint.copyWith(color: colors.textMuted),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilled(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.l),
      borderSide: BorderSide(color: colors.surface),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          isRequired ? '$label*' : label,
          style: styles.body.copyWith(color: colors.textSecondary),
        ),
        const SizedBox(height: AppSpacing.s2),
        _field(
          context,
          styles.body.copyWith(color: colors.textPrimary),
          InputDecoration(
            hintText: hint ?? label,
            hintStyle: styles.body.copyWith(color: colors.textMuted),
            errorText: errorText,
            filled: true,
            fillColor: colors.surface,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.s3,
              vertical: AppSpacing.s4,
            ),
            border: border,
            enabledBorder: border,
            focusedBorder: border.copyWith(
              borderSide: BorderSide(color: colors.brand),
            ),
          ),
        ),
      ],
    );
  }
}
