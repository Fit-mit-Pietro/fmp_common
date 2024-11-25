part of questionnaire_service;

@JsonSerializable()
class FilledQuestionnaire {
  /// The unique id of this questionnaire
  @JsonKey(name: 'id')
  String id;

  /// The label of the questinnaire
  @JsonKey(name: 'label')
  String label;

  /// The ids of the questions inside this questionnaire
  @JsonKey(name: 'elements')
  List<FilledQuestionnaireElement> elements;

  // the length of the Questionnaire
  int get length => elements.length;

  /// Returns a new [FilledQuestionnaire] instance.
  FilledQuestionnaire({
    required this.id,
    required this.label,
    required this.elements,
  });

  factory FilledQuestionnaire.fromJson(Map<String, dynamic> json) =>
      _$FilledQuestionnaireFromJson(json);

  Map<String, dynamic> toJson() => _$FilledQuestionnaireToJson(this);

  FilledQuestionnaireElement? getElementByQuestionId(String questionId) {
    return elements
        .firstWhereOrNull((element) => element.filledQuestion.id == questionId);
  }

  @override
  String toString() {
    return 'FilledQuestionnaire{id: $id, label: $label, elements: $elements}';
  }
}
