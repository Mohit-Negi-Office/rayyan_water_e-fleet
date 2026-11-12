import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rayyan_driver/core/l10n/generated/app_localizations.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/widgets/selection/app_chip.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_filter.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/orders_list_cubit.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/orders_list_state.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/order_status_x.dart';

/// Status chips of an order list, scrolling sideways past the screen edge
/// as in Figma. Home passes [showCounts] ("New Order (2)").
class OrderFilterBar extends StatelessWidget {
  const OrderFilterBar({this.showCounts = false, super.key});

  final bool showCounts;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<OrdersListCubit>();
    return BlocSelector<
      OrdersListCubit,
      OrdersListState,
      (List<OrderFilter>, OrderFilter, String, OrdersLoad)
    >(
      selector: (state) =>
          (state.filters, state.filter, state.query, state.load),
      builder: (context, data) {
        final (filters, selected, query, load) = data;
        return AppChipTabs<OrderFilter>(
          items: [
            for (final filter in filters)
              AppChipItem(
                value: filter,
                label: _label(l10n, filter, query, load),
              ),
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

  String _label(
    AppLocalizations l10n,
    OrderFilter filter,
    String query,
    OrdersLoad load,
  ) {
    final name = filter.label(l10n);
    if (!showCounts || load is! OrdersLoaded) return name;
    return l10n.ordersFilterCount(
      name,
      filter.apply(load.orders, query: query).length,
    );
  }
}
