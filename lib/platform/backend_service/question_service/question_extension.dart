part of question_service;

extension SwaggerQuestionExtension on Question {
  swagger.Question toSwagger() => swagger.Question(
        id: id,
        text: label,
        userPropertyId: userPropertyId,
      );
}
