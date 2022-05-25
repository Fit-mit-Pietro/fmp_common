
part of exercise_service;



extension ServiceExercisePropertyLinkParser on ExercisePropertyLink {

  static ExercisePropertyLink fromAPIExercisePropertyLink(API.Link element) => ExercisePropertyLink(
    id: element.id,
    userPropertyId: element.userPropertyId,
    exerciseId: element.exerciseId,
    values: element.values.map((e) => e.toServiceExercisePropertyLinkValue()).toList(),
  );

  API.Link toAPIExercisePropertyLink() => API.Link(
    id: this.id,
    userPropertyId: this.userPropertyId,
    exerciseId: this.exerciseId,
    values: this.values.map((e) => e.toAPIExercisePropertyLinkValue()).toList(),
  );

}

extension APIExercisePropertyLinkParser on API.Link {

  static API.Link fromServiceExercisePropertyLink(ExercisePropertyLink element)
  => element.toAPIExercisePropertyLink();

  ExercisePropertyLink toServiceExercisePropertyLink()
  => ServiceExercisePropertyLinkParser.fromAPIExercisePropertyLink(this);

}