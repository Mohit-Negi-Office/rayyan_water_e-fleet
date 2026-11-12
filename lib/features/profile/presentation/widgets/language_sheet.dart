import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/core/assets/app_svgs.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/buttons/app_button.dart';
import 'package:rayyan_driver/core/widgets/overlays/app_bottom_sheet.dart';
import 'package:rayyan_driver/core/widgets/selection/app_option_row.dart';
import 'package:rayyan_driver/features/onboarding/domain/entities/app_language.dart';

/// Round flag for a language (UK for English, Qatar for Arabic).
class LanguageFlag extends StatelessWidget {
  const LanguageFlag(this.language, {super.key});

  /// Figma `5000:105499`.
  static const double size = 22;

  final AppLanguage language;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    switch (language) {
      AppLanguage.english => AppSvgs.flagUk,
      AppLanguage.arabic => AppSvgs.flagQatar,
    },
    width: size,
    height: size,
    excludeFromSemantics: true,
  );
}

/// "Change Language": English / عربي. Confirm turns on once another
/// language is picked; resolves to it, or null. Owns the choice in a
/// [ValueNotifier] (no setState).
class LanguageSheet extends StatefulWidget {
  const LanguageSheet({required this.current, super.key});

  final AppLanguage current;

  static Future<AppLanguage?> show(
    BuildContext context, {
    required AppLanguage current,
  }) => showAppBottomSheet<AppLanguage>(
    context: context,
    builder: (_) => LanguageSheet(current: current),
  );

  @override
  State<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  late final ValueNotifier<AppLanguage> _choice = ValueNotifier(widget.current);

  @override
  void dispose() {
    _choice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    String name(AppLanguage l) => switch (l) {
      AppLanguage.english => l10n.languageNativeEnglish,
      AppLanguage.arabic => l10n.languageNativeArabic,
    };
    return ValueListenableBuilder<AppLanguage>(
      valueListenable: _choice,
      builder: (context, choice, _) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.profileChangeLanguageTitle,
            style: context.textStyles.pageTitle.copyWith(
              color: context.colors.textPrimary,
            ),
          ),
          for (final language in AppLanguage.values) ...[
            const SizedBox(height: AppSpacing.s3),
            AppOptionRow(
              leading: LanguageFlag(language),
              label: name(language),
              isSelected: language == choice,
              onTap: () => _choice.value = language,
            ),
          ],
          const SizedBox(height: AppSpacing.s4),
          AppButton(
            label: l10n.commonConfirm,
            size: AppButtonSize.large,
            isExpanded: true,
            onPressed: choice == widget.current
                ? null
                : () => context.pop(choice),
          ),
        ],
      ),
    );
  }
}
