import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';

/// Opens [builder] in the app's sheet frame over a dimmed, blurred page.
/// Sheets are overlays, not routes; they close with `context.pop()`.
Future<T?> showAppBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  double topPadding = AppSheetFrame.defaultTop,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    showDragHandle: false,
    backgroundColor: Colors.transparent,
    barrierColor: context.colors.scrim,
    elevation: 0,
    builder: (context) => _Scrim(
      child: AppSheetFrame(
        topPadding: topPadding,
        child: Builder(builder: builder),
      ),
    ),
  );
}

/// Blur over the page; a tap on it closes the sheet.
class _Scrim extends StatelessWidget {
  const _Scrim({required this.child});

  static const double _blur = 5;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => context.pop(),
              child: const SizedBox.expand(),
            ),
          ),
          child,
        ],
      ),
    ).withBlur(_blur);
  }
}

extension on Widget {
  /// Blurs the page behind the sheet; the route barrier dims it.
  Widget withBlur(double blur) => Stack(
    children: [
      Positioned.fill(
        child: IgnorePointer(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: const SizedBox.expand(),
          ),
        ),
      ),
      this,
    ],
  );
}

/// Visual frame shared by every bottom sheet (Figma Re-Assign Order
/// `5000:101214`, Logout `5000:105536`): white with a teal outline and an
/// inner teal glow, 32pt top corners and a floating close button.
class AppSheetFrame extends StatelessWidget {
  const AppSheetFrame({
    required this.child,
    this.topPadding = defaultTop,
    super.key,
  });

  /// Logout: 32 above the illustration; Re-Assign: 40 above the title.
  static const double defaultTop = 32;
  static const double reassignTop = 40;

  static const double _radius = 32;
  static const double _closeSize = 36;
  static const double _inline = 24;

  final Widget child;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;
    const shape = BorderRadius.vertical(top: Radius.circular(_radius));
    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: shape,
              border: Border.all(color: colors.accent),
            ),
            child: CustomPaint(
              painter: _InsetGlow(color: colors.accent),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    _inline,
                    topPadding,
                    _inline,
                    _inline,
                  ),
                  child: child,
                ),
              ),
            ),
          ),
          const Positioned(
            top: -_closeSize / 2,
            left: 0,
            right: 0,
            child: Center(child: _CloseButton(size: _closeSize)),
          ),
        ],
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: context.l10n.commonClose,
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Material(
            color: context.colors.overlayButton,
            shape: CircleBorder(
              side: BorderSide(color: context.colors.overlayButtonBorder),
            ),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () => context.pop(),
              child: SizedBox.square(
                dimension: size,
                child: AppIcon(
                  AppIcons.close,
                  size: AppIconSizes.inline,
                  color: context.colors.onBrand,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Inner glow along the sheet's edges: teal at 18%, 60pt soft, 4pt lower
/// (Figma inset shadow).
class _InsetGlow extends CustomPainter {
  const _InsetGlow({required this.color});

  static const double _alpha = 0.18;
  static const double _blur = 60;
  static const double _drop = 4;
  static const double _radius = 32;

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final shape = RRect.fromRectAndCorners(
      Offset.zero & size,
      topLeft: const Radius.circular(_radius),
      topRight: const Radius.circular(_radius),
    );
    canvas
      ..save()
      ..clipRRect(shape);
    final paint = Paint()
      ..color = color.withValues(alpha: _alpha)
      ..style = PaintingStyle.stroke
      ..strokeWidth = _blur
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, _blur / 2);
    canvas
      ..drawRRect(shape.shift(const Offset(0, _drop)).inflate(_blur / 2), paint)
      ..restore();
  }

  @override
  bool shouldRepaint(_InsetGlow oldDelegate) => oldDelegate.color != color;
}
