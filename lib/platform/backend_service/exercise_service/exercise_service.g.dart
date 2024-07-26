// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      id: json['id'] as String,
      label: json['text'] as String,
      description: json['description'] as String?,
      videoUrl: json['video_url'] as String?,
      exerciseType:
          $enumDecodeNullable(_$ExerciseTypeEnumMap, json['exercise_type']),
      difficulty: (json['difficulty'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.label,
      'description': instance.description,
      'video_url': instance.videoUrl,
      'exercise_type': _$ExerciseTypeEnumMap[instance.exerciseType],
      'difficulty': instance.difficulty,
      'duration': instance.duration,
    };

const _$ExerciseTypeEnumMap = {
  ExerciseType.ENDURANCE: 'ENDURANCE',
  ExerciseType.MUSCLE_BUILDING: 'MUSCLE_BUILDING',
  ExerciseType.STRENGTH: 'STRENGTH',
  ExerciseType.STRENGTH_ENDURANCE: 'STRENGTH_ENDURANCE',
  ExerciseType.MAXIMUM_STRENGTH: 'MAXIMUM_STRENGTH',
  ExerciseType.QUICK_STRENGTH: 'QUICK_STRENGTH',
  ExerciseType.FLEXIBILITY: 'FLEXIBILITY',
  ExerciseType.BALANCE: 'BALANCE',
  ExerciseType.RELAXATION: 'RELAXATION',
};

ExercisePropertyLinkValue _$ExercisePropertyLinkValueFromJson(
        Map<String, dynamic> json) =>
    ExercisePropertyLinkValue(
      filter: Filter.fromJson(json['filter'] as Map<String, dynamic>),
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$ExercisePropertyLinkValueToJson(
        ExercisePropertyLinkValue instance) =>
    <String, dynamic>{
      'filter': instance.filter,
      'value': instance.value,
    };

ExercisePropertyLink _$ExercisePropertyLinkFromJson(
        Map<String, dynamic> json) =>
    ExercisePropertyLink(
      id: json['id'] as String,
      userPropertyId: json['user_property_id'] as String,
      exerciseId: json['exercise_id'] as String,
      values: (json['values'] as List<dynamic>)
          .map((e) =>
              ExercisePropertyLinkValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExercisePropertyLinkToJson(
        ExercisePropertyLink instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_property_id': instance.userPropertyId,
      'exercise_id': instance.exerciseId,
      'values': instance.values,
    };
