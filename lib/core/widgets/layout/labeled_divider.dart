import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';

/// A label with faded rules on both sides ("Choose language",
/// "From The Heart Of Qatar"). [gradient] runs from the outer edge to the
/// label; the trailing rule mirrors it.
class LabeledDivider extends StatelessWidget {
  const LabeledDivider({
    required this.label,
    required this.gradient,
    this.ruleMaxWidth = double.infinity,
    this.labelFlex = 4,
    super.key,
  });

  final Widget label;
  final LinearGradient gradient;

  /// Caps each rule's length so short labels don't get very long rules.
  final double ruleMaxWidth;

  /// Share of the row the label may take against 1 per rule; lower gives
  /// longer rules ("Or Login With" uses 2).
  final int labelFlex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: _Rule(gradient: gradient, maxWidth: ruleMaxWidth),
        ),
        // Long labels (large text) take the room the rules would use.
        Flexible(
          flex: labelFlex,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s4),
            child: label,
          ),
        ),
        Flexible(
          child: _Rule(
            gradient: LinearGradient(
              begin: gradient.end,
              end: gradient.begin,
              colors: gradient.colors,
            ),
            maxWidth: ruleMaxWidth,
          ),
        ),
      ],
    );
  }
}

class _Rule extends StatelessWidget {
  const _Rule({required this.gradient, required this.maxWidth});

  static const double _thickness = 1;

  final LinearGradient gradient;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: SizedBox(
        height: _thickness,
        width: double.infinity,
        child: DecoratedBox(decoration: BoxDecoration(gradient: gradient)),
      ),
    );
  }
}
