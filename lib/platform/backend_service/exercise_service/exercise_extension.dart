
part of exercise_service;



extension ServiceExerciseParser on Exercise {

  static Exercise fromAPIExercise(API.Exercise element) => Exercise(
    id: element.id,
    label: element.text,
    duration: element.duration?.toDouble(),
    difficulty: element.difficulty,
    description: element.description,
    exerciseType: fromAPIType(element.exerciseType),
    videoUrl: element.videoUrl,
  );

  API.Exercise toAPIExercise() => API.Exercise(
    text: this.label,
    id: this.id,
    duration: this.duration,
    difficulty: this.difficulty,
    description: this.description,
    exerciseType: fromServiceType(this.exerciseType ?? ExerciseType.ENDURANCE),
    videoUrl: this.videoUrl,
  );

  static API.ExerciseExerciseTypeEnum fromServiceType(ExerciseType type){
    switch(type) {
      case ExerciseType.ENDURANCE:
        return API.ExerciseExerciseTypeEnum.ENDURANCE;
      case ExerciseType.MUSCLE_BUILDING:
        return API.ExerciseExerciseTypeEnum.MUSCLE_BUILDING;
      case ExerciseType.STRENGTH:
        return API.ExerciseExerciseTypeEnum.STRENGTH;
      case ExerciseType.STRENGTH_ENDURANCE:
        return API.ExerciseExerciseTypeEnum.STRENGTH_ENDURANCE;
      case ExerciseType.MAXIMUM_STRENGTH:
        return API.ExerciseExerciseTypeEnum.MAXIMUM_STRENGTH;
      case ExerciseType.QUICK_STRENGTH:
        return API.ExerciseExerciseTypeEnum.QUICK_STRENGTH;
      case ExerciseType.FLEXIBILITY:
        return API.ExerciseExerciseTypeEnum.FLEXIBILITY;
      case ExerciseType.BALANCE:
        return API.ExerciseExerciseTypeEnum.BALANCE;
      case ExerciseType.RELAXATION:
        return API.ExerciseExerciseTypeEnum.RELAXATION;
    }
  }

  static ExerciseType fromAPIType(API.ExerciseExerciseTypeEnum type){
    switch(type){
      case API.ExerciseExerciseTypeEnum.MUSCLE_BUILDING:
        return ExerciseType.MUSCLE_BUILDING;
      case API.ExerciseExerciseTypeEnum.STRENGTH:
        return ExerciseType.STRENGTH;
      case API.ExerciseExerciseTypeEnum.STRENGTH_ENDURANCE:
        return ExerciseType.STRENGTH_ENDURANCE;
      case API.ExerciseExerciseTypeEnum.MAXIMUM_STRENGTH:
        return ExerciseType.MAXIMUM_STRENGTH;
      case API.ExerciseExerciseTypeEnum.QUICK_STRENGTH:
        return ExerciseType.QUICK_STRENGTH;
      case API.ExerciseExerciseTypeEnum.FLEXIBILITY:
        return ExerciseType.FLEXIBILITY;
      case API.ExerciseExerciseTypeEnum.BALANCE:
        return ExerciseType.BALANCE;
      case API.ExerciseExerciseTypeEnum.RELAXATION:
        return ExerciseType.RELAXATION;
      case API.ExerciseExerciseTypeEnum.ENDURANCE:
        return ExerciseType.ENDURANCE;
    }
    return ExerciseType.ENDURANCE;
  }
}

extension APIExerciseParser on API.Exercise {

  static API.Exercise fromServiceExercise(Exercise element)
  => element.toAPIExercise();

  Exercise toServiceExercise()
  => ServiceExerciseParser.fromAPIExercise(this);

}