

part of questionnaire_service;



extension FilledQuestionnaireElementParser on FilledQuestionnaireElement {

  static FilledQuestionnaireElement fromAPIQuestion(API.FilledQuestionnaireElement element) => FilledQuestionnaireElement(
    filledQuestion: element.question.toServiceQuestion(),
    index: element.index,
    dependency: element.dependsOn == null ? null : element.dependsOn.toServiceFilter()
  );

  API.FilledQuestionnaireElement toAPIQuestion() => API.FilledQuestionnaireElement(
    question: this.filledQuestion.toApiQuestion(),
    index: this.index,
    dependsOn: this.dependency?.toQuestionnaireAPIFilter() ?? null
  );

}

extension APIFilledQuestionnaireElementParser on API.FilledQuestionnaireElement {

  static API.FilledQuestionnaireElement fromServiceQuestion(FilledQuestionnaireElement element)
   => element.toAPIQuestion();

  FilledQuestionnaireElement toServiceQuestion()
    => FilledQuestionnaireElementParser.fromAPIQuestion(this);

}