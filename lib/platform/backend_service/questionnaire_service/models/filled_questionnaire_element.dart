part of questionnaire_service;

@JsonSerializable()
class FilledQuestionnaireElement {
  /// Returns a new [FilledQuestionnaireElement] instance.
  FilledQuestionnaireElement({
    required this.index,
    required this.filledQuestion,
    this.dependency,
  });

  @override
  String toString() {
    return 'FilledQuestionnaireElement{index: $index, filledQuestion: $filledQuestion, dependency: $dependency}';
  }

  factory FilledQuestionnaireElement.fromJson(Map<String, dynamic> json) =>
      _$FilledQuestionnaireElementFromJson(json);
  Map<String, dynamic> toJson() => _$FilledQuestionnaireElementToJson(this);

  /// The index of this question within the Questionnaire
  @JsonKey(name: 'index')
  int index;

  @JsonKey(name: 'question')
  FilledQuestion filledQuestion;

  String get questionId => filledQuestion.id;
  String get propertyId => filledQuestion.userProperty.id;

  @JsonKey(name: 'depends_on')
  Filter? dependency;
}
