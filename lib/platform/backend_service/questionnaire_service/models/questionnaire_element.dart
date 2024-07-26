part of questionnaire_service;

@JsonSerializable()
class QuestionnaireElement {
  @JsonKey(name: 'question_id')
  String questionId;

  @JsonKey(name: 'index')
  int index;

  @JsonKey(name: 'depends_on')
  Filter? dependency;

  QuestionnaireElement({
    required this.questionId,
    required this.index,
    this.dependency,
  });

  factory QuestionnaireElement.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireElementFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionnaireElementToJson(this);

  @override
  String toString() {
    return 'QuestionnaireElement{questionId: $questionId, index: $index, dependency: $dependency}';
  }
}
