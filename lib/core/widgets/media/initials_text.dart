import 'package:flutter/material.dart';

import 'package:rayyan_driver/core/utils/name_initials.dart';

/// The driver's initials, centred, for an empty profile photo.
class InitialsText extends StatelessWidget {
  const InitialsText({required this.name, required this.style, super.key});

  final String name;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        NameInitials.from(name),
        textAlign: TextAlign.center,
        style: style,
      ),
    );
  }
}
