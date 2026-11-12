import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rayyan_driver/app/di/injection.dart';
import 'package:rayyan_driver/app/session/driver_profile_cubit.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/layout/tinted_scaffold.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_list_scope.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/current_time_cubit.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/orders_list_cubit.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/home_header.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/home_shortcuts.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/order_filter_bar.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/order_search_box.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/orders_slivers.dart';

/// Home (Figma `5665:38771`, `5912:36798`): today's orders under the curved
/// header. The header, search and Today's Orders stay put; the list and
/// Order History scroll, and pull-to-refresh starts under that section.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<OrdersListCubit>(param1: OrderListScope.today)..load(),
        ),
        BlocProvider(create: (_) => getIt<CurrentTimeCubit>()),
      ],
      child: const HomeView(),
    );
  }
}

/// Home content, separated from DI for testing.
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  /// Figma gaps: search → title and chips → the tiles.
  static const double _sectionGap = 20;

  @override
  Widget build(BuildContext context) {
    final avatar = context.select(
      (DriverProfileCubit c) => c.state.profile?.photoUrl,
    );
    const gutter = EdgeInsets.symmetric(horizontal: AppSpacing.screenGutter);
    return TintedScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HomeHeader(avatarUrl: avatar),
          const Padding(padding: gutter, child: OrderSearchBox()),
          const SizedBox(height: _sectionGap),
          Padding(
            padding: gutter,
            child: Text(
              context.l10n.homeTodaysOrders,
              style: context.textStyles.sectionTitle.copyWith(
                color: context.colors.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.s4),
          const OrderFilterBar(showCounts: true),
          const SizedBox(height: AppSpacing.s4),
          Expanded(
            child: RefreshIndicator(
              onRefresh: context.read<OrdersListCubit>().refresh,
              child: const CustomScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                slivers: [
                  OrdersSliver(),
                  SliverToBoxAdapter(child: SizedBox(height: _sectionGap)),
                  SliverPadding(
                    padding: gutter,
                    sliver: SliverToBoxAdapter(child: HomeShortcuts()),
                  ),
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
