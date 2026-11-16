import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/utils/device_id_generator.dart';

void main() {
  final uuidV4 = RegExp(
    r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
  );

  test('creates a version-4 id', () {
    final ids = List.generate(20, (_) => DeviceIdGenerator.create());
    expect(ids.toSet(), hasLength(20));
    for (final id in ids) {
      expect(id, matches(uuidV4));
    }
  });
}
