import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';

/// Small teal pill after a title ("Selected", "Home").
class AppTag extends StatelessWidget {
  const AppTag(this.text, {super.key});

  static const double _verticalPadding = 2;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s2,
        vertical: _verticalPadding,
      ),
      decoration: BoxDecoration(
        color: context.colors.successSurface,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(
        text,
        style: context.textStyles.microRegular.copyWith(
          color: context.colors.accent,
        ),
      ),
    );
  }
}
