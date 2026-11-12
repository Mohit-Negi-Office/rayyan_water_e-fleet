import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';

/// Editable search box with a clear button ("Search Order", Figma
/// `5665:38791`): white, 12pt in, an 18pt navy glyph and an 8pt gap.
class AppSearchInput extends StatelessWidget {
  const AppSearchInput({
    required this.controller,
    required this.hint,
    required this.clearTooltip,
    this.highlight,
    this.onChanged,
    this.onSubmitted,
    this.autofocus = false,
    super.key,
  });

  /// 14pt above and below the 20pt line: a 48pt box.
  static const double _padV = 14;

  final TextEditingController controller;
  final String hint;

  /// Bold part of the hint (`Search "Sparkling Water"`).
  final String? highlight;
  final String clearTooltip;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    final bold = highlight;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.card),
      borderSide: BorderSide.none,
    );
    return TextField(
      controller: controller,
      autofocus: autofocus,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      textInputAction: TextInputAction.search,
      style: styles.bodyLight.copyWith(color: colors.textPrimary),
      decoration: InputDecoration(
        hint: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: bold == null ? hint : '$hint ',
                style: styles.bodyLight.copyWith(color: colors.textMuted),
              ),
              if (bold != null)
                TextSpan(
                  text: bold,
                  style: styles.priceLarge.copyWith(color: colors.brand),
                ),
            ],
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        filled: true,
        fillColor: colors.surface,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: _padV),
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: AppSpacing.s3,
            end: AppSpacing.s2,
          ),
          child: AppIcon(
            AppIcons.search,
            size: AppIconSizes.search,
            color: colors.brand,
          ),
        ),
        prefixIconConstraints: const BoxConstraints(),
        suffixIcon: ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller,
          builder: (context, value, _) => value.text.isEmpty
              ? const SizedBox.shrink()
              : IconButton(
                  tooltip: clearTooltip,
                  icon: AppIcon(
                    AppIcons.clearInput,
                    size: AppIconSizes.inline,
                    color: colors.brand,
                  ),
                  onPressed: () {
                    controller.clear();
                    onChanged?.call('');
                  },
                ),
        ),
        border: border,
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }
}
