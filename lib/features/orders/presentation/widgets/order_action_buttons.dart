import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/app/router/app_routes.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/network/app_config.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/utils/external_links.dart';
import 'package:rayyan_driver/core/widgets/buttons/app_button.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_detail.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/order_detail_cubit.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/reassign_sheet.dart';

/// "Re-Assign" (new order) or "Fail Delivery" (on the way) beside
/// "Contact Support" (Figma `5000:100217`, `5672:38164`).
class OrderActionButtons extends StatelessWidget {
  const OrderActionButtons({required this.order, super.key});

  final OrderDetail order;

  Future<void> _reassign(BuildContext context) async {
    final cubit = context.read<OrderDetailCubit>();
    final result = await ReassignSheet.show(context, orderId: order.id);
    if (result != null) cubit.replaced(result);
  }

  Future<void> _fail(BuildContext context) async {
    final cubit = context.read<OrderDetailCubit>();
    final result = await context.pushNamed<OrderDetail>(
      AppRoutes.failDelivery.name,
      pathParameters: {AppRoutes.orderIdParam: order.id},
    );
    if (result != null) cubit.replaced(result);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final actions = order.actions;
    return Row(
      children: [
        Expanded(
          child: actions.canReassign
              ? AppButton(
                  label: l10n.orderReassign,
                  variant: AppButtonVariant.outline,
                  size: AppButtonSize.large,
                  isExpanded: true,
                  onPressed: () => _reassign(context),
                )
              : AppButton(
                  label: l10n.orderFailDelivery,
                  variant: AppButtonVariant.dangerOutline,
                  size: AppButtonSize.large,
                  isExpanded: true,
                  onPressed: () => _fail(context),
                ),
        ),
        const SizedBox(width: AppSpacing.s4),
        Expanded(
          child: AppButton(
            label: l10n.orderContactSupport,
            variant: AppButtonVariant.outline,
            size: AppButtonSize.large,
            isExpanded: true,
            onPressed: () => ExternalLinks.call(AppConfig.supportPhone),
          ),
        ),
      ],
    );
  }
}
