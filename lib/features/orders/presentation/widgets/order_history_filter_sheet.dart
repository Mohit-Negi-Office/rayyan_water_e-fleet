import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/l10n/generated/app_localizations.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/buttons/app_button.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';
import 'package:rayyan_driver/core/widgets/overlays/app_bottom_sheet.dart';
import 'package:rayyan_driver/core/widgets/selection/app_check_option.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_filter.dart';

/// What [OrderHistoryFilterSheet] commits. A null [range] clears the filter.
final class OrderHistoryFilterResult {
  const OrderHistoryFilterResult(this.range);

  final OrderDateRange? range;
}

/// Date-range sheet (Figma `5908:36859`). Reset and Apply stay off until a
/// range is checked. Reset clears the filter; Apply keeps the choice.
class OrderHistoryFilterSheet extends StatefulWidget {
  const OrderHistoryFilterSheet({this.initial, super.key});

  final OrderDateRange? initial;

  static Future<OrderHistoryFilterResult?> show(
    BuildContext context, {
    OrderDateRange? initial,
  }) => showAppBottomSheet<OrderHistoryFilterResult>(
    context: context,
    builder: (_) => OrderHistoryFilterSheet(initial: initial),
  );

  @override
  State<OrderHistoryFilterSheet> createState() =>
      _OrderHistoryFilterSheetState();
}

class _OrderHistoryFilterSheetState extends State<OrderHistoryFilterSheet> {
  late final ValueNotifier<OrderDateRange?> _choice = ValueNotifier(
    widget.initial,
  );

  @override
  void dispose() {
    _choice.dispose();
    super.dispose();
  }

  void _select(OrderDateRange range) {
    _choice.value = _choice.value == range ? null : range;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ValueListenableBuilder<OrderDateRange?>(
      valueListenable: _choice,
      builder: (context, selected, _) {
        final on = selected == null
            ? null
            : () => context.pop(OrderHistoryFilterResult(selected));
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.filterTitle,
              style: context.textStyles.pageTitle.copyWith(
                color: context.colors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.s4),
            _DateRangeCard(selected: selected, onSelect: _select),
            const SizedBox(height: AppSpacing.s4),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    label: l10n.commonReset,
                    variant: AppButtonVariant.outline,
                    size: AppButtonSize.large,
                    isExpanded: true,
                    onPressed: selected == null
                        ? null
                        : () =>
                              context.pop(const OrderHistoryFilterResult(null)),
                  ),
                ),
                const SizedBox(width: AppSpacing.s4),
                Expanded(
                  child: AppButton(
                    label: l10n.commonApply,
                    size: AppButtonSize.large,
                    isExpanded: true,
                    onPressed: on,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _DateRangeCard extends StatelessWidget {
  const _DateRangeCard({required this.selected, required this.onSelect});

  final OrderDateRange? selected;
  final ValueChanged<OrderDateRange> onSelect;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    final optionStyle = context.textStyles.bodyLightAuto.copyWith(
      color: colors.textSecondary,
    );
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: colors.hairline),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.tileInline,
          vertical: AppSpacing.s4,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.ordersDateRange,
                    style: context.textStyles.bodyLightAuto.copyWith(
                      color: colors.textPrimary,
                    ),
                  ),
                ),
                Transform.flip(
                  flipY: true,
                  child: AppIcon(
                    AppIcons.dateRangeChevron,
                    size: AppIconSizes.header,
                    color: colors.iconPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.s6),
            for (final range in OrderDateRange.values)
              AppCheckOption(
                key: ValueKey(range),
                label: _label(l10n, range),
                isSelected: selected == range,
                labelStyle: optionStyle,
                onTap: () => onSelect(range),
              ),
          ],
        ),
      ),
    );
  }

  String _label(AppLocalizations l10n, OrderDateRange range) => switch (range) {
    OrderDateRange.last30Days => l10n.ordersDateLast30Days,
    OrderDateRange.last6Months => l10n.ordersDateLast6Months,
    OrderDateRange.last1Year => l10n.ordersDateLastYear,
  };
}
