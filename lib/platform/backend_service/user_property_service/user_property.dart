


part of user_property_service;


enum UserPropertyType {BOOL,INT,FULL_TEXT,BODY_MAP,ENUM}

class UserProperty implements Identifiable{

  String id;
  String label;
  UserPropertyType propertyType;
  /// The possible values of the property, if it is is an enum. {Key:Label}
  Map<String,String>? propertyOptions;
  String? unit;

  UserProperty({
    required this.id,
    required this.label,
    required this.propertyType,
    this.propertyOptions,
    this.unit
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
    return 'UserProperty{id: $id, label: $label, propertyType: $propertyType, propertyOptions: $propertyOptions, unit: $unit}';
  }


}