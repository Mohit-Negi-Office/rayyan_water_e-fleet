import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';
import 'package:rayyan_driver/features/support/domain/entities/faq.dart';

/// A question that opens to its answer (Figma `5000:105690`).
class FaqTile extends StatelessWidget {
  const FaqTile({
    required this.faq,
    required this.isExpanded,
    required this.onTap,
    super.key,
  });

  static const double _inline = 14;
  static const double _answerGap = 10;

  final Faq faq;
  final bool isExpanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    final radius = BorderRadius.circular(AppRadius.card);
    return Material(
      color: colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: radius,
        side: BorderSide(color: colors.hairline),
      ),
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: _inline,
            vertical: AppSpacing.s4,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Semantics(
                button: true,
                expanded: isExpanded,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        faq.question,
                        style: styles.bodyLight.copyWith(
                          color: colors.textPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.s2),
                    RotatedBox(
                      quarterTurns: isExpanded ? 2 : 0,
                      child: AppIcon(
                        AppIcons.chevronDown,
                        size: AppIconSizes.header,
                        color: colors.iconPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              if (isExpanded) ...[
                const SizedBox(height: _answerGap),
                Text(
                  faq.answer,
                  style: styles.bodyLightLoose.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
