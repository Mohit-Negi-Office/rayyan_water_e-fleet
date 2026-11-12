import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';

/// Tappable search box that opens the search screen.
/// Hint reads: [hint] + optional bold [highlight] (`Search "Sparkling
/// Water"`).
class AppSearchField extends StatelessWidget {
  const AppSearchField({
    required this.hint,
    required this.onTap,
    this.highlight,
    super.key,
  });

  static const double _verticalPadding = 14;

  final String hint;
  final String? highlight;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    return Semantics(
      button: true,
      textField: true,
      label: [hint, ?highlight].join(' '),
      child: Material(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: InkWell(
          borderRadius: BorderRadius.circular(AppRadius.card),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.s3,
              vertical: _verticalPadding,
            ),
            child: Row(
              children: [
                AppIcon(
                  AppIcons.search,
                  size: AppIconSizes.search,
                  color: colors.brand,
                ),
                const SizedBox(width: AppSpacing.s2),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: highlight == null ? hint : '$hint ',
                          style: styles.bodyLight.copyWith(
                            color: colors.textMuted,
                          ),
                        ),
                        TextSpan(
                          text: highlight,
                          style: styles.priceLarge.copyWith(
                            color: colors.brand,
                          ),
                        ),
                      ],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
