import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';

/// Label above and error below an input on a white form ("Name*",
/// "Enter your name").
class FieldFrame extends StatelessWidget {
  const FieldFrame({
    required this.child,
    this.label,
    this.isRequired = false,
    this.errorText,
    super.key,
  });

  final Widget child;
  final String? label;

  /// Appends "*" to the label.
  final bool isRequired;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final label = this.label;
    final error = errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null && label.isNotEmpty) ...[
          Text(
            isRequired ? '$label*' : label,
            style: context.textStyles.fieldText.copyWith(
              color: context.colors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.s2),
        ],
        child,
        if (error != null) ...[
          const SizedBox(height: AppSpacing.s2),
          FieldErrorText(error),
        ],
      ],
    );
  }
}

/// Red message under an input ("Incorrect Number", "Incorrect OTP").
class FieldErrorText extends StatelessWidget {
  const FieldErrorText(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      liveRegion: true,
      child: Text(
        message,
        style: context.textStyles.fieldError.copyWith(
          color: context.colors.error,
        ),
      ),
    );
  }
}
