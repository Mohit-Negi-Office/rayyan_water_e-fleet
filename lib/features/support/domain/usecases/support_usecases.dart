import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/features/support/domain/entities/faq.dart';
import 'package:rayyan_driver/features/support/domain/entities/policy_document.dart';
import 'package:rayyan_driver/features/support/domain/repositories/support_repository.dart';

@injectable
class GetPolicy implements UseCase<PolicyDocument, PolicyType> {
  const GetPolicy(this._repository);

  final SupportRepository _repository;

  @override
  Future<Result<PolicyDocument>> call(PolicyType params) =>
      _repository.getPolicy(params);
}

@injectable
class GetFaqs implements UseCase<List<Faq>, NoParams> {
  const GetFaqs(this._repository);

  final SupportRepository _repository;

  @override
  Future<Result<List<Faq>>> call(NoParams params) => _repository.getFaqs();
}
