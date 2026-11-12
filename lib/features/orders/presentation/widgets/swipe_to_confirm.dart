import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';

/// Deep-navy track with a teal thumb the driver drags to the end to confirm
/// ("Mark As Deliver", "Cash Collected"; Figma `5672:38308`). Springs back
/// when let go early. Drag state lives in a [ValueNotifier] (no setState).
class SwipeToConfirm extends StatefulWidget {
  const SwipeToConfirm({
    required this.label,
    required this.onConfirmed,
    this.isBusy = false,
    super.key,
  });

  static const double _height = 56;
  static const double _inset = 6;
  static const double _thumbWidth = 62;
  static const double _radius = 14;

  /// Share of the track to cover before letting go counts.
  static const double _threshold = 0.85;

  /// The two 20pt chevrons overlap by 10pt.
  static const double _chevronStep = 10;

  final String label;
  final VoidCallback onConfirmed;

  /// Keeps the thumb at the end while the confirmation is sent.
  final bool isBusy;

  @override
  State<SwipeToConfirm> createState() => _SwipeToConfirmState();
}

class _SwipeToConfirmState extends State<SwipeToConfirm>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<double> _progress = ValueNotifier(0);
  late final AnimationController _spring;

  @override
  void initState() {
    super.initState();
    _spring = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    )..addListener(() => _progress.value = _spring.value);
  }

  @override
  void didUpdateWidget(SwipeToConfirm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isBusy && !widget.isBusy) _springTo(0);
  }

  @override
  void dispose() {
    _spring.dispose();
    _progress.dispose();
    super.dispose();
  }

  void _springTo(double target) {
    _spring
      ..value = _progress.value
      ..animateTo(target, curve: Curves.easeOut);
  }

  void _release() {
    if (_progress.value >= SwipeToConfirm._threshold) {
      _springTo(1);
      widget.onConfirmed();
    } else {
      _springTo(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final rtl = Directionality.of(context) == TextDirection.rtl;
    const radius = BorderRadius.all(Radius.circular(SwipeToConfirm._radius));
    return Semantics(
      button: true,
      label: widget.label,
      onTap: widget.isBusy ? null : widget.onConfirmed,
      excludeSemantics: true,
      child: Container(
        height: SwipeToConfirm._height,
        padding: const EdgeInsets.all(SwipeToConfirm._inset),
        decoration: BoxDecoration(
          color: colors.brandDeep,
          borderRadius: radius,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final travel = constraints.maxWidth - SwipeToConfirm._thumbWidth;
            return Stack(
              children: [
                Positioned.fill(
                  left: SwipeToConfirm._thumbWidth,
                  child: Center(
                    child: Text(
                      widget.label,
                      textAlign: TextAlign.center,
                      style: context.textStyles.pageTitle.copyWith(
                        color: colors.onBrand,
                      ),
                    ),
                  ),
                ),
                ValueListenableBuilder<double>(
                  valueListenable: _progress,
                  builder: (context, progress, child) => PositionedDirectional(
                    start: progress * travel,
                    top: 0,
                    bottom: 0,
                    child: child!,
                  ),
                  child: GestureDetector(
                    onHorizontalDragUpdate: widget.isBusy
                        ? null
                        : (d) {
                            final dx = rtl ? -d.delta.dx : d.delta.dx;
                            _progress.value = (_progress.value + dx / travel)
                                .clamp(0, 1);
                          },
                    onHorizontalDragEnd: widget.isBusy
                        ? null
                        : (_) => _release(),
                    child: Container(
                      width: SwipeToConfirm._thumbWidth,
                      decoration: BoxDecoration(
                        color: colors.accent,
                        borderRadius: radius,
                      ),
                      alignment: Alignment.center,
                      child: widget.isBusy
                          ? SizedBox.square(
                              dimension: AppSpacing.s4,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: colors.onBrand,
                              ),
                            )
                          : _Chevrons(color: colors.onBrand),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Chevrons extends StatelessWidget {
  const _Chevrons({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    Widget chevron() => AppIcon(
      AppIcons.chevronEnd,
      size: AppIconSizes.header,
      color: color,
      matchTextDirection: true,
    );
    return SizedBox(
      width: AppIconSizes.header + SwipeToConfirm._chevronStep,
      height: AppIconSizes.header,
      child: Stack(
        children: [
          PositionedDirectional(start: 0, child: chevron()),
          PositionedDirectional(
            start: SwipeToConfirm._chevronStep,
            child: chevron(),
          ),
        ],
      ),
    );
  }
}
