import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';

/// Optional title over a list of [AppActionTile]s ("Upload an Image",
/// address Edit / Delete).
class AppActionSheet extends StatelessWidget {
  const AppActionSheet({required this.actions, this.title, super.key});

  final String? title;
  final List<AppActionTile> actions;

  @override
  Widget build(BuildContext context) {
    final heading = title;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (heading != null) ...[
          Text(
            heading,
            style: context.textStyles.pageTitle.copyWith(
              color: context.colors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.s4),
        ],
        for (final action in actions) ...[
          action,
          const SizedBox(height: AppSpacing.s3),
        ],
      ],
    );
  }
}

/// One row: icon, label and a trailing chevron.
class AppActionTile extends StatelessWidget {
  const AppActionTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isDestructive = false,
    this.trailing,
    super.key,
  }) : _isMenu = false;

  /// Borderless Profile / Policies row: 20 icons, 8 gap (Figma
  /// `4198:44341`, `4206:46711`).
  const AppActionTile.menu({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isDestructive = false,
    this.trailing,
    super.key,
  }) : _isMenu = true;

  final String icon;
  final String label;
  final VoidCallback onTap;
  final bool isDestructive;

  /// Replaces the chevron (the flag and "Eng ▾" on Change language).
  final Widget? trailing;
  final bool _isMenu;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final iconSize = _isMenu ? AppIconSizes.header : AppIconSizes.search;
    return Material(
      color: colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.card),
        side: _isMenu ? BorderSide.none : BorderSide(color: colors.cardBorder),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.card),
        onTap: onTap,
        child: Padding(
          padding: _isMenu
              ? const EdgeInsets.symmetric(
                  horizontal: AppSpacing.tileInline,
                  vertical: AppSpacing.s4,
                )
              : const EdgeInsets.all(AppSpacing.s4),
          child: Row(
            children: [
              AppIcon(
                icon,
                size: iconSize,
                color: isDestructive ? colors.error : colors.brand,
              ),
              SizedBox(width: _isMenu ? AppSpacing.s2 : AppSpacing.s3),
              Expanded(
                child: Text(
                  label,
                  style: context.textStyles.cardTitle.copyWith(
                    color: colors.textPrimary,
                  ),
                ),
              ),
              trailing ??
                  Transform.flip(
                    flipX: isRtl,
                    child: AppIcon(
                      AppIcons.chevronEnd,
                      size: iconSize,
                      color: colors.iconPrimary,
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
