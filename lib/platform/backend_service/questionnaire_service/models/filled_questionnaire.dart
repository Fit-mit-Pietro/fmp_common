part of questionnaire_service;

class FilledQuestionnaire{
  /// The unique id of this questionnaire
  String id;

  /// The label of the questinnaire
  String label;

  /// The ids of the questions inside this questionnaire
  List<FilledQuestionnaireElement> elements;


  // the length of the Questionnaire
  int get length => elements.length ?? 0;

  /// Returns a new [FilledQuestionnaire] instance.
  FilledQuestionnaire({
    required this.id,
    required this.label,
    required this.elements,
  });

  FilledQuestionnaireElement? getElementByQuestionId(String questionId){
    return elements.firstWhereOrNull((element) => element.filledQuestion.id == questionId);
  }

  @override
  String toString() {
    return 'FilledQuestionnaire{id: $id, label: $label, elements: $elements}';
  }
}