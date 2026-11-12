import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_status.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/order_status_x.dart';

/// 16pt status mark and its label in the status colour ("New Order",
/// "Delivered", "Delivery Failed", "Re-Assigned").
class OrderStatusLabel extends StatelessWidget {
  const OrderStatusLabel({required this.status, super.key});

  /// Figma gap between mark and label.
  static const double _gap = 6;

  final DeliveryStatus status;

  @override
  Widget build(BuildContext context) {
    final color = status.color(context.colors);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppIcon(status.icon, size: AppIconSizes.inline, color: color),
        const SizedBox(width: _gap),
        Flexible(
          child: Text(
            status.label(context.l10n),
            style: context.textStyles.bodyAuto.copyWith(color: color),
          ),
        ),
      ],
    );
  }
}
