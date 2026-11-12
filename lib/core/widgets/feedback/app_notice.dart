import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';

enum _NoticeTone { info, error }

/// Tinted one-line notice without an icon ("Product price changed to
/// QAR 90", "This product is no longer available").
class AppNotice extends StatelessWidget {
  const AppNotice.info(this.message, {super.key}) : _tone = _NoticeTone.info;

  const AppNotice.error(this.message, {super.key}) : _tone = _NoticeTone.error;

  final String message;
  final _NoticeTone _tone;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final (background, foreground) = switch (_tone) {
      _NoticeTone.info => (colors.infoSurface, colors.brand),
      _NoticeTone.error => (colors.errorSurface, colors.error),
    };
    return Semantics(
      liveRegion: true,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s3,
          vertical: AppSpacing.s2,
        ),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(AppRadius.l),
        ),
        child: Text(
          message,
          style: context.textStyles.cardTitle.copyWith(color: foreground),
        ),
      ),
    );
  }
}
