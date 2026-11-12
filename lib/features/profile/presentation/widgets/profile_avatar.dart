import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_network_image.dart';

/// Round driver photo; [ring] adds the white 2pt ring of the Profile
/// header (Figma `5000:105348`).
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    required this.url,
    required this.size,
    this.ring = 0,
    super.key,
  });

  /// Profile header: 80pt in an 84pt ring. My Details: 100pt, no ring.
  static const double headerSize = 80;
  static const double headerRing = 2;
  static const double detailsSize = 100;

  final String? url;
  final double size;
  final double ring;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size + 2 * ring,
      height: size + 2 * ring,
      padding: EdgeInsets.all(ring),
      decoration: BoxDecoration(
        color: context.colors.surface,
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: AppNetworkImage(url: url, fit: BoxFit.cover),
      ),
    );
  }
}

/// Name over the driver ID ("Ahmed Mirza / AD16426").
class ProfileNameBlock extends StatelessWidget {
  const ProfileNameBlock({required this.name, required this.code, super.key});

  final String name;
  final String code;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    return Column(
      children: [
        Text(
          name,
          textAlign: TextAlign.center,
          style: styles.pageTitle.copyWith(color: colors.textPrimary),
        ),
        const SizedBox(height: 2),
        Text(
          code,
          textAlign: TextAlign.center,
          style: styles.bodyLightAuto.copyWith(color: colors.textSecondary),
        ),
      ],
    );
  }
}
