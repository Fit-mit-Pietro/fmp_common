part of exercise_service;

@JsonSerializable()
class ExercisePropertyLinkValue {
  @JsonKey(name: 'filter')
  Filter filter;

  @JsonKey(name: 'value')
  double value;

  ExercisePropertyLinkValue({
    required this.filter,
    required this.value,
  });

  factory ExercisePropertyLinkValue.fromJson(Map<String, dynamic> json) =>
      _$ExercisePropertyLinkValueFromJson(json);

  Map<String, dynamic> toJson() => _$ExercisePropertyLinkValueToJson(this);
}
