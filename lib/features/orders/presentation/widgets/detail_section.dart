import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';

/// Section of the order detail: a 16pt title, then [child] 16pt below
/// ("Delivery Location", "Customer Detail", "Special Instruction").
class DetailSection extends StatelessWidget {
  const DetailSection({required this.title, required this.child, super.key});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: context.textStyles.pageTitle.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.s4),
        child,
      ],
    );
  }
}

/// White 12pt-round card with 14pt padding; tappable when [onTap] is set
/// (announced as [tapLabel]).
class DetailCard extends StatelessWidget {
  const DetailCard({required this.child, this.onTap, this.tapLabel, super.key});

  static const double padding = 14;

  final Widget child;
  final VoidCallback? onTap;
  final String? tapLabel;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(AppRadius.card);
    final content = Padding(
      padding: const EdgeInsets.all(padding),
      child: child,
    );
    final onTap = this.onTap;
    return Material(
      color: context.colors.surface,
      borderRadius: radius,
      child: onTap == null
          ? content
          : Semantics(
              button: true,
              hint: tapLabel,
              child: InkWell(
                borderRadius: radius,
                onTap: onTap,
                child: content,
              ),
            ),
    );
  }
}

/// Row inside a [DetailCard]: text, and an optional [action] at the end.
class DetailRow extends StatelessWidget {
  const DetailRow({required this.child, this.action, super.key});

  final Widget child;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final action = this.action;
    return Row(
      children: [
        Expanded(child: child),
        if (action != null) ...[const SizedBox(width: AppSpacing.s2), action],
      ],
    );
  }
}
