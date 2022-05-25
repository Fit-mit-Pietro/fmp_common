part of questionnaire_service;

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

  /// The index of this question within the Questionnaire
  int index;

  FilledQuestion filledQuestion;

  String get questionId => filledQuestion.id;
  String get propertyId => filledQuestion.userProperty.id;

  Filter? dependency;

}