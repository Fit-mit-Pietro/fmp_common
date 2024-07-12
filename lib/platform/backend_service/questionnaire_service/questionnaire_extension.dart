part of questionnaire_service;

extension SwaggerQuestionnaireExtension on Questionnaire {
  swagger.Questionnaire toSwagger() => swagger.Questionnaire(
        id: id,
        label: label,
        elements: elements.map((e) => e.toSwagger()).toList(),
      );
}

extension SwaggerQuestionnaireElement on QuestionnaireElement {
  swagger.QuestionnaireElement toSwagger() => swagger.QuestionnaireElement(
        index: index,
        questionId: questionId,
        dependsOn: dependency?.toSwagger(),
      );
}

extension SwaggerQuestionnaireFilterExtension on Filter {
  swagger.Filter toSwagger() => swagger.Filter(
      field: getSelectedField().toSwagger(),
      operation: selectedFilterOperation.toSwagger(),
      propertyValue: value);
}

extension SwaggerQuestionnaireFilterFieldExtension on Field {
  swagger.Field toSwagger() => swagger.Field(
        id: id,
        label: label,
        type: type.toSwagger(),
        propertyOptions: throw UnimplementedError(),
      );
}

extension SwaggerQuestionnaireFilterFieldValueTypeExtension on FieldValueType {
  swagger_enums.FieldType toSwagger() {
    switch (this) {
      case FieldValueType.bool:
        return swagger_enums.FieldType.bool;
      case FieldValueType.int:
        return swagger_enums.FieldType.int;
      case FieldValueType.text:
        return swagger_enums.FieldType.fullText;
      case FieldValueType.bodyMap:
        return swagger_enums.FieldType.bodyMap;
      case FieldValueType.enumValue:
        return swagger_enums.FieldType.$enum;
      case FieldValueType.datesInWeek:
        return swagger_enums.FieldType.datesInWeek;
    }
  }
}

extension SwaggerQuestionnaireFilterOperationExtension on FilterOperation {
  swagger.FilterOperation toSwagger() {
    switch (this) {
      case FilterOperation.equal:
        return swagger.FilterOperation.equal;
      case FilterOperation.notEqual:
        return swagger.FilterOperation.notequal;
      case FilterOperation.lower:
        return swagger.FilterOperation.lower;
      case FilterOperation.higher:
        return swagger.FilterOperation.higher;
      case FilterOperation.contains:
        return swagger.FilterOperation.contains;
    }
  }
}
