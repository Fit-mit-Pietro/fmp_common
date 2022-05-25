
part of exercise_service;


class Exercise implements Identifiable{

  String id;
  String label;

  Exercise({
    required this.id,
    required this.label,
  });

  factory Exercise.createNew({
    String label = "Neue Übung",
    String? id,
  }) => Exercise(
      id: id ?? IdService.getId(),
      label: label,
  );

  @override
  String getId() => this.id;

}