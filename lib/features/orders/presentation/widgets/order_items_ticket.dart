import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rayyan_driver/core/assets/app_svgs.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_gradients.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/layout/gradient_rule.dart';
import 'package:rayyan_driver/core/widgets/media/app_network_image.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_detail.dart';

/// "Order Detail" ticket (Figma `5672:37787`): a light blue strip on top,
/// the item count and each item, and a scalloped foot.
class OrderItemsTicket extends StatelessWidget {
  const OrderItemsTicket({required this.order, super.key});

  // Measured on the Figma frame.
  static const double _stripOverhang = 8;
  static const double _stripRise = 5;
  static const double _stripHeight = 10;
  static const double _footHeight = 19;
  static const double _footDrop = 9;
  static const double _bottomPadding = 28;
  static const double _inline = 14;

  final OrderDetail order;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    final style = context.textStyles.bodyLightAuto.copyWith(
      color: colors.textSecondary,
    );
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -_stripRise,
          left: -_stripOverhang,
          right: -_stripOverhang,
          height: _stripHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: colors.receiptEdge,
              borderRadius: BorderRadius.circular(AppRadius.xs),
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(AppRadius.card),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              _inline,
              AppSpacing.s4,
              _inline,
              _bottomPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(l10n.orderTotalItems, style: style)),
                    Text(l10n.ordersItemCount(order.itemCount), style: style),
                  ],
                ),
                for (final (i, item) in order.items.indexed) ...[
                  const SizedBox(height: AppSpacing.s4),
                  if (i > 0) ...[
                    const GradientRule(),
                    const SizedBox(height: AppSpacing.s4),
                  ],
                  _ItemRow(item: item),
                ],
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -_footDrop,
          left: 0,
          right: 0,
          height: _footHeight,
          child: SvgPicture.asset(
            AppSvgs.receiptEdge,
            fit: BoxFit.fill,
            excludeFromSemantics: true,
          ),
        ),
      ],
    );
  }
}

class _ItemRow extends StatelessWidget {
  const _ItemRow({required this.item});

  static const double _thumb = 64;
  static const double _thumbInset = 3.56;
  static const double _thumbRadius = 11.636;
  static const double _textGap = 6;

  final OrderItem item;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    final l10n = context.l10n;
    final light = styles.bodyLightAuto.copyWith(color: colors.textSecondary);
    return Row(
      children: [
        Container(
          width: _thumb,
          height: _thumb,
          padding: const EdgeInsets.all(_thumbInset),
          decoration: BoxDecoration(
            gradient: AppGradients.thumbWash,
            borderRadius: BorderRadius.circular(_thumbRadius),
          ),
          child: AppNetworkImage(url: item.imageUrl, fit: BoxFit.contain),
        ),
        const SizedBox(width: AppSpacing.s3),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.s2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: styles.pageTitle.copyWith(color: colors.textPrimary),
                ),
                const SizedBox(height: _textGap),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: l10n.orderItemPack(item.volumeMl, item.bottles),
                        style: light,
                      ),
                      TextSpan(text: ' | ', style: light),
                      TextSpan(
                        text: l10n.orderItemQuantity(
                          item.quantity.toString().padLeft(2, '0'),
                        ),
                        style: styles.bodyAuto.copyWith(color: colors.brand),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
