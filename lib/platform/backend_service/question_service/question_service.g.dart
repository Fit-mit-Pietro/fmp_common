// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'text', 'user_property_id'],
  );
  return Question(
    id: json['id'] as String,
    label: json['text'] as String,
    userPropertyId: json['user_property_id'] as String,
  );
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.label,
      'user_property_id': instance.userPropertyId,
    };
