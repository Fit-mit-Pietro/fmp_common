

import 'package:fmp_common/fmp_common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'body_part_symptom.g.dart';

@JsonSerializable()
class BodyPartSymptom{

  @JsonKey(name: Keys.ID)
  final String id;

  @JsonKey(name: Keys.LABEL)
  final String label;

  BodyPartSymptom({
    required this.id,
    required this.label,
  });

  factory BodyPartSymptom.fromJson(Map<String, dynamic> json) =>
      _$BodyPartSymptomFromJson(json);
  Map<String, dynamic> toJson() => _$BodyPartSymptomToJson(this);
}