import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';

/// Remote image with a neutral placeholder while loading, on error, or when
/// [url] is null. An `assets/` path (bundled sample images in mock data) is
/// drawn from the bundle instead.
class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    required this.url,
    this.fit = BoxFit.contain,
    this.semanticLabel,
    super.key,
  });

  static const String _assetPrefix = 'assets/';

  final String? url;
  final BoxFit fit;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final source = url;
    if (source != null && source.startsWith(_assetPrefix)) {
      return Image.asset(
        source,
        fit: fit,
        semanticLabel: semanticLabel,
        errorBuilder: (_, _, _) => const _Placeholder(),
      );
    }
    if (source == null || !source.startsWith('http')) {
      return const _Placeholder();
    }
    return Semantics(
      image: true,
      label: semanticLabel,
      child: CachedNetworkImage(
        imageUrl: source,
        fit: fit,
        placeholder: (_, _) => const _Placeholder(),
        errorWidget: (_, _, _) => const _Placeholder(),
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder();

  static const double _iconSize = 28;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppIcon(
        AppIcons.image,
        size: _iconSize,
        color: context.colors.textMuted,
      ),
    );
  }
}
