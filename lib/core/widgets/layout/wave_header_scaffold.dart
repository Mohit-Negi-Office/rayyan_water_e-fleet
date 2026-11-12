import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/brand/brand_backdrop.dart';
import 'package:rayyan_driver/core/widgets/layout/brand_wave.dart';
import 'package:rayyan_driver/core/widgets/navigation/app_top_bar.dart';

/// Navy pattern header (leading mark, title, subtitle) over a white panel
/// with the brand wave on top: Enter Mobile Number (`5000:98300`) and
/// Verify Mobile Number (`5000:98397`). [body] scrolls with the header when
/// the keyboard is up; [footer] sits at the foot of the panel.
class WaveHeaderScaffold extends StatelessWidget {
  const WaveHeaderScaffold({
    required this.title,
    required this.subtitle,
    required this.body,
    this.leading,
    this.leadingTop = _backTop,
    this.footer,
    super.key,
  });

  /// Measured below the status bar: the back box, and the logo on login.
  static const double _backTop = 20;
  static const double logoTop = 17;

  final String title;

  /// Usually text; inherits the light subtitle style.
  final Widget subtitle;
  final Widget body;

  /// Defaults to the navy back button.
  final Widget? leading;
  final double leadingTop;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    // Under the keyboard in Figma (`5000:98325`): hidden while it is up.
    // Read here, before the Scaffold takes the inset away from its body.
    final keyboardUp = MediaQuery.viewInsetsOf(context).bottom > 0;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: context.colors.brandDeep,
        body: Stack(
          fit: StackFit.expand,
          children: [
            const BrandBackdrop(showWater: false),
            LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _Header(
                          title: title,
                          subtitle: subtitle,
                          leading: leading ?? const AppBackButton.onBrand(),
                          leadingTop: leadingTop,
                        ),
                        Expanded(
                          child: _WavePanel(
                            footer: keyboardUp ? null : footer,
                            child: body,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.title,
    required this.subtitle,
    required this.leading,
    required this.leadingTop,
  });

  /// Measured: the title starts 116pt below the status bar.
  static const double _titleTop = 116;

  /// Figma: the wave's crest sits 24pt under the subtitle's line box.
  static const double _waveGap = 24;

  final String title;
  final Widget subtitle;
  final Widget leading;
  final double leadingTop;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.screenGutter,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: _titleTop,
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(top: leadingTop),
                  child: leading,
                ),
              ),
            ),
            Semantics(
              header: true,
              child: Text(
                title,
                style: styles.displayTitle.copyWith(color: colors.onBrand),
              ),
            ),
            const SizedBox(height: AppSpacing.s2),
            DefaultTextStyle.merge(
              style: styles.subtitleLight.copyWith(color: colors.inputBorder),
              child: subtitle,
            ),
            const SizedBox(height: _waveGap),
          ],
        ),
      ),
    );
  }
}

class _WavePanel extends StatelessWidget {
  const _WavePanel({required this.child, this.footer});

  /// Measured: the first field starts 62pt below the crest.
  static const double _contentTop = 62;

  final Widget child;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final rtl = Directionality.of(context) == TextDirection.rtl;
    final footer = this.footer;
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipPath(
          clipper: BrandWavePanelClipper(rtl: rtl),
          child: ColoredBox(color: context.colors.surface),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(
              AppSpacing.screenGutter,
              _contentTop,
              AppSpacing.screenGutter,
              AppSpacing.s6,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                child,
                if (footer != null) ...[
                  const Spacer(),
                  const SizedBox(height: AppSpacing.s6),
                  footer,
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
