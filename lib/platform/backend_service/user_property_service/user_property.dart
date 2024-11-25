part of user_property_service;

enum UserPropertyType {
  @JsonValue('BOOL')
  bool,
  @JsonValue('INT')
  int,
  @JsonValue('FULL_TEXT')
  fullText,
  @JsonValue('BODY_MAP')
  bodyMap,
  @JsonValue('ENUM')
  $enum,
  @JsonValue('DATES_IN_WEEK')
  datesInWeek,
}

class UserPropertyTypeMapper {
  static Map<String, String> labelMap = {
    "BOOL": "Ja/Nein",
    "INT": "Ganzzahlige Zahl",
    "FULL_TEXT": "Volltext",
    "BODY_MAP": "Körperkarte",
    "ENUM": "Auswahlmöglichkeit",
    "DATES_IN_WEEK": "Termine in der Woche"
  };

  static Map<UserPropertyType, String> keyMap = {
    UserPropertyType.bool: "BOOL",
    UserPropertyType.int: "INT",
    UserPropertyType.fullText: "FULL_TEXT",
    UserPropertyType.bodyMap: "BODY_MAP",
    UserPropertyType.$enum: "ENUM",
    UserPropertyType.datesInWeek: "DATES_IN_WEEK"
  };

  static UserPropertyType fromKey(String key) {
    return keyMap.keys
        .firstWhere((k) => keyMap[k] == key, orElse: () => keyMap.keys.first);
  }
}

@JsonSerializable()
class UserProperty implements Identifiable {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'label')
  String label;

  @JsonKey(name: 'type')
  UserPropertyType propertyType;

  /// The possible values of the property, if it is is an enum. {Key:Label}
  @JsonKey(name: 'property_options')
  Map<String, String>? propertyOptions;

  @JsonKey(name: 'unit')
  String? unit;

  @JsonKey(name: 'min_value')
  int? minValue;

  @JsonKey(name: 'max_value')
  int? maxValue;

  UserProperty(
      {required this.id,
      required this.label,
      required this.propertyType,
      this.propertyOptions,
      this.unit,
      this.minValue,
      this.maxValue});

  factory UserProperty.createNew(
          {String label = "Neues Symptom",
          String id = "symptom_1",
          UserPropertyType propertyType = UserPropertyType.bool,
          Map<String, String>? propertyOptions}) =>
      UserProperty(
          id: id,
          label: label,
          propertyType: propertyType,
          propertyOptions: propertyOptions);

  factory UserProperty.fromJson(Map<String, dynamic> json) =>
      _$UserPropertyFromJson(json);
  Map<String, dynamic> toJson() => _$UserPropertyToJson(this);

  @override
  String getId() => id;

  @override
  String getLabel() => label;

  @override
  String toString() {
    return 'UserProperty{id: $id, label: $label, propertyType: $propertyType, propertyOptions: $propertyOptions, unit: $unit, minValue: $minValue, maxValue: $maxValue}';
  }
}
