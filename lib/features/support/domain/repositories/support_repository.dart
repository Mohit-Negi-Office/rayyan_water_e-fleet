import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/features/support/domain/entities/faq.dart';
import 'package:rayyan_driver/features/support/domain/entities/policy_document.dart';

abstract interface class SupportRepository {
  Future<Result<PolicyDocument>> getPolicy(PolicyType type);

  /// Questions and answers, in the app language.
  Future<Result<List<Faq>>> getFaqs();
}
