
part of filter_lib;




extension QuestionnaireServiceFilterParser on Filter {

  static Filter fromQuestionnaireAPIFilter(QuestionnaireApi.Filter element) {
    return Filter(
        possibleFields: [element.field.toServiceField()],
        selectedField: element.field.toServiceField(),
        selectedFilterOperation: fromAPIType(element.operation),
        value: _castFromApiValue(element.propertyValue, element.field.toServiceField())
    );
  }

  static dynamic _castFromApiValue(String value,Field field){
    switch(field.type){

      case FieldValueType.bool:
        int index = int.tryParse(value) ?? 0;
        return index == 0? false: true;
      case FieldValueType.int:
        return int.tryParse(value);
      case FieldValueType.text:
        return value;
      case FieldValueType.bodyMap:
        return value;
      case FieldValueType.enumValue:
        return value;
    }
  }

  static dynamic _castFromServiceValue(dynamic value,Field field){
    switch(field.type){

      case FieldValueType.bool:
        bool b = value as bool;
        return b==false? "0":"1";

      case FieldValueType.int:
        return value.toString();
      case FieldValueType.text:
        return value.toString();
      case FieldValueType.bodyMap:
        return value.toString();
      case FieldValueType.enumValue:
        return value.toString();

    }
  }

  QuestionnaireApi.Filter toQuestionnaireAPIFilter() => QuestionnaireApi.Filter(
    field: getSelectedField().toQuestionnaireApiField(),
    operation: exerciseFromServiceType(this.selectedFilterOperation),
    propertyValue: _castFromServiceValue(this.value,this.getSelectedField()),

  );

  static QuestionnaireApi.FilterOperationEnum exerciseFromServiceType(FilterOperation type){
    switch(type){

      case FilterOperation.equal:
        return QuestionnaireApi.FilterOperationEnum.equal;

      case FilterOperation.notEqual:
        return QuestionnaireApi.FilterOperationEnum.notEqual;

      case FilterOperation.lower:
        return QuestionnaireApi.FilterOperationEnum.lower;

      case FilterOperation.higher:
        return QuestionnaireApi.FilterOperationEnum.higher;

      case FilterOperation.contains:
        return QuestionnaireApi.FilterOperationEnum.contains;
    }
  }
  /*
  static const equal = FilterOperationEnum._(r'equal');
  static const notEqual = FilterOperationEnum._(r'notEqual');
  static const lower = FilterOperationEnum._(r'lower');
  static const higher = FilterOperationEnum._(r'higher');
  static const contains = FilterOperationEnum._(r'contains');
   */

  static FilterOperation fromAPIType(QuestionnaireApi.FilterOperationEnum type){
    if(type == QuestionnaireApi.FilterOperationEnum.equal) return FilterOperation.equal;
    if(type == QuestionnaireApi.FilterOperationEnum.notEqual) return FilterOperation.notEqual;
    if(type == QuestionnaireApi.FilterOperationEnum.lower) return FilterOperation.lower;
    if(type == QuestionnaireApi.FilterOperationEnum.higher) return FilterOperation.higher;
    if(type == QuestionnaireApi.FilterOperationEnum.contains) return FilterOperation.contains;
    throw UnimplementedError();
  }


}

extension QuestionnaireAPIFilterParser on QuestionnaireApi.Filter {

  static QuestionnaireApi.Filter fromServiceFilter(Filter element)
  => element.toQuestionnaireAPIFilter();

  Filter toServiceFilter()
  => QuestionnaireServiceFilterParser.fromQuestionnaireAPIFilter(this);

}