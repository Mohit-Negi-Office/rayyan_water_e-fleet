import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/widgets/media/app_icon.dart';
import 'package:rayyan_driver/core/widgets/media/app_network_image.dart';

import '../../../helpers/pump_app.dart';

void main() {
  testWidgets('a bundled assets/ path is drawn from the bundle', (
    tester,
  ) async {
    const path = 'assets/images/products/cups_cartoon.png';
    await tester.pumpApp(const AppNetworkImage(url: path));
    final image = tester.widget<Image>(find.byType(Image));
    expect(image.image, isA<AssetImage>());
    expect((image.image as AssetImage).assetName, path);
  });

  testWidgets('an http url goes through the network cache', (tester) async {
    await tester.pumpApp(
      const AppNetworkImage(url: 'https://example.com/p.png'),
    );
    expect(find.byType(CachedNetworkImage), findsOneWidget);
  });

  testWidgets('no url shows the placeholder', (tester) async {
    await tester.pumpApp(const AppNetworkImage(url: null));
    expect(
      find.byWidgetPredicate((w) => w is AppIcon && w.asset == AppIcons.image),
      findsOneWidget,
    );
  });
}
