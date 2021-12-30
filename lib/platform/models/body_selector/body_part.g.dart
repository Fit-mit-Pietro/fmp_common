// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyPart _$BodyPartFromJson(Map<String, dynamic> json) => BodyPart(
      id: json['id'] as String,
      label: json['label'] as String,
      possibleSymptomKeys:
          (json['symptoms'] as List<dynamic>).map((e) => e as String).toList(),
      imageKeys: (json['image_keys'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BodyPartToJson(BodyPart instance) => <String, dynamic>{
      'id': instance.id,
      'image_keys': instance.imageKeys,
      'label': instance.label,
      'symptoms': instance.possibleSymptomKeys,
    };
