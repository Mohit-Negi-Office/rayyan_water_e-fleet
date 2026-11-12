import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rayyan_driver/app/di/injection.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/widgets/layout/tinted_scaffold.dart';
import 'package:rayyan_driver/core/widgets/navigation/app_top_bar.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_list_scope.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/orders_list_cubit.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/order_filter_bar.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/order_history_toolbar.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/order_search_box.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/orders_slivers.dart';

/// Order History (Figma `5000:99925`) and "Re-Assigned" (`5000:100005`).
/// Search and the status chips stay put; only the cards scroll.
class OrdersPage extends StatelessWidget {
  const OrdersPage({required this.scope, super.key});

  final OrderListScope scope;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OrdersListCubit>(param1: scope)..load(),
      child: OrdersView(scope: scope),
    );
  }
}

/// List content, separated from DI for testing.
class OrdersView extends StatelessWidget {
  const OrdersView({required this.scope, super.key});

  /// Measured: the search box starts 10pt under the back button, then 20pt
  /// before the chips (Figma `5000:99930`).
  static const double _top = 10;
  static const double _searchGap = 20;

  final OrderListScope scope;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isHistory = scope == OrderListScope.past;
    return TintedScaffold(
      appBar: AppTopBar(
        title: switch (scope) {
          OrderListScope.past => l10n.orderHistoryTitle,
          OrderListScope.reassigned => l10n.reassignedTitle,
          OrderListScope.today => l10n.homeTodaysOrders,
        },
        backStyle: AppBarIconStyle.filled,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.screenGutter,
              _top,
              AppSpacing.screenGutter,
              0,
            ),
            child: OrderSearchBox(),
          ),
          const SizedBox(height: _searchGap),
          const OrderFilterBar(),
          if (isHistory) ...[
            const SizedBox(height: AppSpacing.s4),
            const OrderHistoryToolbar(),
          ],
          const SizedBox(height: AppSpacing.s4),
          Expanded(
            child: RefreshIndicator(
              onRefresh: context.read<OrdersListCubit>().refresh,
              child: const CustomScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                slivers: [
                  OrdersSliver(),
                  SliverSafeArea(
                    top: false,
                    sliver: SliverToBoxAdapter(
                      child: SizedBox(height: AppSpacing.s6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
