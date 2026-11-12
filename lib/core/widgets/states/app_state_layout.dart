import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';

/// Shared icon + title + message + action layout for empty and error states.
class AppStateLayout extends StatelessWidget {
  const AppStateLayout({
    required this.illustration,
    required this.title,
    this.message,
    this.action,
    this.isCompact = false,
    super.key,
  });

  final Widget illustration;
  final String title;
  final String? message;
  final Widget? action;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final body = message;
    final cta = action;
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        illustration,
        SizedBox(height: isCompact ? AppSpacing.s2 : AppSpacing.s4),
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.textStyles.sectionTitle.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
        if (body != null) ...[
          const SizedBox(height: AppSpacing.s2),
          Text(
            body,
            textAlign: TextAlign.center,
            style: context.textStyles.bodyLight.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
        ],
        if (cta != null) ...[
          SizedBox(height: isCompact ? AppSpacing.s3 : AppSpacing.s6),
          cta,
        ],
      ],
    );
    final padded = Padding(
      padding: EdgeInsets.all(
        isCompact ? AppSpacing.s4 : AppSpacing.screenGutter,
      ),
      child: content,
    );
    return isCompact
        ? padded
        : Center(child: SingleChildScrollView(child: padded));
  }
}
