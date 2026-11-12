import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/app/router/app_routes.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/widgets/states/app_empty_view.dart';
import 'package:rayyan_driver/core/widgets/states/app_error_view.dart';
import 'package:rayyan_driver/core/widgets/states/app_loading_view.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_order.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_filter.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_list_scope.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/orders_list_cubit.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/orders_list_state.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/order_card.dart';

/// The cards of an order list as a sliver, or its loading, empty and error
/// states. Opening an order refreshes the list on the way back.
class OrdersSliver extends StatelessWidget {
  const OrdersSliver({super.key});

  /// Figma gap between cards.
  static const double _gap = AppSpacing.s4;

  Future<void> _open(BuildContext context, DeliveryOrder order) async {
    final cubit = context.read<OrdersListCubit>();
    await context.pushNamed(
      AppRoutes.orderDetail.name,
      pathParameters: {AppRoutes.orderIdParam: order.id},
    );
    await cubit.refresh();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrdersListCubit>();
    return BlocBuilder<OrdersListCubit, OrdersListState>(
      builder: (context, state) => switch (state.load) {
        OrdersLoading() => const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.s10),
            child: AppLoadingView.compact(),
          ),
        ),
        OrdersFailure(:final failure) => SliverToBoxAdapter(
          child: AppErrorView.compact(failure: failure, onRetry: cubit.load),
        ),
        OrdersLoaded(:final orders) => _cards(
          context,
          state.filter.apply(
            orders,
            query: state.query,
            dateRange: state.dateRange,
            now: DateTime.now(),
          ),
          expanded:
              cubit.scope == OrderListScope.today &&
              state.filter == OrderFilter.newOrder,
        ),
      },
    );
  }

  Widget _cards(
    BuildContext context,
    List<DeliveryOrder> orders, {
    required bool expanded,
  }) {
    final l10n = context.l10n;
    if (orders.isEmpty) {
      return SliverToBoxAdapter(
        child: AppEmptyView(
          title: l10n.ordersEmptyTitle,
          message: l10n.ordersEmptyMessage,
        ),
      );
    }
    final scope = context.read<OrdersListCubit>().scope;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenGutter),
      sliver: SliverList.separated(
        itemCount: orders.length,
        separatorBuilder: (_, _) => const SizedBox(height: _gap),
        itemBuilder: (context, index) {
          final order = orders[index];
          return OrderCard(
            key: ValueKey(order.id),
            order: order,
            scope: scope,
            expanded: expanded,
            onTap: () => _open(context, order),
          );
        },
      ),
    );
  }
}
