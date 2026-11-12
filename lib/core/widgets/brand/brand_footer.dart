import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_gradients.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/brand/rayyan_logo.dart';
import 'package:rayyan_driver/core/widgets/layout/labeled_divider.dart';

/// Logo, "Pure by Nature, Perfect by Source." and "From The Heart Of Qatar".
class BrandFooter extends StatelessWidget {
  const BrandFooter({super.key});

  static const double _ruleMaxWidth = 80;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final brand = context.colors.brand;
    return Column(
      children: [
        const RayyanLogo(),
        const SizedBox(height: AppSpacing.s4),
        Text(
          l10n.homeFooterTagline,
          textAlign: TextAlign.center,
          style: context.textStyles.bodyLight.copyWith(color: brand),
        ),
        const SizedBox(height: AppSpacing.s6),
        LabeledDivider(
          gradient: AppGradients.dividerBrand,
          ruleMaxWidth: _ruleMaxWidth,
          label: Text(
            l10n.homeFooterOrigin,
            style: context.textStyles.captionLight.copyWith(color: brand),
          ),
        ),
      ],
    );
  }
}
