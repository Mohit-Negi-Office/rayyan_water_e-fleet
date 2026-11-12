import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/app/router/app_routes.dart';
import 'package:rayyan_driver/core/assets/app_images.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/utils/formatters/date_formatter.dart';
import 'package:rayyan_driver/core/widgets/layout/curved_brand_header.dart';
import 'package:rayyan_driver/core/widgets/media/app_network_image.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/current_time_cubit.dart';

/// Home header (Figma `5665:38771`): logo, "Current Time" and the driver's
/// photo, which opens Profile, on the curved navy pattern.
class HomeHeader extends StatelessWidget {
  const HomeHeader({this.avatarUrl, super.key});

  /// Measured below the status bar.
  static const double _logoTop = 20;
  static const double _timeTop = 23;
  static const double _avatarTop = 24;
  static const double _logoWidth = 70;
  static const double _logoHeight = 50;
  static const double _avatarSize = 42;

  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final top = MediaQuery.paddingOf(context).top;
    return CurvedBrandHeader(
      crest: CurvedBrandHeader.homeCrest - _figmaStatusBar + top,
      child: Stack(
        children: [
          PositionedDirectional(
            start: AppSpacing.screenGutter,
            top: top + _logoTop,
            child: Image.asset(
              AppImages.logo,
              width: _logoWidth,
              height: _logoHeight,
              fit: BoxFit.fitWidth,
              semanticLabel: l10n.appName,
            ),
          ),
          Positioned(
            top: top + _timeTop,
            left: 0,
            right: 0,
            child: const _CurrentTime(),
          ),
          PositionedDirectional(
            end: AppSpacing.screenGutter,
            top: top + _avatarTop,
            child: Semantics(
              button: true,
              label: l10n.profileTitle,
              child: GestureDetector(
                onTap: () => context.pushNamed(AppRoutes.profile.name),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.card),
                  child: ColoredBox(
                    color: colors.brandElevated,
                    child: SizedBox.square(
                      dimension: _avatarSize,
                      child: AppNetworkImage(url: avatarUrl, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Status bar height in the Figma frame; the header follows the real one.
  static const double _figmaStatusBar = 59;
}

class _CurrentTime extends StatelessWidget {
  const _CurrentTime();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    final locale = Localizations.localeOf(context).languageCode;
    final now = context.watch<CurrentTimeCubit>().state;
    return Column(
      children: [
        Text(
          context.l10n.homeCurrentTime,
          style: styles.captionLight.copyWith(color: colors.onBrand),
        ),
        const SizedBox(height: 4),
        Text(
          AppDateFormatter.time(now, locale),
          style: styles.priceLarge.copyWith(color: colors.onBrand),
        ),
      ],
    );
  }
}
