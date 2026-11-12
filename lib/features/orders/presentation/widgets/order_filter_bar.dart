import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/widgets/selection/app_chip.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_filter.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/orders_list_cubit.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/orders_list_state.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/order_status_x.dart';

/// Status chips of an order list ("All", "New Order", …), scrolling
/// sideways past the screen edge as in Figma.
class OrderFilterBar extends StatelessWidget {
  const OrderFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<OrdersListCubit>();
    return BlocSelector<
      OrdersListCubit,
      OrdersListState,
      (List<OrderFilter>, OrderFilter)
    >(
      selector: (state) => (state.filters, state.filter),
      builder: (context, data) {
        final (filters, selected) = data;
        return AppChipTabs<OrderFilter>(
          items: [
            for (final f in filters)
              AppChipItem(value: f, label: f.label(l10n)),
          ],
          selected: selected,
          onSelected: cubit.filterChanged,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenGutter,
          ),
        );
      },
    );
  }
}
