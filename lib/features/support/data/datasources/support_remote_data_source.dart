import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/network/api_client.dart';
import 'package:rayyan_driver/core/network/api_endpoints.dart';
import 'package:rayyan_driver/core/network/app_environment.dart';
import 'package:rayyan_driver/features/support/data/datasources/support_mock_content.dart';
import 'package:rayyan_driver/features/support/data/models/policy_document_model.dart';

abstract interface class SupportRemoteDataSource {
  /// [type] is the API name ("terms", "privacy"…).
  Future<PolicyDocumentModel> fetchPolicy(String type);
  Future<List<FaqModel>> fetchFaqs();
}

@LazySingleton(as: SupportRemoteDataSource, env: [AppEnvironment.prod])
final class SupportRemoteDataSourceImpl implements SupportRemoteDataSource {
  const SupportRemoteDataSourceImpl(this._client);

  final ApiClient _client;

  @override
  Future<PolicyDocumentModel> fetchPolicy(String type) async =>
      PolicyDocumentModel.fromJson(
        await _client.get<Map<String, dynamic>>(ApiEndpoints.policy(type)),
      );

  @override
  Future<List<FaqModel>> fetchFaqs() async {
    final json = await _client.get<List<dynamic>>(ApiEndpoints.faqs);
    return [
      for (final item in json) FaqModel.fromJson(item as Map<String, dynamic>),
    ];
  }
}

/// The Figma placeholder text for every page.
@LazySingleton(as: SupportRemoteDataSource, env: [AppEnvironment.mock])
final class SupportMockDataSource implements SupportRemoteDataSource {
  const SupportMockDataSource();

  @override
  Future<PolicyDocumentModel> fetchPolicy(String type) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return PolicyDocumentModel(
      updatedAt: DateTime(2026, 10),
      sections: supportMockSections,
    );
  }

  @override
  Future<List<FaqModel>> fetchFaqs() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return supportMockFaqs;
  }
}
