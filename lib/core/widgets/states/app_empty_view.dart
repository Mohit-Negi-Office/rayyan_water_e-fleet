import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';
import 'package:rayyan_driver/core/widgets/states/app_state_layout.dart';

/// Empty state: illustration, title, message and optional action.
class AppEmptyView extends StatelessWidget {
  const AppEmptyView({
    required this.title,
    this.message,
    this.illustration,
    this.action,
    super.key,
  });

  final String title;
  final String? message;

  /// Figma illustration; defaults to a neutral icon until assets are exported.
  final Widget? illustration;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return AppStateLayout(
      illustration:
          illustration ??
          AppIcon(
            AppIcons.empty,
            size: AppIconSizes.state,
            color: context.colors.iconSecondary,
          ),
      title: title,
      message: message,
      action: action,
    );
  }
}
