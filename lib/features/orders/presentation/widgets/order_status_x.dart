import 'package:flutter/widgets.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/l10n/generated/app_localizations.dart';
import 'package:rayyan_driver/core/theme/app_color_scheme.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_status.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_filter.dart';
import 'package:rayyan_driver/features/orders/domain/entities/payment_status.dart';

/// Mark, colour and label of an order status.
extension DeliveryStatusUi on DeliveryStatus {
  String get icon => switch (this) {
    DeliveryStatus.newOrder ||
    DeliveryStatus.orderPicked ||
    DeliveryStatus.dropOff => AppIcons.orderBox,
    DeliveryStatus.delivered => AppIcons.delivered,
    DeliveryStatus.cancelled => AppIcons.cancelled,
    DeliveryStatus.failed => AppIcons.deliveryFailed,
    DeliveryStatus.reassigned => AppIcons.reassigned,
  };

  Color color(AppColorScheme colors) => switch (this) {
    DeliveryStatus.delivered => colors.positive,
    DeliveryStatus.failed || DeliveryStatus.cancelled => colors.error,
    _ => colors.brand,
  };

  String label(AppLocalizations l10n) => switch (this) {
    DeliveryStatus.newOrder => l10n.orderStatusNewOrder,
    DeliveryStatus.orderPicked => l10n.orderStatusOrderPicked,
    DeliveryStatus.dropOff => l10n.orderStatusDropOff,
    DeliveryStatus.delivered => l10n.orderStatusDelivered,
    DeliveryStatus.cancelled => l10n.orderStatusCancelled,
    DeliveryStatus.failed => l10n.orderStatusFailed,
    DeliveryStatus.reassigned => l10n.orderStatusReassigned,
  };
}

extension PaymentStatusUi on PaymentStatus {
  Color color(AppColorScheme colors) => switch (this) {
    PaymentStatus.paid => colors.positive,
    PaymentStatus.pending => colors.attention,
  };

  String label(AppLocalizations l10n) => switch (this) {
    PaymentStatus.paid => l10n.paymentPaid,
    PaymentStatus.pending => l10n.paymentPending,
  };
}

extension OrderFilterUi on OrderFilter {
  String label(AppLocalizations l10n) => switch (this) {
    OrderFilter.all => l10n.ordersFilterAll,
    OrderFilter.newOrder => l10n.orderStatusNewOrder,
    OrderFilter.orderPicked => l10n.orderStatusOrderPicked,
    OrderFilter.dropOff => l10n.orderStatusDropOff,
    OrderFilter.delivered => l10n.orderStatusDelivered,
    OrderFilter.cancelled => l10n.orderStatusCancelled,
    OrderFilter.failed => l10n.ordersFilterFailed,
  };
}
