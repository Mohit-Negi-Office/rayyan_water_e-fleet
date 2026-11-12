import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/selection/app_chip.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/orders_list_cubit.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/order_history_filter_sheet.dart';

/// "All Orders" and the Filter chip under the status chips
/// (Figma `5908:36715`). The chip fills in once a date range is applied.
class OrderHistoryToolbar extends StatelessWidget {
  const OrderHistoryToolbar({super.key});

  Future<void> _openFilter(BuildContext context) async {
    final cubit = context.read<OrdersListCubit>();
    final result = await OrderHistoryFilterSheet.show(
      context,
      initial: cubit.state.dateRange,
    );
    if (result == null || !context.mounted) return;
    cubit.dateRangeChanged(result.range);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final hasRange = context.select(
      (OrdersListCubit cubit) => cubit.state.dateRange != null,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenGutter),
      child: Row(
        children: [
          Expanded(
            child: Text(
              l10n.ordersAllOrders,
              style: context.textStyles.priceLarge.copyWith(
                color: context.colors.textPrimary,
              ),
            ),
          ),
          AppChip(
            label: l10n.filterTitle,
            icon: AppIcons.filter,
            isSelected: hasRange,
            onTap: () => _openFilter(context),
          ),
        ],
      ),
    );
  }
}
