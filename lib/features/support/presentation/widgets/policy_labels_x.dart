import 'package:flutter/widgets.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/features/support/domain/entities/policy_document.dart';

extension PolicyLabelsX on BuildContext {
  String policyTitle(PolicyType type) => switch (type) {
    PolicyType.aboutUs => l10n.policyAboutUs,
    PolicyType.terms => l10n.policyTerms,
    PolicyType.privacy => l10n.policyPrivacy,
  };
}
