import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_network_image.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/detail_section.dart';

/// "This will help you reach faster!": photos the customer added of the
/// place (Figma `5000:100197`), side by side, scrolling past two.
class LocationPhotos extends StatelessWidget {
  const LocationPhotos({required this.urls, super.key});

  static const double _height = 128;
  static const double _gap = AppSpacing.s4;

  final List<String> urls;

  @override
  Widget build(BuildContext context) {
    return DetailSection(
      title: context.l10n.orderLocationPhotos,
      child: SizedBox(
        height: _height,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = (constraints.maxWidth - _gap) / 2;
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: urls.length,
              separatorBuilder: (_, _) => const SizedBox(width: _gap),
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.sheet),
                child: ColoredBox(
                  color: context.colors.surface,
                  child: SizedBox(
                    width: width,
                    child: AppNetworkImage(url: urls[index], fit: BoxFit.cover),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
