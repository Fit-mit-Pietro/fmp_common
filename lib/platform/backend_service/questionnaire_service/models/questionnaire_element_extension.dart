
part of questionnaire_service;

extension QuestionnaireElementParser on QuestionnaireElement {

  static QuestionnaireElement fromAPIQuestion(API.QuestionnaireElement element) => QuestionnaireElement(
    questionId: element.questionId,
    index: element.index,
    dependency: element.dependsOn?.toServiceFilter()
  );
  API.QuestionnaireElement toAPIQuestion() => API.QuestionnaireElement(
    questionId: this.questionId,
    index: this.index,
    dependsOn: this.dependency?.toQuestionnaireAPIFilter()
  );

}

extension APIQuestionnaireElementParser on API.QuestionnaireElement {

  static API.QuestionnaireElement fromServiceQuestion(QuestionnaireElement element) => API.QuestionnaireElement(
    questionId: element.questionId,
    index: element.index,
    dependsOn: element.dependency?.toQuestionnaireAPIFilter()
  );

  QuestionnaireElement toServiceQuestion() => QuestionnaireElement(
    questionId: this.questionId,
    index: this.index,
    dependency: this.dependsOn?.toServiceFilter(),
  );

}