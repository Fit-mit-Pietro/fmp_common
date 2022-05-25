

part of question_service;


class Question implements Identifiable{
  String label;
  String id;
  String userPropertyId;

  Question({
    required this.id,
    required this.label,
    required this.userPropertyId
  });

  factory Question.createNew({
    String userPropertyId = '!NONE!',
    String label = "Neue Frage"}
  ) => Question(
      id: IdService.getId(),
      userPropertyId:
      userPropertyId,label: label
  );


  @override
  String getId() => id;
}