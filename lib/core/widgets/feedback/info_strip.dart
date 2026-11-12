import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';

/// Full-width teal strip with items separated by "•".
class InfoStrip extends StatelessWidget {
  const InfoStrip({required this.items, super.key});

  static const String _separator = '  •  ';
  static const double _verticalPadding = 10;

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colors.accentSubtle,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.screenGutter,
          vertical: _verticalPadding,
        ),
        child: Text(
          items.join(_separator),
          textAlign: TextAlign.center,
          maxLines: 2,
          style: context.textStyles.captionLight.copyWith(
            color: context.colors.accent,
          ),
        ),
      ),
    );
  }
}
