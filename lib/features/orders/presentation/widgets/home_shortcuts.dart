import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/app/router/app_routes.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';

/// "Past Orders" and "Re-Assigned" tiles at the foot of Home (Figma
/// `5665:38857`).
class HomeShortcuts extends StatelessWidget {
  const HomeShortcuts({super.key});

  /// Figma gap between the tiles.
  static const double _gap = 14;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      children: [
        Expanded(
          child: _Tile(
            icon: AppIcons.orderBox,
            label: l10n.pastOrdersTitle,
            onTap: () => context.pushNamed(AppRoutes.pastOrders.name),
          ),
        ),
        const SizedBox(width: _gap),
        Expanded(
          child: _Tile(
            icon: AppIcons.reassigned,
            label: l10n.reassignedTitle,
            onTap: () => context.pushNamed(AppRoutes.reassignedOrders.name),
          ),
        ),
      ],
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({required this.icon, required this.label, required this.onTap});

  final String icon;
  final String label;
  final VoidCallback onTap;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppIcon(icon, size: AppIconSizes.header, color: colors.brand),
              const SizedBox(height: AppSpacing.s2),
              Text(
                label,
                style: context.textStyles.pageTitle.copyWith(
                  color: colors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
