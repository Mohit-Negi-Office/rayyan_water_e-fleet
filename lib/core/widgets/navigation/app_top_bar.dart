import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';

/// Screen app bar: boxed back button (shown when the router can pop),
/// centred title and optional actions, each side [AppSpacing.screenGutter]
/// in from the edge. Transparent so the page background shows through, as
/// in Figma.
class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({
    required this.title,
    this.actions = const [],
    this.backgroundColor,
    this.leading,
    this.backStyle = AppBarIconStyle.frosted,
    super.key,
  });

  /// Measured: the 48pt box sits this far below the status bar, with the
  /// same room under it.
  static const double _boxInset = 20;

  /// Title is centred on the box.
  static const double height = AppBarIconButton.size + 2 * _boxInset;

  final String title;
  final List<Widget> actions;
  final Color? backgroundColor;

  /// Replaces the default back button (e.g. one that asks first).
  final Widget? leading;

  /// Fill of the default back button.
  final AppBarIconStyle backStyle;

  @override
  Size get preferredSize => const Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final canPop = GoRouter.maybeOf(context)?.canPop() ?? false;
    final background = backgroundColor ?? Colors.transparent;
    final leading =
        this.leading ?? (canPop ? AppBackButton(style: backStyle) : null);
    return AppBar(
      backgroundColor: background,
      surfaceTintColor: background,
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: height,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leadingWidth: AppSpacing.screenGutter + AppBarIconButton.size,
      leading: leading == null
          ? null
          : Padding(
              padding: const EdgeInsetsDirectional.only(
                start: AppSpacing.screenGutter,
              ),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: leading,
              ),
            ),
      title: Text(
        title,
        style: context.textStyles.pageTitle.copyWith(
          color: context.colors.textPrimary,
        ),
      ),
      actions: actions.isEmpty
          ? null
          : [
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  end: AppSpacing.screenGutter,
                ),
                child: Center(
                  child: Row(mainAxisSize: MainAxisSize.min, children: actions),
                ),
              ),
            ],
    );
  }
}

/// Fill of [AppBarIconButton].
enum AppBarIconStyle {
  /// Frosted white over a tinted page (Order Detail, My Details).
  frosted,

  /// Navy box on the login header.
  onBrand,

  /// Solid light grey box (Past Orders, Re-Assigned).
  filled,
}

/// 48pt box with a 20pt icon: the back button, and icon actions on the
/// other side of [AppTopBar].
class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.style = AppBarIconStyle.frosted,
    this.matchTextDirection = false,
    super.key,
  });

  static const double size = 48;

  /// White over the page, lighter at the bottom end (measured).
  static const double _fillFrom = 0.35;
  static const double _fillTo = 0.6;
  static const double _borderAlpha = 0.8;
  static const double _borderWidth = 1;

  final String icon;
  final String tooltip;
  final VoidCallback? onPressed;
  final AppBarIconStyle style;

  /// Mirror the glyph in RTL (directional arrows).
  final bool matchTextDirection;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final white = colors.surface;
    final radius = BorderRadius.circular(AppRadius.card);
    return Tooltip(
      message: tooltip,
      child: Semantics(
        button: true,
        label: tooltip,
        excludeSemantics: true,
        child: DecoratedBox(
          decoration: switch (style) {
            AppBarIconStyle.onBrand => BoxDecoration(
              color: colors.brandElevated,
              borderRadius: radius,
            ),
            AppBarIconStyle.filled => BoxDecoration(
              color: colors.chipFill,
              borderRadius: radius,
            ),
            AppBarIconStyle.frosted => BoxDecoration(
              borderRadius: radius,
              gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [
                  white.withValues(alpha: _fillFrom),
                  white.withValues(alpha: _fillTo),
                ],
              ),
              border: Border.all(
                color: white.withValues(alpha: _borderAlpha),
                width: _borderWidth,
              ),
            ),
          },
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              borderRadius: radius,
              onTap: onPressed,
              child: SizedBox.square(
                dimension: size,
                child: AppIcon(
                  icon,
                  size: AppIconSizes.back,
                  matchTextDirection: matchTextDirection,
                  color: style == AppBarIconStyle.onBrand
                      ? colors.onBrand
                      : colors.iconPrimary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Boxed back arrow, mirrored in RTL. [onPressed] defaults to
/// `context.pop`.
class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.onPressed,
    this.style = AppBarIconStyle.frosted,
  });

  /// The navy box on the login header.
  const AppBackButton.onBrand({super.key, this.onPressed})
    : style = AppBarIconStyle.onBrand;

  final AppBarIconStyle style;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBarIconButton(
      icon: AppIcons.back,
      tooltip: context.l10n.commonBack,
      style: style,
      matchTextDirection: true,
      onPressed: onPressed ?? context.pop,
    );
  }
}
