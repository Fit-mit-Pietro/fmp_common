// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionnaire_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Questionnaire _$QuestionnaireFromJson(Map<String, dynamic> json) =>
    Questionnaire(
      id: json['id'] as String,
      label: json['label'] as String,
      elements: (json['elements'] as List<dynamic>)
          .map((e) => QuestionnaireElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionnaireToJson(Questionnaire instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'elements': instance.elements,
    };

QuestionnaireElement _$QuestionnaireElementFromJson(
        Map<String, dynamic> json) =>
    QuestionnaireElement(
      questionId: json['question_id'] as String,
      index: (json['index'] as num).toInt(),
      dependency: json['depends_on'] == null
          ? null
          : Filter.fromJson(json['depends_on'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionnaireElementToJson(
        QuestionnaireElement instance) =>
    <String, dynamic>{
      'question_id': instance.questionId,
      'index': instance.index,
      'depends_on': instance.dependency,
    };

FilledQuestion _$FilledQuestionFromJson(Map<String, dynamic> json) =>
    FilledQuestion(
      id: json['id'] as String,
      text: json['text'] as String,
      userProperty:
          UserProperty.fromJson(json['user_property'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FilledQuestionToJson(FilledQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'user_property': instance.userProperty,
    };

FilledQuestionnaire _$FilledQuestionnaireFromJson(Map<String, dynamic> json) =>
    FilledQuestionnaire(
      id: json['id'] as String,
      label: json['label'] as String,
      elements: (json['elements'] as List<dynamic>)
          .map((e) =>
              FilledQuestionnaireElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilledQuestionnaireToJson(
        FilledQuestionnaire instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'elements': instance.elements,
    };

FilledQuestionnaireElement _$FilledQuestionnaireElementFromJson(
        Map<String, dynamic> json) =>
    FilledQuestionnaireElement(
      index: (json['index'] as num).toInt(),
      filledQuestion:
          FilledQuestion.fromJson(json['question'] as Map<String, dynamic>),
      dependency: json['depends_on'] == null
          ? null
          : Filter.fromJson(json['depends_on'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FilledQuestionnaireElementToJson(
        FilledQuestionnaireElement instance) =>
    <String, dynamic>{
      'index': instance.index,
      'question': instance.filledQuestion,
      'depends_on': instance.dependency,
    };
