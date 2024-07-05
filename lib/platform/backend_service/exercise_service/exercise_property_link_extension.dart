part of exercise_service;

extension ServiceExercisePropertyLinkParser on ExercisePropertyLink {
  static ExercisePropertyLink fromAPIExercisePropertyLink(api.Link element) =>
      ExercisePropertyLink(
        id: element.id,
        userPropertyId: element.userPropertyId,
        exerciseId: element.exerciseId,
        values: element.values
            .map((e) => e.toServiceExercisePropertyLinkValue())
            .toList(),
      );

  api.Link toAPIExercisePropertyLink() => api.Link(
        id: id,
        userPropertyId: userPropertyId,
        exerciseId: exerciseId,
        values: values.map((e) => e.toAPIExercisePropertyLinkValue()).toList(),
      );
}

extension APIExercisePropertyLinkParser on api.Link {
  static api.Link fromServiceExercisePropertyLink(
          ExercisePropertyLink element) =>
      element.toAPIExercisePropertyLink();

  ExercisePropertyLink toServiceExercisePropertyLink() =>
      ServiceExercisePropertyLinkParser.fromAPIExercisePropertyLink(this);
}
