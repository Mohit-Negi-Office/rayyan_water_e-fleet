import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';

/// Visual variants of [AppButton].
enum AppButtonVariant {
  primary,
  outline,
  text,
  danger,

  /// White with a light grey outline and dark label (Google / Apple).
  neutral,

  /// White with a navy label, on a navy header ("Login/Sign Up").
  light,

  /// Red outline and label ("Skip & Delete").
  dangerOutline,
}

/// Sizes of [AppButton]. `large` is the full-width 56pt call to action;
/// `compact` is a 32pt button inside a card ("Remove") that still has a
/// 48pt tap area.
enum AppButtonSize { compact, regular, large }

/// The one button used across the app.
class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.regular,
    this.isLoading = false,
    this.isExpanded = false,
    this.leadingIcon,
    this.leading,
    this.trailingIcon,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final bool isLoading;
  final bool isExpanded;
  final String? leadingIcon;

  /// Any leading mark (a brand logo); wins over [leadingIcon].
  final Widget? leading;

  /// Icon after the label ("Checkout →"), mirrored in RTL.
  final String? trailingIcon;

  @override
  Widget build(BuildContext context) {
    final onTap = isLoading ? null : onPressed;
    final child = _ButtonContent(
      label: label,
      leadingIcon: leadingIcon,
      leading: leading,
      trailingIcon: trailingIcon,
      isLoading: isLoading,
      variant: variant,
      iconSize: switch (size) {
        AppButtonSize.large => AppIconSizes.button,
        AppButtonSize.compact => AppIconSizes.inline,
        _ => AppIconSizes.header,
      },
    );
    final sizeStyle = _sizeStyle(context);
    final button = switch (variant) {
      AppButtonVariant.primary => ElevatedButton(
        onPressed: onTap,
        style: sizeStyle,
        child: child,
      ),
      AppButtonVariant.danger => ElevatedButton(
        onPressed: onTap,
        style: _sized(
          sizeStyle,
          ElevatedButton.styleFrom(
            backgroundColor: context.colors.dangerStrong,
            foregroundColor: context.colors.onBrand,
          ),
        ),
        child: child,
      ),
      AppButtonVariant.outline => OutlinedButton(
        onPressed: onTap,
        style: sizeStyle,
        child: child,
      ),
      AppButtonVariant.neutral => OutlinedButton(
        onPressed: onTap,
        style: _sized(
          sizeStyle,
          OutlinedButton.styleFrom(
            foregroundColor: context.colors.textPrimary,
            backgroundColor: context.colors.surface,
            side: BorderSide(color: context.colors.inputBorder),
          ),
        ),
        child: child,
      ),
      AppButtonVariant.light => ElevatedButton(
        onPressed: onTap,
        style: _sized(
          sizeStyle,
          ElevatedButton.styleFrom(
            backgroundColor: context.colors.surface,
            foregroundColor: context.colors.brand,
          ),
        ),
        child: child,
      ),
      AppButtonVariant.dangerOutline => OutlinedButton(
        onPressed: onTap,
        style: _sized(
          sizeStyle,
          OutlinedButton.styleFrom(
            foregroundColor: context.colors.error,
            side: BorderSide(color: context.colors.error),
          ),
        ),
        child: child,
      ),
      AppButtonVariant.text => TextButton(onPressed: onTap, child: child),
    };
    return isExpanded
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }

  /// The size style wins so a coloured variant keeps its size's text.
  static ButtonStyle _sized(ButtonStyle? size, ButtonStyle colors) =>
      size?.merge(colors) ?? colors;

  static const double _largeHeight = 56;

  static const double _compactHeight = 32;

  ButtonStyle? _sizeStyle(BuildContext context) => switch (size) {
    AppButtonSize.regular => null,
    AppButtonSize.compact => ButtonStyle(
      minimumSize: const WidgetStatePropertyAll(Size(0, _compactHeight)),
      tapTargetSize: MaterialTapTargetSize.padded,
      textStyle: WidgetStatePropertyAll(context.textStyles.priceSmall),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: AppSpacing.s4),
      ),
    ),
    AppButtonSize.large => ButtonStyle(
      minimumSize: const WidgetStatePropertyAll(Size.fromHeight(_largeHeight)),
      textStyle: WidgetStatePropertyAll(context.textStyles.buttonLarge),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.card),
        ),
      ),
    ),
  };
}

class _ButtonContent extends StatelessWidget {
  const _ButtonContent({
    required this.label,
    required this.leadingIcon,
    required this.leading,
    required this.trailingIcon,
    required this.isLoading,
    required this.variant,
    required this.iconSize,
  });

  final String label;
  final String? leadingIcon;
  final Widget? leading;
  final String? trailingIcon;
  final bool isLoading;
  final AppButtonVariant variant;

  /// Figma: 24 on large buttons, 20 regular, 16 compact.
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      final isFilled =
          variant == AppButtonVariant.primary ||
          variant == AppButtonVariant.danger;
      return SizedBox.square(
        dimension: AppSpacing.s4,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: isFilled ? context.colors.onBrand : context.colors.brand,
        ),
      );
    }
    final trailing = trailingIcon;
    if (trailing != null) {
      final isRtl = Directionality.of(context) == TextDirection.rtl;
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: Text(label)),
          const SizedBox(width: AppSpacing.s3),
          Transform.flip(
            flipX: isRtl,
            child: AppIcon(trailing, size: iconSize),
          ),
        ],
      );
    }
    final mark = leading;
    if (mark != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          mark,
          const SizedBox(width: AppSpacing.s3),
          Flexible(child: Text(label)),
        ],
      );
    }
    final icon = leadingIcon;
    if (icon == null) return Text(label);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppIcon(icon, size: iconSize),
        const SizedBox(width: AppSpacing.s2),
        Flexible(child: Text(label)),
      ],
    );
  }
}
