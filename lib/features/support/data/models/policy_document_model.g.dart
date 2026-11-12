// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policy_document_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PolicySectionModel _$PolicySectionModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PolicySectionModel', json, ($checkedConvert) {
      final val = PolicySectionModel(
        body: $checkedConvert('body', (v) => v as String),
        heading: $checkedConvert('heading', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$PolicySectionModelToJson(PolicySectionModel instance) =>
    <String, dynamic>{'heading': instance.heading, 'body': instance.body};

FaqModel _$FaqModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FaqModel', json, ($checkedConvert) {
      final val = FaqModel(
        question: $checkedConvert('question', (v) => v as String),
        answer: $checkedConvert('answer', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$FaqModelToJson(FaqModel instance) => <String, dynamic>{
  'question': instance.question,
  'answer': instance.answer,
};

PolicyDocumentModel _$PolicyDocumentModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PolicyDocumentModel', json, ($checkedConvert) {
      final val = PolicyDocumentModel(
        updatedAt: $checkedConvert(
          'updated_at',
          (v) => DateTime.parse(v as String),
        ),
        sections: $checkedConvert(
          'sections',
          (v) => (v as List<dynamic>)
              .map(
                (e) => PolicySectionModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'updatedAt': 'updated_at'});

Map<String, dynamic> _$PolicyDocumentModelToJson(
  PolicyDocumentModel instance,
) => <String, dynamic>{
  'updated_at': instance.updatedAt.toIso8601String(),
  'sections': instance.sections.map((e) => e.toJson()).toList(),
};
