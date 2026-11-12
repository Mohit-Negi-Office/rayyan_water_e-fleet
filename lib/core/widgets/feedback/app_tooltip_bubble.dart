import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';

/// Always-visible dark hint with a downward arrow ("Move pin to your exact
/// delivery location").
class AppTooltipBubble extends StatelessWidget {
  const AppTooltipBubble({required this.message, super.key});

  static const double _arrowWidth = 14;
  static const double _arrowHeight = 7;

  final String message;

  @override
  Widget build(BuildContext context) {
    final ink = context.colors.textPrimary;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.s3,
            vertical: AppSpacing.s2,
          ),
          decoration: BoxDecoration(
            color: ink,
            borderRadius: BorderRadius.circular(AppRadius.l),
          ),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: context.textStyles.label.copyWith(
              color: context.colors.onBrand,
            ),
          ),
        ),
        CustomPaint(
          size: const Size(_arrowWidth, _arrowHeight),
          painter: _ArrowPainter(ink),
        ),
      ],
    );
  }
}

class _ArrowPainter extends CustomPainter {
  const _ArrowPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height)
      ..close();
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_ArrowPainter oldDelegate) => oldDelegate.color != color;
}
