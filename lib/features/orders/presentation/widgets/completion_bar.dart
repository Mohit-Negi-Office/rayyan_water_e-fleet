import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rayyan_driver/core/error/failure_ui_x.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_shadows.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/utils/formatters/money_formatter.dart';
import 'package:rayyan_driver/core/widgets/feedback/app_inline_banner.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_actions.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/order_detail_cubit.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/order_detail_state.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/swipe_to_confirm.dart';

/// White bar at the foot of an order on the way: swipe "Mark As Deliver",
/// or "Total Amount" and swipe "Cash Collected" for an unpaid order
/// (Figma `5672:38306`, `5672:38544`).
class CompletionBar extends StatelessWidget {
  const CompletionBar({required this.state, super.key});

  static const double _radius = 20;
  static const double _inline = 24;
  static const double _block = 20;
  static const double _gap = 14;

  final OrderDetailLoaded state;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    final l10n = context.l10n;
    final order = state.order;
    final completion = order.actions.completion;
    if (completion == null) return const SizedBox.shrink();
    final failure = state.actionFailure;
    final isCash = completion == DeliveryCompletion.collectCash;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(_radius),
        ),
        boxShadow: AppShadows.bottomBar,
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: _inline,
            vertical: _block,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (failure != null) ...[
                AppInlineBanner.error(message: failure.toMessage(l10n)),
                const SizedBox(height: AppSpacing.s3),
              ],
              if (isCash) ...[
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        l10n.orderTotalAmount,
                        style: styles.bodyAuto.copyWith(
                          color: colors.textPrimary,
                        ),
                      ),
                    ),
                    Text(
                      MoneyFormatter.formatMinor(order.totalMinor),
                      style: styles.priceLarge.copyWith(color: colors.accent),
                    ),
                  ],
                ),
                const SizedBox(height: _gap),
              ],
              SwipeToConfirm(
                label: isCash
                    ? l10n.orderCashCollected
                    : l10n.orderMarkDelivered,
                isBusy: state.isCompleting,
                onConfirmed: context.read<OrderDetailCubit>().complete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
