part of questionnaire_service;

abstract class IQuestionnaireService
    implements ICRUDTemplateService<Questionnaire> {
  factory IQuestionnaireService(QuestionnaireServiceType userServiceType,
      QuestionnaireServiceConfig config) {
    switch (userServiceType) {
      case QuestionnaireServiceType.mock:
        return _QuestionnaireServiceMock(config);
      case QuestionnaireServiceType.real:
        return _QuestionnaireServiceRealRework(config);
      case QuestionnaireServiceType.rework:
        return _QuestionnaireServiceRealRework(config);
    }
  }

  Future<FilledQuestionnaire> getFilledQuestionnaireById(String id);
}
