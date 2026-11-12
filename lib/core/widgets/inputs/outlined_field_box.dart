import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';

/// The 48pt white box with a light outline that holds an input on the
/// login screens (phone number, OTP digit).
class OutlinedFieldBox extends StatelessWidget {
  const OutlinedFieldBox({required this.child, this.padding, super.key});

  static const double height = 48;

  final Widget child;
  final EdgeInsetsGeometry? padding;

  /// Decoration for a text field inside the box: no fill and no borders,
  /// so the app's input theme (focused outline) does not draw a second box.
  static InputDecoration bareDecoration({
    String? hintText,
    TextStyle? hintStyle,
  }) => InputDecoration(
    hintText: hintText,
    hintStyle: hintStyle,
    isCollapsed: true,
    filled: false,
    contentPadding: EdgeInsets.zero,
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    focusedErrorBorder: InputBorder.none,
  );

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: colors.inputBorder),
      ),
      child: child,
    );
  }
}
