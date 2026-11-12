import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_shadows.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';

/// Page indicator: active / inactive dots in a white pill.
class CarouselDots extends StatelessWidget {
  const CarouselDots({required this.count, required this.index, super.key});

  static const double _dot = 6;
  static const double _gap = 6;

  final int count;
  final int index;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < count; i++)
            Padding(
              padding: EdgeInsetsDirectional.only(start: i == 0 ? 0 : _gap),
              child: Container(
                width: _dot,
                height: _dot,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: i == index ? colors.brand : colors.cardBorder,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
