
part of exercise_service;

abstract class IExerciseService implements ICRUDTemplateService<Exercise>{
  factory IExerciseService(
      ExerciseServiceType userServiceType,
      ExerciseServiceConfig config
      ){
    switch(userServiceType){

      case ExerciseServiceType.mock:
        return _ExerciseServiceMock(config);
      case ExerciseServiceType.real:
        return _ExerciseServiceReal(config);
    }
  }

  Future<ExercisePropertyLink> addLink(ExercisePropertyLink link);

  Future deleteLink(String linkId);

  Future getLink(String linkId);

  Future updateLink(String id, ExercisePropertyLink link);

  Future<List<ExercisePropertyLink>> getLinkList({
    List<String>? ids,int? count,int? offset
  });

  Future<List<ExercisePropertyLink>> getLinksOfUserProperty(String userPropertyId);

  Future<List<ExercisePropertyLink>> getLinksOfExercise(String exerciseId);

  Future<String> uploadFile(String id, MultipartFile file);
}