

import 'package:fmp_common/fmp_common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'body_part.g.dart';

@JsonSerializable()
class BodyPart {

  @JsonKey(name: Keys.ID)
  String id;

  @JsonKey(name: Keys.BODY_PART_IMAGE_KEYS)
  List<String>? imageKeys;

  @JsonKey(name: Keys.BODY_SELECTOR_BODY_PART_LABEL)
  String label;

  @JsonKey(ignore: true)
  late String path;

  @JsonKey(name: Keys.BODY_SELECTOR_BODY_PART_SYMPTOMS)
  List<String> possibleSymptomKeys;

  BodyPart({
    required this.id,
    required this.label,
    required this.possibleSymptomKeys,
    this.imageKeys,
    this.path = "",
  });

  factory BodyPart.fromJson(Map<String, dynamic> json) =>
      _$BodyPartFromJson(json);
  Map<String, dynamic> toJson() => _$BodyPartToJson(this);

  static BodyPart copy(BodyPart part) {
    List<String>? copiedImageKeys;
    if(part.imageKeys != null){
      copiedImageKeys = List.of(part.imageKeys!);
    }
    return BodyPart(
        id: part.id,
        label: part.label,
        imageKeys: copiedImageKeys,
        possibleSymptomKeys: part.possibleSymptomKeys);
  }

}