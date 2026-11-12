import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/utils/formatters/date_formatter.dart';
import 'package:rayyan_driver/core/widgets/layout/gradient_rule.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_detail.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/detail_section.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/order_status_label.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/order_status_x.dart';

/// Top card of the order detail (Figma `5672:37686`): status and number,
/// payment, delivery window and when it was assigned.
class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({required this.order, super.key});

  static const double _gap = 14;

  final OrderDetail order;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final styles = context.textStyles;
    final locale = Localizations.localeOf(context).languageCode;
    final light = styles.bodyLightAuto;
    final slot =
        '${AppDateFormatter.fullDate(order.slotStart, locale)} | '
        '${AppDateFormatter.timeRange(order.slotStart, order.slotEnd, locale)}';
    final assigned =
        '${AppDateFormatter.fullDate(order.assignedAt, locale)} | '
        '${AppDateFormatter.time(order.assignedAt, locale)}';
    return DetailCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(child: OrderStatusLabel(status: order.status)),
              Text(
                l10n.orderNumber(order.number),
                style: light.copyWith(color: colors.textPrimary),
              ),
            ],
          ),
          const SizedBox(height: _gap),
          const GradientRule(),
          const SizedBox(height: _gap),
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.paymentStatusLabel,
                  style: light.copyWith(color: colors.textSecondary),
                ),
              ),
              Text(
                order.payment.label(l10n),
                style: styles.bodyAuto.copyWith(
                  color: order.payment.color(colors),
                ),
              ),
            ],
          ),
          const SizedBox(height: _gap),
          const GradientRule(),
          const SizedBox(height: _gap),
          _LabelValue(label: l10n.orderDeliveryDateTime, value: slot),
          const SizedBox(height: _gap),
          const GradientRule(),
          const SizedBox(height: _gap),
          _LabelValue(label: l10n.orderAssignedOn, value: assigned),
        ],
      ),
    );
  }
}

class _LabelValue extends StatelessWidget {
  const _LabelValue({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final style = context.textStyles.bodyLightAuto;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: style.copyWith(color: colors.textTertiary)),
        const SizedBox(height: AppSpacing.s2),
        Text(value, style: style.copyWith(color: colors.textPrimary)),
      ],
    );
  }
}
