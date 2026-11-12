import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/theme/app_gradients.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';

/// Soft blue page backgrounds of the driver app.
enum PageWash {
  /// Diagonal wash: Home, Past Orders, Re-Assigned, Profile, Fail Delivery.
  list,

  /// Vertical wash: Order Detail, My Details, policy pages.
  detail,
}

/// Scaffold over a soft blue page wash.
class TintedScaffold extends StatelessWidget {
  const TintedScaffold({
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.wash = PageWash.list,
    super.key,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final PageWash wash;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: context.colors.surface),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: switch (wash) {
            PageWash.list => AppGradients.listWash,
            PageWash.detail => AppGradients.detailWash,
          },
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: appBar,
          body: body,
          bottomNavigationBar: bottomNavigationBar,
        ),
      ),
    );
  }
}
