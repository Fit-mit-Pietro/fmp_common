part of questionnaire_service;

class QuestionnaireServiceConfig extends CRUDTemplateServiceConfig {
  QuestionnaireServiceConfig({
    String serviceUrl = "http://10.0.2.2:3001",
  }) : super(
          serviceUrl: serviceUrl,
        );
}
