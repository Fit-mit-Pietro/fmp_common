part of filter_lib;

extension ServiceFieldParser on Field {
  static Field fromExerciseApiField(ExerciseApi.Field element) => Field(
        type: fromExerciseApiType(element.type),
        id: element.id,
        label: element.label,
        enumValues: ObjectToMap(element.propertyOptions),
      );

  static Map<String, String>? ObjectToMap(Object object) {
    if (object == null) return null;
    try {
      Map map = jsonDecode(jsonEncode(object));
      map = map.cast<String, String>();

      if (map is Map<String, String>) return map;
    } catch (e) {
      print(e);
    }
  }

  ExerciseApi.Field toExerciseApiField() => ExerciseApi.Field(
      type: fromServiceType(this.type),
      id: this.id,
      label: this.label,
      propertyOptions: this.enumValues!);

  static ExerciseApi.FieldTypeEnum fromServiceType(FieldValueType type) {
    switch (type) {
      case FieldValueType.bool:
        return ExerciseApi.FieldTypeEnum.BOOL;
      case FieldValueType.int:
        return ExerciseApi.FieldTypeEnum.INT;
      case FieldValueType.text:
        return ExerciseApi.FieldTypeEnum.FULL_TEXT;
      case FieldValueType.bodyMap:
        return ExerciseApi.FieldTypeEnum.BODY_MAP;
      case FieldValueType.enumValue:
        return ExerciseApi.FieldTypeEnum.ENUM;
      case FieldValueType.datesInWeek:
        return ExerciseApi.FieldTypeEnum.DATES_IN_WEEK;
    }
  }

  static FieldValueType fromExerciseApiType(ExerciseApi.FieldTypeEnum type) {
    if (type == ExerciseApi.FieldTypeEnum.BOOL) return FieldValueType.bool;
    if (type == ExerciseApi.FieldTypeEnum.INT) return FieldValueType.int;
    if (type == ExerciseApi.FieldTypeEnum.FULL_TEXT) return FieldValueType.text;
    if (type == ExerciseApi.FieldTypeEnum.BODY_MAP)
      return FieldValueType.bodyMap;
    if (type == ExerciseApi.FieldTypeEnum.ENUM) return FieldValueType.enumValue;
    throw UnimplementedError();
  }
}

extension ExerciseApiFieldParser on ExerciseApi.Field {
  static ExerciseApi.Field fromServiceField(Field element) =>
      element.toExerciseApiField();

  Field toServiceField() => ServiceFieldParser.fromExerciseApiField(this);
}
