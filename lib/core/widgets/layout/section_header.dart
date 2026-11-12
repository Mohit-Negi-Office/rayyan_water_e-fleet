import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_gradients.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/buttons/app_text_link.dart';

enum _HeaderStyle { regular, onBrand, bold }

/// Section title ("Easy Reorder", "What's New", "Best Sellers").
/// [SectionHeader.onBrand] is white with a fading rule, for the navy band.
/// [SectionHeader.bold] is the form-page title ("Add-ons", "Bill Summary")
/// with an optional link at the end ("View All").
class SectionHeader extends StatelessWidget {
  const SectionHeader({required this.title, super.key})
    : _style = _HeaderStyle.regular,
      actionLabel = null,
      onAction = null;

  const SectionHeader.onBrand({required this.title, super.key})
    : _style = _HeaderStyle.onBrand,
      actionLabel = null,
      onAction = null;

  const SectionHeader.bold({
    required this.title,
    this.actionLabel,
    this.onAction,
    super.key,
  }) : _style = _HeaderStyle.bold;

  static const double _ruleWidth = 72;
  static const double _ruleHeight = 1;

  final String title;
  final _HeaderStyle _style;
  final String? actionLabel;
  final VoidCallback? onAction;

  bool get isOnBrand => _style == _HeaderStyle.onBrand;

  @override
  Widget build(BuildContext context) {
    final styles = context.textStyles;
    final colors = context.colors;
    final text = Text(
      title,
      style: switch (_style) {
        _HeaderStyle.onBrand => styles.sectionTitleOnBrand.copyWith(
          color: colors.onBrand,
        ),
        _HeaderStyle.bold => styles.pageTitle.copyWith(
          color: colors.textPrimary,
        ),
        _HeaderStyle.regular => styles.sectionTitle.copyWith(
          color: colors.textPrimary,
        ),
      },
    );
    if (_style == _HeaderStyle.bold) {
      final action = actionLabel;
      return Row(
        children: [
          Expanded(child: Semantics(header: true, child: text)),
          if (action != null) AppTextLink(label: action, onPressed: onAction),
        ],
      );
    }
    if (!isOnBrand) return Semantics(header: true, child: text);
    return Semantics(
      header: true,
      child: Row(
        children: [
          Flexible(child: text),
          const SizedBox(width: AppSpacing.s2),
          SizedBox(
            width: _ruleWidth,
            height: _ruleHeight,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: AppGradients.dividerOnBrand.end,
                  end: AppGradients.dividerOnBrand.begin,
                  colors: AppGradients.dividerOnBrand.colors,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
