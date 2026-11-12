import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';

/// One option of [AppSegmentedTabs].
class AppSegment<T> {
  const AppSegment({required this.value, required this.label});

  final T value;
  final String label;
}

/// Equal-width single-choice buttons ("One Time" / "Recurring"): the
/// chosen one navy, the others grey.
class AppSegmentedTabs<T> extends StatelessWidget {
  const AppSegmentedTabs({
    required this.segments,
    required this.selected,
    required this.onSelected,
    this.isOnPage = false,
    super.key,
  });

  static const double _height = 48;

  /// Idle buttons white with light text, on a tinted page ("Frequency",
  /// Figma `5594:144216`); grey otherwise.
  final bool isOnPage;

  final List<AppSegment<T>> segments;
  final T selected;
  final ValueChanged<T> onSelected;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    final radius = BorderRadius.circular(AppRadius.card);
    return Row(
      children: [
        for (var i = 0; i < segments.length; i++) ...[
          if (i > 0) const SizedBox(width: AppSpacing.s3),
          Expanded(
            child: Semantics(
              selected: segments[i].value == selected,
              button: true,
              child: Material(
                color: segments[i].value == selected
                    ? colors.brand
                    : isOnPage
                    ? colors.surface
                    : colors.background,
                borderRadius: radius,
                child: InkWell(
                  borderRadius: radius,
                  onTap: () => onSelected(segments[i].value),
                  child: SizedBox(
                    height: _height,
                    child: Center(
                      child: Text(
                        segments[i].label,
                        style: segments[i].value == selected
                            ? styles.cardTitle.copyWith(color: colors.onBrand)
                            : (isOnPage ? styles.bodyLight : styles.cardTitle)
                                  .copyWith(color: colors.textPrimary),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
