
part of question_service;

extension ServiceQuestionParser on Question {

  static Question fromAPIQuestion(API.Question question) => Question(
    id: question.id,
    userPropertyId: question.userPropertyId,
    label: question.text
  );
  API.Question toAPIQuestion() => API.Question(
      id: this.id,
      userPropertyId: this.userPropertyId,
      text: this.label
  );

}

extension APIQuestionParser on API.Question {

  static API.Question fromServiceQuestion(Question question) => API.Question(
      id: question.id,
      userPropertyId: question.userPropertyId,
      text: question.label
  );

  Question toServiceQuestion() => Question(
      id: this.id,
      userPropertyId: this.userPropertyId,
      label: this.text
  );

}