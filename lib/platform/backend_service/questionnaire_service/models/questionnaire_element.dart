part of questionnaire_service;

class QuestionnaireElement{
  String questionId;
  int index;
  Filter? dependency;

  QuestionnaireElement({
    required this.questionId,
    required this.index,
    this.dependency,
  });

  @override
  String toString() {
    return 'QuestionnaireElement{questionId: $questionId, index: $index, dependency: $dependency}';
  }
}