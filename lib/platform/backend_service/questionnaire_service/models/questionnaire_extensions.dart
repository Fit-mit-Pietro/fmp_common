part of questionnaire_service;

extension ServiceQuestionnaireParser on Questionnaire {
  static Questionnaire fromAPIQuestion(api.Questionnaire questionnaire) =>
      Questionnaire(
          id: questionnaire.id,
          label: questionnaire.label,
          elements: questionnaire.elements
              .map<QuestionnaireElement>((e) => e.toServiceQuestion())
              .toList());
  api.Questionnaire toAPIQuestion() => api.Questionnaire(
      id: id,
      label: label,
      elements: elements
          .map<api.QuestionnaireElement>((e) => e.toAPIQuestion())
          .toList());
}

extension APIQuestionnaireParser on api.Questionnaire {
  static api.Questionnaire fromServiceQuestion(Questionnaire questionnaire) =>
      api.Questionnaire(
          id: questionnaire.id,
          label: questionnaire.label,
          elements: questionnaire.elements
              .map<api.QuestionnaireElement>((e) => e.toAPIQuestion())
              .toList());

  Questionnaire toServiceQuestion() => Questionnaire(
      id: id,
      label: label,
      elements: elements
          .map<QuestionnaireElement>((e) => e.toServiceQuestion())
          .toList());
}
