
part of exercise_service;



extension ServiceExercisePropertyLinkValueParser on ExercisePropertyLinkValue {

  static ExercisePropertyLinkValue fromAPIExercisePropertyLinkValue(API.ExercisePropertyLinkValue element) => ExercisePropertyLinkValue(
    value: element.value as double,
    filter: element.filter.toServiceFilter()
  );

  API.ExercisePropertyLinkValue toAPIExercisePropertyLinkValue() => API.ExercisePropertyLinkValue(
    filter: this.filter.toExerciseAPIFilter(),
    value: this.value,
  );

}

extension APIExercisePropertyLinkValueParser on API.ExercisePropertyLinkValue {

  static API.ExercisePropertyLinkValue fromServiceExercisePropertyLinkValue(ExercisePropertyLinkValue element)
  => element.toAPIExercisePropertyLinkValue();

  ExercisePropertyLinkValue toServiceExercisePropertyLinkValue()
  => ServiceExercisePropertyLinkValueParser.fromAPIExercisePropertyLinkValue(this);

}