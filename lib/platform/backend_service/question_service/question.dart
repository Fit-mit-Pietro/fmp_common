part of question_service;

@JsonSerializable()
class Question implements Identifiable {
  @JsonKey(name: 'id', required: true)
  String id;
  @JsonKey(name: 'text', required: true)
  String label;
  @JsonKey(name: 'user_property_id', required: true)
  String userPropertyId;

  Question({
    required this.id,
    required this.label,
    required this.userPropertyId,
  });

  factory Question.createNew({
    String userPropertyId = '!NONE!',
    String label = "Neue Frage",
  }) =>
      Question(
        id: IdService.getId(),
        userPropertyId: userPropertyId,
        label: label,
      );

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  @override
  String getId() => id;

  @override
  String getLabel() => label;
}
