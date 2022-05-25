part of exercise_service;

class ExerciseServiceConfig extends CRUDTemplateServiceConfig{

  ExerciseServiceConfig({
    SERVICE_URL = "http://10.0.2.2",
  }) : super(
      SERVICE_URL: SERVICE_URL,
  );

}
