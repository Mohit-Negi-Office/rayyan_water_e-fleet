import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_gradients.dart';

/// 1pt rule that fades at both ends, between the rows of a card (Figma
/// `5665:38819`). [gradient] defaults to [AppGradients.cardRule].
class GradientRule extends StatelessWidget {
  const GradientRule({this.gradient, super.key});

  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(gradient: gradient ?? AppGradients.cardRule),
      ),
    );
  }
}
