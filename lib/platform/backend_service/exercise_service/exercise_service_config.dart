part of exercise_service;

class ExerciseServiceConfig extends CRUDTemplateServiceConfig {
  ExerciseServiceConfig({
    String serviceUrl = "http://10.0.2.2",
  }) : super(
          serviceUrl: serviceUrl,
        );
}
