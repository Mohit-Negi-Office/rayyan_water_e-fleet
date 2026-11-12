import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';

enum _BannerTone { error, info, success, warning }

/// Inline message inside forms, sheets, or above a submit button.
class AppInlineBanner extends StatelessWidget {
  const AppInlineBanner.error({required this.message, super.key})
    : _tone = _BannerTone.error;

  // TODO(figma): `info` has no dedicated token; uses the accent strip colors.
  const AppInlineBanner.info({required this.message, super.key})
    : _tone = _BannerTone.info;

  const AppInlineBanner.success({required this.message, super.key})
    : _tone = _BannerTone.success;

  /// Amber note with dark text ("Your order is paused…").
  const AppInlineBanner.warning({required this.message, super.key})
    : _tone = _BannerTone.warning;

  final String message;
  final _BannerTone _tone;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final (icon, foreground) = switch (_tone) {
      _BannerTone.error => (AppIcons.error, colors.error),
      _BannerTone.info => (AppIcons.info, colors.brand),
      _BannerTone.success => (AppIcons.success, colors.success),
      _BannerTone.warning => (AppIcons.warning, colors.warning),
    };
    return Semantics(
      liveRegion: _tone == _BannerTone.error,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s3,
          vertical: AppSpacing.s2,
        ),
        decoration: BoxDecoration(
          color: switch (_tone) {
            _BannerTone.info => colors.accentSubtle,
            _BannerTone.warning => colors.warningSurface,
            // TODO(figma): no tint tokens for error/success backgrounds.
            _ => foreground.withValues(alpha: 0.08),
          },
          borderRadius: BorderRadius.circular(AppRadius.card),
        ),
        child: Row(
          children: [
            AppIcon(icon, size: AppIconSizes.inline, color: foreground),
            const SizedBox(width: AppSpacing.s2),
            Expanded(
              child: Text(
                message,
                style: context.textStyles.captionLight.copyWith(
                  color: _tone == _BannerTone.warning
                      ? colors.textPrimary
                      : foreground,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
