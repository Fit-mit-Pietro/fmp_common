

part of questionnaire_service;

class Questionnaire implements Identifiable{

  String label;
  String id;
  List<QuestionnaireElement> elements;

  // the length of the Questionnaire
  int get length => elements.length ?? 0;

  Questionnaire({
    required this.id,
    required this.label,
    required this.elements,
  });

  factory Questionnaire.createNew({
    String label = "Neuer Fragebogen"
  }) => Questionnaire(
      id: IdService.getId(),
      elements: [],
      label: label
  );


  @override
  String toString() {
    return 'Questionnaire{label: $label, id: $id, elements: $elements}';
  }

  @override
  String getId() => id;
}