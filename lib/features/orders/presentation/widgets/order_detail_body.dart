import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/utils/external_links.dart';
import 'package:rayyan_driver/core/widgets/buttons/app_square_icon_button.dart';
import 'package:rayyan_driver/features/orders/domain/entities/delivery_status.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_detail.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/detail_section.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/location_photos.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/order_action_buttons.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/order_items_ticket.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/order_summary_card.dart';

/// Every section of the order detail, top to bottom.
///
/// A re-assigned order shows "Reason for reassign" under the summary
/// (Figma `5672:38961`); a failed one shows "Reason for fail delivery"
/// (`5691:36741`). Closed orders drop directions, call and the actions.
class OrderDetailBody extends StatelessWidget {
  const OrderDetailBody({required this.order, super.key});

  /// Measured: content starts 24pt under the back button.
  static const double _top = 4;
  static const double _gap = AppSpacing.s4;

  final OrderDetail order;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final actions = order.actions;
    final reason = order.reason?.trim();
    final reasonTitle = switch (order.status) {
      DeliveryStatus.reassigned => l10n.orderReasonReassign,
      DeliveryStatus.failed => l10n.orderReasonFail,
      _ => null,
    };
    final note = order.specialInstruction;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.screenGutter,
        _top,
        AppSpacing.screenGutter,
        AppSpacing.s6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OrderSummaryCard(order: order),
          if (reasonTitle != null && reason != null && reason.isNotEmpty) ...[
            const SizedBox(height: _gap),
            DetailSection(
              title: reasonTitle,
              child: _TextCard(text: reason, isTitle: true),
            ),
          ],
          const SizedBox(height: _gap),
          DetailSection(
            title: l10n.orderDetailTitle,
            child: OrderItemsTicket(order: order),
          ),
          const SizedBox(height: _gap),
          DetailSection(
            title: l10n.orderDeliveryLocation,
            child: _LocationCard(order: order),
          ),
          if (order.location.photoUrls.isNotEmpty) ...[
            const SizedBox(height: _gap),
            LocationPhotos(urls: order.location.photoUrls),
          ],
          const SizedBox(height: _gap),
          DetailSection(
            title: l10n.orderCustomerDetail,
            child: _CustomerCard(order: order),
          ),
          if (note != null && note.isNotEmpty) ...[
            const SizedBox(height: _gap),
            DetailSection(
              title: l10n.orderSpecialInstruction,
              child: _TextCard(text: note),
            ),
          ],
          if (actions.canReassign || actions.canFail) ...[
            const SizedBox(height: _gap),
            OrderActionButtons(order: order),
          ],
        ],
      ),
    );
  }
}

class _LocationCard extends StatelessWidget {
  const _LocationCard({required this.order});

  final OrderDetail order;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    final location = order.location;
    final canReach = order.actions.canReachCustomer;
    return DetailCard(
      tapLabel: context.l10n.orderDirections,
      onTap: canReach
          ? () => ExternalLinks.directions(
              latitude: location.latitude,
              longitude: location.longitude,
              address: location.address,
            )
          : null,
      child: DetailRow(
        action: canReach
            ? const AppSquareIconMark(icon: AppIcons.directions)
            : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              location.recipient,
              style: styles.bodyAuto.copyWith(color: colors.textPrimary),
            ),
            const SizedBox(height: 4),
            Text(
              location.address,
              style: styles.bodyLightAuto.copyWith(color: colors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomerCard extends StatelessWidget {
  const _CustomerCard({required this.order});

  final OrderDetail order;

  @override
  Widget build(BuildContext context) {
    final canReach = order.actions.canReachCustomer;
    return DetailCard(
      tapLabel: context.l10n.orderCallCustomer,
      onTap: canReach ? () => ExternalLinks.call(order.customerPhone) : null,
      child: DetailRow(
        action: canReach ? const AppSquareIconMark(icon: AppIcons.call) : null,
        child: _TextLine(text: order.customerName, isTitle: true),
      ),
    );
  }
}

class _TextCard extends StatelessWidget {
  const _TextCard({required this.text, this.isTitle = false});

  final String text;
  final bool isTitle;

  @override
  Widget build(BuildContext context) => DetailCard(
    child: _TextLine(text: text, isTitle: isTitle),
  );
}

/// 16 Light black (names, reasons) or 14 Light grey (instructions).
class _TextLine extends StatelessWidget {
  const _TextLine({required this.text, required this.isTitle});

  final String text;
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    return Text(
      text,
      style: isTitle
          ? styles.subtitleLight.copyWith(color: colors.textPrimary)
          : styles.bodyLightAuto.copyWith(color: colors.textSecondary),
    );
  }
}
