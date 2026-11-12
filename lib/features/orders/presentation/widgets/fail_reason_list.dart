import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/l10n/generated/app_localizations.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/inputs/app_text_area.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';
import 'package:rayyan_driver/features/orders/domain/entities/fail_reason.dart';

extension FailReasonUi on FailReason {
  String label(AppLocalizations l10n) => switch (this) {
    FailReason.customerNotAvailable => l10n.failReasonCustomerNotAvailable,
    FailReason.wrongAddress => l10n.failReasonWrongAddress,
    FailReason.accessDenied => l10n.failReasonAccessDenied,
    FailReason.packageDamaged => l10n.failReasonPackageDamaged,
    FailReason.refusedDelivery => l10n.failReasonRefused,
    FailReason.other => l10n.failReasonOther,
  };
}

/// The reasons as radio cards; "Others" opens a box for the reason
/// (Figma `5691:36926`).
class FailReasonList extends StatelessWidget {
  const FailReasonList({
    required this.selected,
    required this.onSelected,
    required this.onNoteChanged,
    super.key,
  });

  static const double _gap = 14;

  final FailReason? selected;
  final ValueChanged<FailReason> onSelected;
  final ValueChanged<String> onNoteChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final (i, reason) in FailReason.values.indexed) ...[
          if (i > 0) const SizedBox(height: _gap),
          _ReasonCard(
            reason: reason,
            isSelected: reason == selected,
            onTap: () => onSelected(reason),
            onNoteChanged: onNoteChanged,
          ),
        ],
      ],
    );
  }
}

class _ReasonCard extends StatelessWidget {
  const _ReasonCard({
    required this.reason,
    required this.isSelected,
    required this.onTap,
    required this.onNoteChanged,
  });

  static const double _noteHeight = 130;
  static const double _noteGap = 10;
  static const double _inline = 14;

  final FailReason reason;
  final bool isSelected;
  final VoidCallback onTap;
  final ValueChanged<String> onNoteChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final radius = BorderRadius.circular(AppRadius.card);
    final showNote = isSelected && reason == FailReason.other;
    return Material(
      color: colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: radius,
        side: BorderSide(color: colors.hairline),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: _inline,
          vertical: AppSpacing.s4,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(
              inMutuallyExclusiveGroup: true,
              selected: isSelected,
              button: true,
              child: InkWell(
                borderRadius: radius,
                onTap: onTap,
                child: Row(
                  children: [
                    AppIcon(
                      isSelected ? AppIcons.radioOn : AppIcons.radioOff,
                      size: AppIconSizes.header,
                      tint: false,
                    ),
                    const SizedBox(width: AppSpacing.s2),
                    Expanded(
                      child: Text(
                        reason.label(context.l10n),
                        style: context.textStyles.bodyLightAuto.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (showNote) ...[
              const SizedBox(height: _noteGap),
              AppTextArea(
                hint: context.l10n.failReasonHint,
                height: _noteHeight,
                onChanged: onNoteChanged,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
