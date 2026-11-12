import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/features/onboarding/domain/entities/app_language.dart';

void main() {
  test('fromCode resolves supported codes', () {
    expect(AppLanguage.fromCode('en'), AppLanguage.english);
    expect(AppLanguage.fromCode('ar'), AppLanguage.arabic);
  });

  test('fromCode returns null for unknown or missing codes', () {
    expect(AppLanguage.fromCode('fr'), isNull);
    expect(AppLanguage.fromCode(null), isNull);
  });

  test('only Arabic is right-to-left', () {
    expect(AppLanguage.arabic.isRtl, isTrue);
    expect(AppLanguage.english.isRtl, isFalse);
  });
}
