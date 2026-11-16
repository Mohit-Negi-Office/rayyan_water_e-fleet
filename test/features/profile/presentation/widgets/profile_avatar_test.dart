import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/features/profile/presentation/widgets/profile_avatar.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  testWidgets('an empty photo shows the name initials', (tester) async {
    await tester.pumpApp(
      const ProfileAvatar(url: '', name: 'Mohit Nagi', size: 80),
    );

    expect(find.text('MN'), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsNothing);
  });

  testWidgets('a photo url is loaded from the cache', (tester) async {
    await tester.pumpApp(
      const ProfileAvatar(
        url: 'https://cdn.example.com/driver.jpg',
        name: 'Mohit Nagi',
        size: 80,
      ),
    );

    final image = tester.widget<CachedNetworkImage>(
      find.byType(CachedNetworkImage),
    );
    expect(image.imageUrl, 'https://cdn.example.com/driver.jpg');
    expect(find.text('MN'), findsNothing);
  });
}
