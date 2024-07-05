
part of questionnaire_service;

extension ServiceQuestionnaireParser on Questionnaire {

  static Questionnaire fromAPIQuestion(API.Questionnaire questionnaire) => Questionnaire(
    id: questionnaire.id,
    label: questionnaire.label,
    elements: questionnaire.elements.map<QuestionnaireElement>((e) => e.toServiceQuestion()).toList()
  );
  API.Questionnaire toAPIQuestion() => API.Questionnaire(
    id: id,
    label: label,
    elements: elements.map<API.QuestionnaireElement>((e) => e.toAPIQuestion()).toList()
  );

}

extension APIQuestionnaireParser on API.Questionnaire {

  static API.Questionnaire fromServiceQuestion(Questionnaire questionnaire) => API.Questionnaire(
      id: questionnaire.id,
      label: questionnaire.label,
      elements: questionnaire.elements.map<API.QuestionnaireElement>((e) => e.toAPIQuestion()).toList()
  );

  Questionnaire toServiceQuestion() => Questionnaire(
      id: id,
      label: label,
      elements: elements.map<QuestionnaireElement>((e) => e.toServiceQuestion()).toList()
  );

}