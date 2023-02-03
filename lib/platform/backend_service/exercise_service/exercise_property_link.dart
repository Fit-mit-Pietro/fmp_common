

part of exercise_service;

class ExercisePropertyLink implements Identifiable{

  String id;
  String userPropertyId;
  String exerciseId;
  List<ExercisePropertyLinkValue> values;

  factory ExercisePropertyLink.createNew({
    required String userPropertyId,
    required String exerciseId,
    double value = .0,
  }) => ExercisePropertyLink(
      id: IdService.getId(),
      userPropertyId: userPropertyId,
      exerciseId: exerciseId,
      values: []
  );

  ExercisePropertyLink({
    required this.id,
    required this.userPropertyId,
    required this.exerciseId,
    required this.values
  });

  @override
  String getId() => id;

  @override
  String getLabel() => this.id;

}

