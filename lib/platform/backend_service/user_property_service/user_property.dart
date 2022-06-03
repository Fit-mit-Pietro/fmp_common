


part of user_property_service;


enum UserPropertyType {BOOL,INT,FULL_TEXT,BODY_MAP,ENUM}

class UserPropertyTypeMapper{
  static Map<String,String> labelMap = {
    "BOOL": "Ja/Nein",
    "INT": "Ganzzahlige Zahl",
    "FULL_TEXT": "Volltext",
    "BODY_MAP": "Körperkarte",
    "ENUM": "Auswahlmöglichkeit",
  };

  static Map<UserPropertyType,String> keyMap = {
    UserPropertyType.BOOL: "BOOL",
    UserPropertyType.INT: "INT",
    UserPropertyType.FULL_TEXT: "FULL_TEXT",
    UserPropertyType.BODY_MAP: "BODY_MAP",
    UserPropertyType.ENUM: "ENUM",
  };

  static UserPropertyType fromKey(String key){
    return keyMap.keys.firstWhere(
            (k) => keyMap[k] == key,
        orElse: () => keyMap.keys.first
    );
  }
}


class UserProperty implements Identifiable{

  String id;
  String label;
  UserPropertyType propertyType;
  /// The possible values of the property, if it is is an enum. {Key:Label}
  Map<String,String>? propertyOptions;
  String? unit;
  int? minValue;
  int? maxValue;

  UserProperty({
    required this.id,
    required this.label,
    required this.propertyType,
    this.propertyOptions,
    this.unit,
    this.minValue,
    this.maxValue
  });

  factory UserProperty.createNew({
    String label = "Neues Symptom",
    String id = "symptom_1",
    UserPropertyType propertyType = UserPropertyType.BOOL,
    Map<String,String>? propertyOptions
  }) => UserProperty(
      id: id,
      label: label,
      propertyType: propertyType,
      propertyOptions: propertyOptions
  );

  @override
  String getId() => this.id;

  @override
  String toString() {
    return 'UserProperty{id: $id, label: $label, propertyType: $propertyType, propertyOptions: $propertyOptions, unit: $unit, minValue: $minValue, maxValue: $maxValue}';
  }
}