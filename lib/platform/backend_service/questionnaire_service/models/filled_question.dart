part of questionnaire_service;


class FilledQuestion{
  /// The unique id of this question
  String id;

  /// The text the end user is shown if he has to answer the question
  String text;

  UserProperty userProperty;


  /// Returns a new [FilledQuestion] instance.
  FilledQuestion({
    required this.id,
    required this.text,
    required this.userProperty,
  });

  @override
  String toString() {
    return 'FilledQuestion{id: $id, text: $text, userProperty: $userProperty}';
  }

}