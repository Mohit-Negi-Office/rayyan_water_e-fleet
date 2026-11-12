import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/app/router/app_routes.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';

/// "Order History" row at the foot of Home (Figma `5924:40931`).
class HomeShortcuts extends StatelessWidget {
  const HomeShortcuts({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final radius = BorderRadius.circular(AppRadius.card);
    return Material(
      color: colors.surface,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: () => context.pushNamed(AppRoutes.pastOrders.name),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.tileInline,
            vertical: AppSpacing.s4,
          ),
          child: Row(
            children: [
              AppIcon(
                AppIcons.orderHistory,
                size: AppIconSizes.header,
                color: colors.brand,
              ),
              const SizedBox(width: AppSpacing.s2),
              Expanded(
                child: Text(
                  context.l10n.orderHistoryTitle,
                  style: context.textStyles.pageTitle.copyWith(
                    color: colors.textPrimary,
                  ),
                ),
              ),
              AppIcon(
                AppIcons.chevronEnd,
                size: AppIconSizes.inline,
                color: colors.brand,
                matchTextDirection: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
