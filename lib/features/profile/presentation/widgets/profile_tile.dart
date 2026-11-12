import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';

/// White Profile row: 20pt mark, 16pt label and a chevron, or [trailing]
/// (Figma `5000:105304`).
class ProfileTile extends StatelessWidget {
  const ProfileTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
    this.trailing,
    super.key,
  });

  final String icon;
  final String label;
  final VoidCallback onTap;

  /// Defaults to navy; Logout is red.
  final Color? iconColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final radius = BorderRadius.circular(AppRadius.card);
    return Material(
      color: colors.surface,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.tileInline,
            vertical: AppSpacing.s4,
          ),
          child: Row(
            children: [
              AppIcon(
                icon,
                size: AppIconSizes.header,
                color: iconColor ?? colors.brand,
              ),
              const SizedBox(width: AppSpacing.s2),
              Expanded(
                child: Text(
                  label,
                  style: context.textStyles.pageTitle.copyWith(
                    color: colors.textPrimary,
                  ),
                ),
              ),
              trailing ??
                  AppIcon(
                    AppIcons.chevronEnd,
                    size: AppIconSizes.header,
                    color: colors.iconPrimary,
                    matchTextDirection: true,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
