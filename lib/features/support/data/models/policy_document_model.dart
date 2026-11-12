import 'package:json_annotation/json_annotation.dart';
import 'package:rayyan_driver/features/support/domain/entities/faq.dart';
import 'package:rayyan_driver/features/support/domain/entities/policy_document.dart';

part 'policy_document_model.g.dart';

@JsonSerializable()
class PolicySectionModel {
  const PolicySectionModel({required this.body, this.heading});

  factory PolicySectionModel.fromJson(Map<String, dynamic> json) =>
      _$PolicySectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PolicySectionModelToJson(this);

  final String? heading;
  final String body;
}

@JsonSerializable()
class FaqModel {
  const FaqModel({required this.question, required this.answer});

  factory FaqModel.fromJson(Map<String, dynamic> json) =>
      _$FaqModelFromJson(json);

  Map<String, dynamic> toJson() => _$FaqModelToJson(this);

  final String question;
  final String answer;

  Faq toEntity() => Faq(question: question, answer: answer);
}

// TODO(backend): confirm the policy page fields.
@JsonSerializable()
class PolicyDocumentModel {
  const PolicyDocumentModel({required this.updatedAt, required this.sections});

  factory PolicyDocumentModel.fromJson(Map<String, dynamic> json) =>
      _$PolicyDocumentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PolicyDocumentModelToJson(this);

  final DateTime updatedAt;
  final List<PolicySectionModel> sections;

  PolicyDocument toEntity(PolicyType type) => PolicyDocument(
    type: type,
    updatedAt: updatedAt,
    sections: [
      for (final s in sections) PolicySection(heading: s.heading, body: s.body),
    ],
  );
}
