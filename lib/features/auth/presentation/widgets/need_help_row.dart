import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/network/app_config.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/utils/external_links.dart';

/// "Need Help? Contact Us" under the login form (Figma `5000:98322`):
/// calls fleet support.
class NeedHelpRow extends StatelessWidget {
  const NeedHelpRow({super.key});

  /// Figma gap between the two words.
  static const double _gap = 5;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final styles = context.textStyles;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          l10n.authNeedHelp,
          style: styles.bodyLight.copyWith(color: colors.textSecondary),
        ),
        const SizedBox(width: _gap),
        Semantics(
          link: true,
          child: GestureDetector(
            onTap: () => ExternalLinks.call(AppConfig.supportPhone),
            child: Text(
              l10n.authContactUs,
              style: styles.cardTitle.copyWith(color: colors.brand),
            ),
          ),
        ),
      ],
    );
  }
}
