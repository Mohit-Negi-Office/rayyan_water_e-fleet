import 'package:flutter/material.dart';

/// Flies the driver photo from the Home header to the Profile header.
///
/// Both photos use [tag]. The route transition moves one image between
/// those two slots, including when the back gesture drags the page.
class DriverPhotoHero extends StatelessWidget {
  const DriverPhotoHero({required this.child, super.key});

  /// Shared by every photo that takes part in this flight.
  static const String tag = 'driver-profile-photo';

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      transitionOnUserGestures: true,
      // Straight move and scale, so the square photo stays square.
      createRectTween: (begin, end) => RectTween(begin: begin, end: end),
      child: Material(type: MaterialType.transparency, child: child),
    );
  }
}
