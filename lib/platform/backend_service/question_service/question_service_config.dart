part of question_service;

class QuestionServiceConfig extends CRUDTemplateServiceConfig {
  QuestionServiceConfig({
    String serviceUrl = "http://10.0.2.2:3001",
  }) : super(
          serviceUrl: serviceUrl,
        );
}
