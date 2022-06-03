part of questionnaire_service;


extension ApiFilledQuestionExtension on API.FilledQuestion{
  static API.FilledQuestion fromServiceQuestion(FilledQuestion question) => API.FilledQuestion(
      id: question.id,
      userProperty: question.userProperty.toAPIProperty(),
      text: question.text
  );

  FilledQuestion toServiceQuestion() => FilledQuestion(
      id: this.id,
      userProperty: this.userProperty.fromServiceProperty(),
      text: this.text
  );
}

extension ServiceFilledQuestionExtension on FilledQuestion{

  static FilledQuestion fromApiQuestion(API.FilledQuestion question) => FilledQuestion(
      id: question.id,
      userProperty: question.userProperty.fromServiceProperty(),
      text: question.text
  );

  API.FilledQuestion toApiQuestion() => API.FilledQuestion(
      id: this.id,
      userProperty: this.userProperty.toAPIProperty(),
      text: this.text
  );
}