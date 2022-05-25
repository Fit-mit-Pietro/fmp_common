part of questionnaire_service;

class QuestionnaireServiceConfig extends CRUDTemplateServiceConfig{

  QuestionnaireServiceConfig({
    SERVICE_URL = "http://10.0.2.2:3001",
  }) : super(
      SERVICE_URL: SERVICE_URL,
  );
}