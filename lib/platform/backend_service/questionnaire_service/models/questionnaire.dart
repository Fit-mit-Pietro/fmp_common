part of questionnaire_service;

@JsonSerializable()
class Questionnaire implements Identifiable {
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "label")
  String label;

  @JsonKey(name: "elements")
  List<QuestionnaireElement> elements;

  // the length of the Questionnaire
  int get length => elements.length;

  Questionnaire({
    required this.id,
    required this.label,
    required this.elements,
  });

  factory Questionnaire.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionnaireToJson(this);

  factory Questionnaire.createNew({String label = "Neuer Fragebogen"}) =>
      Questionnaire(id: IdService.getId(), elements: [], label: label);

  @override
  String toString() {
    return 'Questionnaire{label: $label, id: $id, elements: $elements}';
  }

  @override
  String getId() => id;

  @override
  String getLabel() => label;
}
