import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/utils/formatters/date_formatter.dart';
import 'package:rayyan_driver/core/widgets/layout/gradient_rule.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_order.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_status.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_list_scope.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/order_status_label.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/order_status_x.dart';

/// An order in a list (Figma Home `5912:36798` / `5665:38806`, Order History
/// `5000:99930`, Re-Assigned `5000:100020`). [expanded] cards show the
/// payment and the customer; delivered and cancelled ones end in a chevron.
class OrderCard extends StatelessWidget {
  const OrderCard({
    required this.order,
    required this.scope,
    required this.onTap,
    required this.expanded,
    super.key,
  });

  static const double _padding = 14;
  static const double _rowGap = 14;

  final DeliveryOrder order;
  final OrderListScope scope;
  final VoidCallback onTap;

  /// New orders still out for delivery. Delivered and cancelled cards are
  /// the shorter row.
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    final radius = BorderRadius.circular(AppRadius.card);
    return Material(
      color: colors.surface,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(_padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                context.l10n.orderNumber(order.number),
                style: styles.bodyLightAuto.copyWith(
                  color: colors.textSecondary,
                ),
              ),
              const SizedBox(height: _rowGap),
              if (expanded) ...[
                _TodayStatusRow(order: order),
                const SizedBox(height: _rowGap),
                const GradientRule(),
                const SizedBox(height: _rowGap),
                _CustomerRow(order: order),
              ] else
                Row(
                  children: [
                    Expanded(
                      child: _StatusBlock(
                        order: order,
                        scope: scope,
                        expanded: false,
                      ),
                    ),
                    const _Chevron(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TodayStatusRow extends StatelessWidget {
  const _TodayStatusRow({required this.order});

  final DeliveryOrder order;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    final l10n = context.l10n;
    final payment = order.payment;
    return Row(
      children: [
        Expanded(
          child: _StatusBlock(
            order: order,
            scope: OrderListScope.today,
            expanded: true,
          ),
        ),
        if (payment != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                payment.label(l10n),
                style: styles.labelAuto.copyWith(color: payment.color(colors)),
              ),
              const SizedBox(height: 2),
              Text(
                l10n.paymentStatusLabel,
                style: styles.captionAuto.copyWith(color: colors.textSecondary),
              ),
            ],
          ),
      ],
    );
  }
}

/// Status, then "3 Items | 08:00 AM-10:00 AM" (or the day it closed).
class _StatusBlock extends StatelessWidget {
  const _StatusBlock({
    required this.order,
    required this.scope,
    required this.expanded,
  });

  final DeliveryOrder order;
  final OrderListScope scope;
  final bool expanded;

  String? _when(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final start = order.slotStart;
    final end = order.slotEnd;
    final closed = order.closedAt;
    return switch (scope) {
      OrderListScope.today when expanded && start != null && end != null =>
        AppDateFormatter.timeRange(start, end, locale, isCompact: true),
      OrderListScope.today || OrderListScope.past when closed != null =>
        order.status == DeliveryStatus.delivered ||
                order.status == DeliveryStatus.reassigned
            ? '${AppDateFormatter.fullDate(closed, locale)} | '
                  '${AppDateFormatter.time(closed, locale)}'
            : AppDateFormatter.fullDate(closed, locale),
      OrderListScope.reassigned when start != null => AppDateFormatter.time(
        start,
        locale,
      ),
      _ => null,
    };
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final style = context.textStyles.captionAuto;
    final when = _when(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderStatusLabel(status: order.status),
        const SizedBox(height: 4),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: context.l10n.ordersItemCount(order.itemCount),
                style: style.copyWith(color: colors.textPrimary),
              ),
              if (when != null)
                TextSpan(
                  text: ' | $when',
                  style: style.copyWith(color: colors.textSecondary),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CustomerRow extends StatelessWidget {
  const _CustomerRow({required this.order});

  final DeliveryOrder order;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final style = context.textStyles.bodyLightAuto;
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.customerName,
                style: style.copyWith(color: colors.textPrimary),
              ),
              const SizedBox(height: 4),
              Text(
                order.address,
                style: style.copyWith(color: colors.textSecondary),
              ),
            ],
          ),
        ),
        const _Chevron(),
      ],
    );
  }
}

class _Chevron extends StatelessWidget {
  const _Chevron();

  @override
  Widget build(BuildContext context) => AppIcon(
    AppIcons.chevronEnd,
    size: AppIconSizes.inline,
    color: context.colors.brand,
    matchTextDirection: true,
  );
}
