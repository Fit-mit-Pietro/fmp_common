part of question_service;

class QuestionServiceConfig extends CRUDTemplateServiceConfig{

  QuestionServiceConfig({
    SERVICE_URL = "http://10.0.2.2:3001",
  }) : super(
    SERVICE_URL: SERVICE_URL,
  );
}