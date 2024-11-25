import 'package:fmp_common/fmp_common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'body_part.g.dart';

@JsonSerializable()
class BodyPart {
  @JsonKey(name: Keys.id)
  String id;

  @JsonKey(name: Keys.bodyPartImageKeys)
  List<String>? imageKeys;

  @JsonKey(name: Keys.bodySelectorBodyPartLabel)
  String label;

  @JsonKey(includeFromJson: false, includeToJson: false)
  late String path;

  @JsonKey(name: Keys.bodySelectorBodyPartSymptoms)
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
    if (part.imageKeys != null) {
      copiedImageKeys = List.of(part.imageKeys!);
    }
    return BodyPart(
        id: part.id,
        label: part.label,
        imageKeys: copiedImageKeys,
        possibleSymptomKeys: part.possibleSymptomKeys);
  }
}
