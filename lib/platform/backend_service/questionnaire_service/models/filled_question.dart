part of questionnaire_service;

@JsonSerializable()
class FilledQuestion {
  /// The unique id of this question
  @JsonKey(name: 'id')
  String id;

  /// The text the end user is shown if he has to answer the question
  @JsonKey(name: 'text')
  String text;

  @JsonKey(name: 'user_property')
  UserProperty userProperty;

  /// Returns a new [FilledQuestion] instance.
  FilledQuestion({
    required this.id,
    required this.text,
    required this.userProperty,
  });

  factory FilledQuestion.fromJson(Map<String, dynamic> json) =>
      _$FilledQuestionFromJson(json);
  Map<String, dynamic> toJson() => _$FilledQuestionToJson(this);

  @override
  String toString() {
    return 'FilledQuestion{id: $id, text: $text, userProperty: $userProperty}';
  }
}
