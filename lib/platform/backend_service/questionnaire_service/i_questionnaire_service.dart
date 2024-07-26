part of questionnaire_service;

abstract class IQuestionnaireService
    implements ICRUDTemplateService<Questionnaire> {
  factory IQuestionnaireService(QuestionnaireServiceType userServiceType,
      QuestionnaireServiceConfig config) {
    switch (userServiceType) {
      case QuestionnaireServiceType.mock:
        return _QuestionnaireServiceMock(config);
      case QuestionnaireServiceType.real:
        return _QuestionnaireServiceReal_Rework(config);
      case QuestionnaireServiceType.rework:
        return _QuestionnaireServiceReal_Rework(config);
    }
  }

  Future<FilledQuestionnaire> getFilledQuestionnaireById(String id);
}
