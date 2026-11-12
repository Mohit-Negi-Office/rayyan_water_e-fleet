import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/app/locale/locale_cubit.dart';
import 'package:rayyan_driver/app/locale/locale_state_x.dart';
import 'package:rayyan_driver/app/router/app_routes.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';
import 'package:rayyan_driver/features/onboarding/domain/entities/app_language.dart';
import 'package:rayyan_driver/features/profile/presentation/widgets/language_sheet.dart';
import 'package:rayyan_driver/features/profile/presentation/widgets/profile_tile.dart';
import 'package:rayyan_driver/features/support/domain/entities/policy_document.dart';

/// Profile rows (Figma `5000:105303`, language row from `5000:105493`):
/// My Details, Change language, then Support & More.
class ProfileMenu extends StatelessWidget {
  const ProfileMenu({required this.onLogout, super.key});

  final VoidCallback onLogout;

  void _policy(BuildContext context, PolicyType type) => context.pushNamed(
    AppRoutes.policy.name,
    pathParameters: {AppRoutes.typeParam: type.name},
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    const gap = SizedBox(height: AppSpacing.s4);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ProfileTile(
          icon: AppIcons.user,
          label: l10n.profileMyDetails,
          onTap: () => context.pushNamed(AppRoutes.myDetails.name),
        ),
        gap,
        const _LanguageTile(),
        gap,
        Text(
          l10n.profileSupportMore,
          style: context.textStyles.pageTitle.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
        gap,
        ProfileTile(
          icon: AppIcons.terms,
          label: l10n.policyTerms,
          onTap: () => _policy(context, PolicyType.terms),
        ),
        gap,
        ProfileTile(
          icon: AppIcons.privacy,
          label: l10n.profilePrivacyPolicies,
          onTap: () => _policy(context, PolicyType.privacy),
        ),
        gap,
        ProfileTile(
          icon: AppIcons.termsPolicy,
          label: l10n.faqsTitle,
          onTap: () => context.pushNamed(AppRoutes.faqs.name),
        ),
        gap,
        ProfileTile(
          icon: AppIcons.logout,
          iconColor: context.colors.error,
          label: l10n.profileLogout,
          onTap: onLogout,
        ),
      ],
    );
  }
}

class _LanguageTile extends StatelessWidget {
  const _LanguageTile();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final selected = context.select((LocaleCubit c) => c.state.languageOrNull);
    final current =
        selected ??
        AppLanguage.fromCode(Localizations.localeOf(context).languageCode) ??
        AppLanguage.english;
    return ProfileTile(
      icon: AppIcons.language,
      label: l10n.profileChangeLanguage,
      onTap: () async {
        final cubit = context.read<LocaleCubit>();
        final picked = await LanguageSheet.show(context, current: current);
        if (picked != null) await cubit.change(picked);
      },
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          LanguageFlag(current),
          const SizedBox(width: AppSpacing.s2),
          Text(switch (current) {
            AppLanguage.english => l10n.profileLanguageShortEn,
            AppLanguage.arabic => l10n.profileLanguageShortAr,
          }, style: context.textStyles.pageTitle.copyWith(color: colors.brand)),
          const SizedBox(width: AppSpacing.s2),
          AppIcon(
            AppIcons.chevronDown,
            size: AppIconSizes.header,
            color: colors.iconPrimary,
          ),
        ],
      ),
    );
  }
}
