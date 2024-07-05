part of exercise_service;

extension ServiceExerciseParser on Exercise {
  static Exercise fromAPIExercise(api.Exercise element) => Exercise(
        id: element.id,
        label: element.text,
        duration: element.duration.toDouble(),
        difficulty: element.difficulty,
        description: element.description,
        exerciseType: fromAPIType(element.exerciseType),
        videoUrl: element.videoUrl,
      );

  api.Exercise toAPIExercise() => api.Exercise(
        text: label,
        id: id,
        duration: duration!,
        difficulty: difficulty!,
        description: description!,
        exerciseType: fromServiceType(exerciseType ?? ExerciseType.ENDURANCE),
        videoUrl: videoUrl!,
      );

  static api.ExerciseExerciseTypeEnum fromServiceType(ExerciseType type) {
    switch (type) {
      case ExerciseType.ENDURANCE:
        return api.ExerciseExerciseTypeEnum.ENDURANCE;
      case ExerciseType.MUSCLE_BUILDING:
        return api.ExerciseExerciseTypeEnum.MUSCLE_BUILDING;
      case ExerciseType.STRENGTH:
        return api.ExerciseExerciseTypeEnum.STRENGTH;
      case ExerciseType.STRENGTH_ENDURANCE:
        return api.ExerciseExerciseTypeEnum.STRENGTH_ENDURANCE;
      case ExerciseType.MAXIMUM_STRENGTH:
        return api.ExerciseExerciseTypeEnum.MAXIMUM_STRENGTH;
      case ExerciseType.QUICK_STRENGTH:
        return api.ExerciseExerciseTypeEnum.QUICK_STRENGTH;
      case ExerciseType.FLEXIBILITY:
        return api.ExerciseExerciseTypeEnum.FLEXIBILITY;
      case ExerciseType.BALANCE:
        return api.ExerciseExerciseTypeEnum.BALANCE;
      case ExerciseType.RELAXATION:
        return api.ExerciseExerciseTypeEnum.RELAXATION;
    }
  }

  static ExerciseType fromAPIType(api.ExerciseExerciseTypeEnum type) {
    switch (type) {
      case api.ExerciseExerciseTypeEnum.MUSCLE_BUILDING:
        return ExerciseType.MUSCLE_BUILDING;
      case api.ExerciseExerciseTypeEnum.STRENGTH:
        return ExerciseType.STRENGTH;
      case api.ExerciseExerciseTypeEnum.STRENGTH_ENDURANCE:
        return ExerciseType.STRENGTH_ENDURANCE;
      case api.ExerciseExerciseTypeEnum.MAXIMUM_STRENGTH:
        return ExerciseType.MAXIMUM_STRENGTH;
      case api.ExerciseExerciseTypeEnum.QUICK_STRENGTH:
        return ExerciseType.QUICK_STRENGTH;
      case api.ExerciseExerciseTypeEnum.FLEXIBILITY:
        return ExerciseType.FLEXIBILITY;
      case api.ExerciseExerciseTypeEnum.BALANCE:
        return ExerciseType.BALANCE;
      case api.ExerciseExerciseTypeEnum.RELAXATION:
        return ExerciseType.RELAXATION;
      case api.ExerciseExerciseTypeEnum.ENDURANCE:
        return ExerciseType.ENDURANCE;
    }
    return ExerciseType.ENDURANCE;
  }
}

extension APIExerciseParser on api.Exercise {
  static api.Exercise fromServiceExercise(Exercise element) =>
      element.toAPIExercise();

  Exercise toServiceExercise() => ServiceExerciseParser.fromAPIExercise(this);
}
