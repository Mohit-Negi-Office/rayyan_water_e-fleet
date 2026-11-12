import 'package:flutter_test/flutter_test.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/support/data/datasources/support_remote_data_source.dart';
import 'package:rayyan_driver/features/support/data/repositories/support_repository_impl.dart';
import 'package:rayyan_driver/features/support/domain/entities/policy_document.dart';

void main() {
  test('every policy has an update date and sections', () async {
    final repo = const SupportRepositoryImpl(SupportMockDataSource());
    for (final type in PolicyType.values) {
      final doc = (await repo.getPolicy(type) as Success<PolicyDocument>).value;
      expect(doc.type, type);
      expect(doc.updatedAt, DateTime(2026, 10));
      expect(doc.sections, isNotEmpty);
    }
  });

  test('lists the FAQs from Figma', () async {
    final repo = const SupportRepositoryImpl(SupportMockDataSource());
    final faqs = (await repo.getFaqs() as Success).value as List;
    expect(faqs, hasLength(8));
  });
}
