part of questionnaire_service;

extension FilledQuestionnaireElementParser on FilledQuestionnaireElement {
  static FilledQuestionnaireElement fromAPIQuestion(
          API.FilledQuestionnaireElement element) =>
      FilledQuestionnaireElement(
          filledQuestion: element.question.toServiceQuestion(),
          index: element.index,
          dependency: element.dependsOn.toServiceFilter());

  API.FilledQuestionnaireElement toAPIQuestion() =>
      API.FilledQuestionnaireElement(
          question: filledQuestion.toApiQuestion(),
          index: index,
          dependsOn: dependency!.toQuestionnaireAPIFilter());
}

extension APIFilledQuestionnaireElementParser
    on API.FilledQuestionnaireElement {
  static API.FilledQuestionnaireElement fromServiceQuestion(
          FilledQuestionnaireElement element) =>
      element.toAPIQuestion();

  FilledQuestionnaireElement toServiceQuestion() =>
      FilledQuestionnaireElementParser.fromAPIQuestion(this);
}
