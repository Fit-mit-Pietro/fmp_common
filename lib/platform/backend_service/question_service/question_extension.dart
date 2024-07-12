part of question_service;

extension SwaggerQuestionExtension on Question {
  swagger.Question toSwagger() => swagger.Question(
        id: id,
        text: label,
        userPropertyId: userPropertyId,
      );
}

extension ServiceQuestionParser on Question {
  static Question fromAPIQuestion(api.Question question) => Question(
        id: question.id,
        userPropertyId: question.userPropertyId,
        label: question.text,
      );

  api.Question toAPIQuestion() => api.Question(
        id: id,
        userPropertyId: userPropertyId,
        text: label,
      );
}

extension APIQuestionParser on api.Question {
  static api.Question fromServiceQuestion(Question question) => api.Question(
        id: question.id,
        userPropertyId: question.userPropertyId,
        text: question.label,
      );

  Question toServiceQuestion() => Question(
        id: id,
        userPropertyId: userPropertyId,
        label: text,
      );
}
