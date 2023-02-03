
part of filter_lib;




extension QuestionnaireServiceFieldParser on Field {

  static Field fromQuestionnaireApiField(QuestionnaireApi.Field element) => Field(
    type: fromQuestionnaireApiType(element.type),
    id: element.id,
    label: element.label,
    enumValues: ObjectToMap(element.propertyOptions),
  );

  static Map<String,String>? ObjectToMap(Object object){
    if(object == null) return null;
    try{

      Map map = jsonDecode(jsonEncode(object));
      map = map.cast<String,String>();

      if(map is Map<String,String>) return map;

    }catch(e){
      print(e);
    }
  }

  QuestionnaireApi.Field toQuestionnaireApiField() => QuestionnaireApi.Field(
      type: fromServiceType(this.type),
      id: this.id,
      label: this.label,
      propertyOptions: this.enumValues
  );

  static QuestionnaireApi.FieldTypeEnum fromServiceType(FieldValueType type){
    switch(type){
      case FieldValueType.bool:
        return QuestionnaireApi.FieldTypeEnum.BOOL;
      case FieldValueType.int:
        return QuestionnaireApi.FieldTypeEnum.INT;
      case FieldValueType.text:
        return QuestionnaireApi.FieldTypeEnum.FULL_TEXT;
      case FieldValueType.bodyMap:
        return QuestionnaireApi.FieldTypeEnum.BODY_MAP;
      case FieldValueType.enumValue:
        return QuestionnaireApi.FieldTypeEnum.ENUM;
      case FieldValueType.datesInWeek:
        return QuestionnaireApi.FieldTypeEnum.DATES_IN_WEEK;
    }
  }

  static FieldValueType fromQuestionnaireApiType(QuestionnaireApi.FieldTypeEnum type){
    if(type == QuestionnaireApi.FieldTypeEnum.BOOL) return FieldValueType.bool;
    if(type == QuestionnaireApi.FieldTypeEnum.INT) return FieldValueType.int;
    if(type == QuestionnaireApi.FieldTypeEnum.FULL_TEXT) return FieldValueType.text;
    if(type == QuestionnaireApi.FieldTypeEnum.BODY_MAP) return FieldValueType.bodyMap;
    if(type == QuestionnaireApi.FieldTypeEnum.ENUM) return FieldValueType.enumValue;
    throw UnimplementedError();
  }


}

extension QuestionnaireApiFieldParser on QuestionnaireApi.Field {

  static QuestionnaireApi.Field fromServiceField(Field element)
  => element.toQuestionnaireApiField();

  Field toServiceField()
  => QuestionnaireServiceFieldParser.fromQuestionnaireApiField(this);

}