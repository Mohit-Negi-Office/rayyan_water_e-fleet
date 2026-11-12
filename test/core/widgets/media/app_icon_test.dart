import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';

import '../../../helpers/pump_app.dart';

void main() {
  testWidgets('draws the asset at the requested square size', (tester) async {
    await tester.pumpApp(const AppIcon(AppIcons.search, size: 18));
    final svg = tester.widget<SvgPicture>(find.byType(SvgPicture));
    expect(svg.width, 18);
    expect(svg.height, 18);
  });

  testWidgets('keeps its size inside a larger fixed box', (tester) async {
    await tester.pumpApp(
      const SizedBox.square(
        dimension: 48,
        child: AppIcon(AppIcons.back, size: AppIconSizes.back),
      ),
    );
    final box = tester.getSize(find.byType(SvgPicture));
    expect(box, const Size.square(AppIconSizes.back));
    expect(
      tester.getCenter(find.byType(SvgPicture)),
      tester.getCenter(find.byType(SizedBox).first),
    );
  });

  testWidgets('shrink-wraps when the parent is loose', (tester) async {
    await tester.pumpApp(
      const Row(children: [AppIcon(AppIcons.search, size: 18)]),
    );
    expect(tester.getSize(find.byType(AppIcon)), const Size.square(18));
  });

  testWidgets('tints with the colour by default', (tester) async {
    await tester.pumpApp(
      const AppIcon(AppIcons.search, color: Color(0xFF123456)),
    );
    final svg = tester.widget<SvgPicture>(find.byType(SvgPicture));
    expect(
      svg.colorFilter,
      const ColorFilter.mode(Color(0xFF123456), BlendMode.srcIn),
    );
  });

  testWidgets('tint: false keeps the SVG colours', (tester) async {
    await tester.pumpApp(
      const AppIcon(AppIcons.apple, color: Color(0xFF123456), tint: false),
    );
    final svg = tester.widget<SvgPicture>(find.byType(SvgPicture));
    expect(svg.colorFilter, isNull);
  });
}
