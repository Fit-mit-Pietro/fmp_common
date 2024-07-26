part of filter_lib;

enum FieldValueType {
  @JsonValue("BOOL")
  bool,
  @JsonValue("INT")
  int,
  @JsonValue("TEXT")
  text,
  @JsonValue("BODY_MAP")
  bodyMap,
  @JsonValue("ENUM")
  $enum,
  @JsonValue("DATES_IN_WEEK")
  datesInWeek,
}

@JsonSerializable()
class Field {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "type")
  FieldValueType type;
  @JsonKey(name: "label")
  String label;

  @JsonKey(name: "property_options")
  Map<String, String>? enumValues;

  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);
  Map<String, dynamic> toJson() => _$FieldToJson(this);

  @override
  String toString() {
    return 'Field{type: $type, label: $label, id: $id, enumValues: $enumValues}';
  }

  Field({
    required this.type,
    required this.label,
    required this.id,
    this.enumValues,
  });
}

extension UserPropertyFieldExtension on UserProperty {
  Field toField() => Field(
        type: fromUserPropertyType(propertyType),
        label: label,
        id: id,
        enumValues: propertyOptions,
      );

  static FieldValueType fromUserPropertyType(UserPropertyType type) {
    switch (type) {
      case UserPropertyType.BOOL:
        return FieldValueType.bool;
      case UserPropertyType.INT:
        return FieldValueType.int;
      case UserPropertyType.FULL_TEXT:
        return FieldValueType.text;
      case UserPropertyType.BODY_MAP:
        return FieldValueType.bodyMap;
      case UserPropertyType.ENUM:
        return FieldValueType.$enum;
      case UserPropertyType.DATES_IN_WEEK:
        return FieldValueType.datesInWeek;
    }
  }
}
