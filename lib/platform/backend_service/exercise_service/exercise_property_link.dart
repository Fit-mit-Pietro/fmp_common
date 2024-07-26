part of exercise_service;

@JsonSerializable()
class ExercisePropertyLink implements Identifiable {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'user_property_id')
  String userPropertyId;

  @JsonKey(name: 'exercise_id')
  String exerciseId;

  @JsonKey(name: 'values')
  List<ExercisePropertyLinkValue> values;

  factory ExercisePropertyLink.fromJson(Map<String, dynamic> json) =>
      _$ExercisePropertyLinkFromJson(json);
  Map<String, dynamic> toJson() => _$ExercisePropertyLinkToJson(this);

  factory ExercisePropertyLink.createNew({
    required String userPropertyId,
    required String exerciseId,
    double value = .0,
  }) =>
      ExercisePropertyLink(
          id: IdService.getId(),
          userPropertyId: userPropertyId,
          exerciseId: exerciseId,
          values: []);

  ExercisePropertyLink({
    required this.id,
    required this.userPropertyId,
    required this.exerciseId,
    required this.values,
  });

  @override
  String getId() => id;

  @override
  String getLabel() => id;
}
