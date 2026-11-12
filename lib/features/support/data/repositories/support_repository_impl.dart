import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/support/data/datasources/support_remote_data_source.dart';
import 'package:rayyan_driver/features/support/domain/entities/faq.dart';
import 'package:rayyan_driver/features/support/domain/entities/policy_document.dart';
import 'package:rayyan_driver/features/support/domain/repositories/support_repository.dart';

@LazySingleton(as: SupportRepository)
final class SupportRepositoryImpl implements SupportRepository {
  const SupportRepositoryImpl(this._remote);

  final SupportRemoteDataSource _remote;

  // TODO(backend): confirm the policy names.
  static String _apiName(PolicyType type) => switch (type) {
    PolicyType.aboutUs => 'about',
    PolicyType.terms => 'terms',
    PolicyType.privacy => 'privacy',
  };

  @override
  Future<Result<PolicyDocument>> getPolicy(PolicyType type) => guard(
    () async => (await _remote.fetchPolicy(_apiName(type))).toEntity(type),
  );

  @override
  Future<Result<List<Faq>>> getFaqs() => guard(
    () async => [for (final faq in await _remote.fetchFaqs()) faq.toEntity()],
  );
}
