
part of exercise_service;

enum ExerciseType {
  ENDURANCE,
  MUSCLE_BUILDING,
  STRENGTH,
  STRENGTH_ENDURANCE,
  MAXIMUM_STRENGTH,
  QUICK_STRENGTH,
  FLEXIBILITY,
  BALANCE,
  RELAXATION,
}

class ExercisePropertyTypeMapper{
  static Map<ExerciseType,String> labelMap = {
    ExerciseType.ENDURANCE: "Ausdauer",
    ExerciseType.MUSCLE_BUILDING: "Muskelaufbau",
    ExerciseType.STRENGTH: "Kraft",
    ExerciseType.STRENGTH_ENDURANCE: "Kraftausdauer",
    ExerciseType.MAXIMUM_STRENGTH: "Maximalkraft",
    ExerciseType.QUICK_STRENGTH: "Schnellkraft",
    ExerciseType.FLEXIBILITY: "Beweglichkeit",
    ExerciseType.BALANCE: "Gleichgewicht",
    ExerciseType.RELAXATION: "Entspannung",
  };

  static Map<String,String> stringKeyLabelMap = {
    "ENDURANCE": "Ausdauer",
    "MUSCLE_BUILDING": "Muskelaufbau",
    "STRENGTH": "Kraft",
    "STRENGTH_ENDURANCE": "Kraftausdauer",
    "MAXIMUM_STRENGTH": "Maximalkraft",
    "QUICK_STRENGTH": "Schnellkraft",
    "FLEXIBILITY": "Beweglichkeit",
    "BALANCE": "Gleichgewicht",
    "RELAXATION": "Entspannung",
  };

  static Map<ExerciseType,String> keyMap = {
    ExerciseType.ENDURANCE: "ENDURANCE",
    ExerciseType.MUSCLE_BUILDING: "MUSCLE_BUILDING",
    ExerciseType.STRENGTH: "STRENGTH",
    ExerciseType.STRENGTH_ENDURANCE: "STRENGTH_ENDURANCE",
    ExerciseType.MAXIMUM_STRENGTH: "MAXIMUM_STRENGTH",
    ExerciseType.QUICK_STRENGTH: "QUICK_STRENGTH",
    ExerciseType.FLEXIBILITY: "FLEXIBILITY",
    ExerciseType.BALANCE: "BALANCE",
    ExerciseType.RELAXATION: "RELAXATION",
  };

  static ExerciseType fromKey(String key){
    return keyMap.keys.firstWhere(
            (k) => keyMap[k] == key,
        orElse: () => keyMap.keys.first
    );
  }
}

class Exercise implements Identifiable{

  String id;
  String label;
  String? description;
  String? videoUrl;
  ExerciseType? exerciseType;
  int? difficulty;  // range 1- 10
  double? duration; // in minutes

  Exercise({
    required this.id,
    required this.label,
    this.description,
    this.videoUrl,
    this.exerciseType,
    this.difficulty,
    this.duration,
  });

  factory Exercise.createNew({
    String label = "Neue Übung",
    String? id,
  }) => Exercise(
      id: id ?? IdService.getId(),
      label: label,
  );

  @override
  String getId() => id;

  @override
  String getLabel() => label;
}