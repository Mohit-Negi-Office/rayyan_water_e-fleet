import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rayyan_driver/app/di/injection.dart';
import 'package:rayyan_driver/core/widgets/layout/tinted_scaffold.dart';
import 'package:rayyan_driver/core/widgets/navigation/app_top_bar.dart';
import 'package:rayyan_driver/core/widgets/states/app_error_view.dart';
import 'package:rayyan_driver/core/widgets/states/app_loading_view.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/order_detail_cubit.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/order_detail_state.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/completion_bar.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/order_detail_body.dart';

/// Order Detail in every status (Figma `5000:100073` … `5691:36741`).
class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({required this.orderId, super.key});

  final String orderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OrderDetailCubit>(param1: orderId)..load(),
      child: const OrderDetailView(),
    );
  }
}

/// Detail content, separated from DI for testing.
class OrderDetailView extends StatelessWidget {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailCubit, OrderDetailState>(
      builder: (context, state) => TintedScaffold(
        wash: PageWash.detail,
        appBar: const AppTopBar(title: ''),
        bottomNavigationBar: switch (state) {
          OrderDetailLoaded() => CompletionBar(state: state),
          _ => null,
        },
        body: switch (state) {
          OrderDetailLoading() => const AppLoadingView(),
          OrderDetailFailure(:final failure) => AppErrorView(
            failure: failure,
            onRetry: context.read<OrderDetailCubit>().load,
          ),
          OrderDetailLoaded(:final order) => OrderDetailBody(order: order),
        },
      ),
    );
  }
}
