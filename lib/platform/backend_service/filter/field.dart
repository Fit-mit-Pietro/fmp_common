
part of filter_lib;

enum FieldValueType {bool,int,text,bodyMap,enumValue}

class Field{
  FieldValueType type;
  String label;
  String id;

  @override
  String toString() {
    return 'Field{type: $type, label: $label, id: $id, enumValues: $enumValues}';
  }

  Map<String,String>? enumValues;

  Field({
    required this.type,
    required this.label,
    required this.id,
    Map<String,String>? enumValues,
  }){
    //assert(!(type == FieldValueType.enumValue && enumValues == null),"Please add values for enum!");
    this.enumValues = enumValues;
  }
}

extension UserPropertyFieldExtension on UserProperty{
  
  Field toField() => Field(
      type: fromUserPropertyType(this.propertyType),
      label: label,
      id: id,
      enumValues: this.propertyOptions
  );
  
  static FieldValueType fromUserPropertyType(UserPropertyType type){
    switch(type){
      case UserPropertyType.BOOL:
        return FieldValueType.bool;
      case UserPropertyType.INT:
        return FieldValueType.int;
      case UserPropertyType.FULL_TEXT:
        return FieldValueType.text;
      case UserPropertyType.BODY_MAP:
        return FieldValueType.bodyMap;
      case UserPropertyType.ENUM:        
        return FieldValueType.enumValue;
    }
  }
  
}