part of questionnaire_service;

extension QuestionnaireElementParser on QuestionnaireElement {
  static QuestionnaireElement fromAPIQuestion(
          api.QuestionnaireElement element) =>
      QuestionnaireElement(
          questionId: element.questionId,
          index: element.index,
          dependency: element.dependsOn.toServiceFilter());
  api.QuestionnaireElement toAPIQuestion() => api.QuestionnaireElement(
      questionId: questionId,
      index: index,
      dependsOn: dependency!.toQuestionnaireAPIFilter());
}

extension APIQuestionnaireElementParser on api.QuestionnaireElement {
  static api.QuestionnaireElement fromServiceQuestion(
          QuestionnaireElement element) =>
      api.QuestionnaireElement(
          questionId: element.questionId,
          index: element.index,
          dependsOn: element.dependency!.toQuestionnaireAPIFilter());

  QuestionnaireElement toServiceQuestion() => QuestionnaireElement(
        questionId: questionId,
        index: index,
        dependency: dependsOn.toServiceFilter(),
      );
}
