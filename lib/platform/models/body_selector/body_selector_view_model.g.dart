// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_selector_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodySelectorViewModel _$BodySelectorViewModelFromJson(
        Map<String, dynamic> json) =>
    BodySelectorViewModel(
      front: (json['parts_front'] as List<dynamic>)
          .map((e) => BodyPart.fromJson(e as Map<String, dynamic>))
          .toList(),
      back: (json['parts_back'] as List<dynamic>)
          .map((e) => BodyPart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BodySelectorViewModelToJson(
        BodySelectorViewModel instance) =>
    <String, dynamic>{
      'parts_front': instance.front,
      'parts_back': instance.back,
    };
