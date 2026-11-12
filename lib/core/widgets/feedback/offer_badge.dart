import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';

/// Teal ribbon tag such as "★ OUR BESTSELLER ★" with a notched end.
class OfferBadge extends StatelessWidget {
  const OfferBadge({required this.label, super.key});

  static const double _height = 22;
  static const double _notch = 8;
  static const double _starSize = 8;

  final String label;

  @override
  Widget build(BuildContext context) {
    final onBrand = context.colors.onBrand;
    final star = AppIcon(AppIcons.star, size: _starSize, color: onBrand);
    return ClipPath(
      clipper: _RibbonClipper(
        notch: _notch,
        isRtl: Directionality.of(context) == TextDirection.rtl,
      ),
      child: Container(
        height: _height,
        color: context.colors.accent,
        padding: const EdgeInsetsDirectional.only(
          start: AppSpacing.s2,
          end: AppSpacing.s2 + _notch,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            star,
            const SizedBox(width: AppSpacing.s1),
            Flexible(
              child: Text(
                label.toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textStyles.badge.copyWith(color: onBrand),
              ),
            ),
            const SizedBox(width: AppSpacing.s1),
            star,
          ],
        ),
      ),
    );
  }
}

class _RibbonClipper extends CustomClipper<Path> {
  const _RibbonClipper({required this.notch, required this.isRtl});

  final double notch;
  final bool isRtl;

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    final path = isRtl
        ? (Path()
            ..moveTo(0, 0)
            ..lineTo(w, 0)
            ..lineTo(w, h)
            ..lineTo(0, h)
            ..lineTo(notch, h / 2))
        : (Path()
            ..moveTo(0, 0)
            ..lineTo(w, 0)
            ..lineTo(w - notch, h / 2)
            ..lineTo(w, h)
            ..lineTo(0, h));
    return path..close();
  }

  @override
  bool shouldReclip(_RibbonClipper oldClipper) => oldClipper.isRtl != isRtl;
}
