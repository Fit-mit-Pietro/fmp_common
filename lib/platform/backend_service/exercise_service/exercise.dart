part of exercise_service;

enum ExerciseType {
  @JsonValue('ENDURANCE')
  endurance,
  @JsonValue('MUSCLE_BUILDING')
  muscleBuilding,
  @JsonValue('STRENGTH')
  strength,
  @JsonValue('STRENGTH_ENDURANCE')
  strengthEndurance,
  @JsonValue('MAXIMUM_STRENGTH')
  maximumStrength,
  @JsonValue('QUICK_STRENGTH')
  quickStrength,
  @JsonValue('FLEXIBILITY')
  flexibility,
  @JsonValue('BALANCE')
  balance,
  @JsonValue('RELAXATION')
  relaxation,
}

enum ExercisePhase {
  @JsonValue('WARMUP')
  warmup,
  @JsonValue('MAIN_WORKOUT')
  mainWorkout,
  @JsonValue('COOLDOWN')
  cooldown,
  ;

  static final Map<ExercisePhase, String> labelByValue = {
    ExercisePhase.warmup: 'Warmup',
    ExercisePhase.mainWorkout: 'Hauptteil',
    ExercisePhase.cooldown: 'Cooldown',
  };

  static final Map<String, String> labelByKey = {
    'WARMUP': 'Warmup',
    'MAIN_WORKOUT': 'Hauptteil',
    'COOLDOWN': 'Cooldown',
  };

  static final Map<ExercisePhase, String> keyByValue = {
    ExercisePhase.warmup: 'WARMUP',
    ExercisePhase.mainWorkout: 'MAIN_WORKOUT',
    ExercisePhase.cooldown: 'COOLDOWN',
  };

  static final Map<String, ExercisePhase> valueByKey = {
    'WARMUP': ExercisePhase.warmup,
    'MAIN_WORKOUT': ExercisePhase.mainWorkout,
    'COOLDOWN': ExercisePhase.cooldown,
  };
}

class ExercisePropertyTypeMapper {
  static Map<ExerciseType, String> labelMap = {
    ExerciseType.endurance: "Ausdauer",
    ExerciseType.muscleBuilding: "Muskelaufbau",
    ExerciseType.strength: "Kraft",
    ExerciseType.strengthEndurance: "Kraftausdauer",
    ExerciseType.maximumStrength: "Maximalkraft",
    ExerciseType.quickStrength: "Schnellkraft",
    ExerciseType.flexibility: "Beweglichkeit",
    ExerciseType.balance: "Gleichgewicht",
    ExerciseType.relaxation: "Entspannung",
  };

  static Map<String, String> stringKeyLabelMap = {
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

  static Map<ExerciseType, String> keyMap = {
    ExerciseType.endurance: "ENDURANCE",
    ExerciseType.muscleBuilding: "MUSCLE_BUILDING",
    ExerciseType.strength: "STRENGTH",
    ExerciseType.strengthEndurance: "STRENGTH_ENDURANCE",
    ExerciseType.maximumStrength: "MAXIMUM_STRENGTH",
    ExerciseType.quickStrength: "QUICK_STRENGTH",
    ExerciseType.flexibility: "FLEXIBILITY",
    ExerciseType.balance: "BALANCE",
    ExerciseType.relaxation: "RELAXATION",
  };

  static ExerciseType fromKey(String key) {
    return keyMap.keys
        .firstWhere((k) => keyMap[k] == key, orElse: () => keyMap.keys.first);
  }
}

@JsonSerializable()
class Exercise implements Identifiable {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'text')
  String label;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'video_url')
  String? videoUrl;
  @JsonKey(name: 'exercise_type')
  ExerciseType? exerciseType;
  @JsonKey(name: 'difficulty')
  int? difficulty; // range 1- 10
  @JsonKey(name: 'duration')
  double? duration; // in minutes

  @JsonKey(name: 'volume')
  int? volume;

  @JsonKey(name: 'phase', defaultValue: ExercisePhase.mainWorkout)
  ExercisePhase phase;

  Exercise({
    required this.id,
    required this.label,
    this.description,
    this.videoUrl,
    this.exerciseType,
    this.difficulty,
    this.duration,
    this.phase = ExercisePhase.mainWorkout,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseToJson(this);

  factory Exercise.createNew({
    String label = "Neue Übung",
    String? id,
  }) =>
      Exercise(
        id: id ?? IdService.getId(),
        label: label,
      );

  @override
  String getId() => id;

  @override
  String getLabel() => label;
}
