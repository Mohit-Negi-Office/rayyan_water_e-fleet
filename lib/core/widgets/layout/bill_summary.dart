import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_shadows.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';

/// One "label … amount" line of a bill.
class BillRow {
  const BillRow({
    required this.label,
    required this.value,
    this.isHighlighted = false,
  });

  final String label;
  final String value;

  /// Teal amount ("Points Redeemed - QAR 25.00").
  final bool isHighlighted;
}

/// "Order Summary" / "Bill Summary" card: groups of rows separated by thin
/// rules, then the bold total. Shared by cart and checkout.
class BillSummaryCard extends StatelessWidget {
  const BillSummaryCard({
    required this.groups,
    required this.total,
    this.note,
    this.isExpanded,
    this.onToggle,
    this.toggleLabel,
    this.footer,
    super.key,
  });

  final List<List<BillRow>> groups;
  final BillRow total;

  /// Blue line at the top ("Pay for your recent delivery now…").
  final String? note;

  /// When set, the total gets a chevron that calls [onToggle]; the caller
  /// passes fewer [groups] while collapsed.
  final bool? isExpanded;
  final VoidCallback? onToggle;

  /// Screen-reader label of the chevron.
  final String? toggleLabel;

  /// Under the total ("Points Earned + QAR 10.00").
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    final rowStyle = styles.subtitleLight.copyWith(color: colors.textTertiary);
    final note = this.note;
    final children = <Widget>[
      if (note != null)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.s2),
          child: Text(
            note,
            style: styles.captionLight.copyWith(color: colors.brand),
          ),
        ),
    ];
    for (final group in groups.where((g) => g.isNotEmpty)) {
      for (final row in group) {
        children.add(
          _Line(
            row: row,
            labelStyle: rowStyle,
            valueStyle: row.isHighlighted
                ? rowStyle.copyWith(color: colors.accent)
                : rowStyle,
          ),
        );
      }
      children.add(const _Rule());
    }
    final expanded = isExpanded;
    final totalLine = _Line(
      row: total,
      labelStyle: styles.pageTitle.copyWith(color: colors.textPrimary),
      valueStyle: styles.priceMedium.copyWith(color: colors.accent),
      trailing: expanded == null
          ? null
          : AppIcon(
              expanded ? AppIcons.chevronUp : AppIcons.chevronDown,
              size: AppIconSizes.header,
              color: colors.brand,
            ),
    );
    children.add(
      onToggle == null
          ? totalLine
          : Semantics(
              button: true,
              label: toggleLabel,
              child: InkWell(onTap: onToggle, child: totalLine),
            ),
    );
    final footer = this.footer;
    if (footer != null) {
      children.add(
        Padding(
          padding: const EdgeInsets.only(
            top: AppSpacing.s1,
            bottom: AppSpacing.s2,
          ),
          child: footer,
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s3,
        vertical: AppSpacing.s2,
      ),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}

class _Line extends StatelessWidget {
  const _Line({
    required this.row,
    required this.labelStyle,
    required this.valueStyle,
    this.trailing,
  });

  final BillRow row;
  final TextStyle labelStyle;
  final TextStyle valueStyle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.s2),
      child: Row(
        children: [
          Expanded(child: Text(row.label, style: labelStyle)),
          const SizedBox(width: AppSpacing.s3),
          Text(row.value, style: valueStyle, textDirection: TextDirection.ltr),
          if (trailing != null) ...[
            const SizedBox(width: AppSpacing.s2),
            trailing!,
          ],
        ],
      ),
    );
  }
}

class _Rule extends StatelessWidget {
  const _Rule();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.s2),
      child: Divider(
        height: 1,
        thickness: 1,
        color: context.colors.inputBorder,
      ),
    );
  }
}
