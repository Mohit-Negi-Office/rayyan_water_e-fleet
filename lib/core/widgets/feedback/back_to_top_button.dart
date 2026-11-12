import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';

/// Dark "Back To Top" pill shown after scrolling a long list.
class BackToTopButton extends StatelessWidget {
  const BackToTopButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Material(
      color: colors.textPrimary.withValues(alpha: 0.8),
      borderRadius: BorderRadius.circular(AppRadius.pill),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.pill),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.s3,
            vertical: AppSpacing.s2,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: context.textStyles.cardTitle.copyWith(
                  color: colors.onBrand,
                ),
              ),
              const SizedBox(width: AppSpacing.s2),
              DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: colors.onBrand),
                ),
                child: AppIcon(
                  AppIcons.backToTop,
                  size: AppIconSizes.inline,
                  color: colors.onBrand,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
