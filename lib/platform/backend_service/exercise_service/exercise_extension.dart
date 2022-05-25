
part of exercise_service;



extension ServiceExerciseParser on Exercise {

  static Exercise fromAPIExercise(API.Exercise element) => Exercise(
    id: element.id,
    label: element.text,

  );

  API.Exercise toAPIExercise() => API.Exercise(
    text: this.label,
    id: this.id,
  );

}

extension APIExerciseParser on API.Exercise {

  static API.Exercise fromServiceExercise(Exercise element)
  => element.toAPIExercise();

  Exercise toServiceExercise()
  => ServiceExerciseParser.fromAPIExercise(this);

}