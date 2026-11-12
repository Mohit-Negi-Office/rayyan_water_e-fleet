import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';

/// Bold navy text that acts as a link inside a sentence ("Resend",
/// "EDIT"). Sized to its text so it lines up with the copy around it.
class AppTextLink extends StatelessWidget {
  const AppTextLink({
    required this.label,
    required this.onPressed,
    this.color,
    this.style,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;

  /// Defaults to the brand colour.
  final Color? color;

  /// Defaults to `buttonLarge`; pass a smaller token to match nearby text.
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: color ?? context.colors.brand,
        textStyle: style ?? context.textStyles.buttonLarge,
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
      ),
      child: Text(label),
    );
  }
}
