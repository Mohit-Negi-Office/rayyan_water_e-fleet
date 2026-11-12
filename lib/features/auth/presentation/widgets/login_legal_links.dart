import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/app/router/app_routes.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/buttons/app_text_link.dart';
import 'package:rayyan_driver/features/support/domain/entities/policy_document.dart';

/// "Terms & Conditions" and "Privacy & Policies" under the login form
/// (Figma `5000:98322`).
class LoginLegalLinks extends StatelessWidget {
  const LoginLegalLinks({super.key});

  void _open(BuildContext context, PolicyType type) => context.pushNamed(
    AppRoutes.policy.name,
    pathParameters: {AppRoutes.typeParam: type.name},
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final style = context.textStyles.cardTitle;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppTextLink(
          label: l10n.policyTerms,
          style: style,
          onPressed: () => _open(context, PolicyType.terms),
        ),
        const SizedBox(width: AppSpacing.s10),
        AppTextLink(
          label: l10n.profilePrivacyPolicies,
          style: style,
          onPressed: () => _open(context, PolicyType.privacy),
        ),
      ],
    );
  }
}
