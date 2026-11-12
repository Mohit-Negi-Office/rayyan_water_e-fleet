import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('figma home svg is in the asset bundle', () async {
    final data = await rootBundle.loadString(AppIcons.home);
    expect(data, contains('<svg'));
    expect(data, contains('fill="black"'));
    expect(data.length, greaterThan(100));
  });

  test('all AppIcons paths resolve', () async {
    const paths = [
      AppIcons.home,
      AppIcons.products,
      AppIcons.cart,
      AppIcons.favourite,
      AppIcons.profile,
      AppIcons.search,
      AppIcons.notification,
      AppIcons.back,
    ];
    for (final path in paths) {
      final data = await rootBundle.loadString(path);
      expect(data, contains('<svg'), reason: path);
    }
  });
}
