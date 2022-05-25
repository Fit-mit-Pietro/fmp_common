
part of exercise_service;


class _ExerciseServiceMock
    extends CRUDTemplateServiceMock<Exercise>
    implements IExerciseService
{

  ExerciseServiceConfig _config;

  List<ExercisePropertyLink> _linkDb = [];

  _ExerciseServiceMock(this._config):super(_config){
    create(Exercise.createNew(
      label: "Übung 1",
    ));
    create(Exercise.createNew(
      label: "Übung 2",
    ));
    create(Exercise.createNew(
      label: "Übung 3",
    ));
  }

  @override
  Future<ExercisePropertyLink> addLink(ExercisePropertyLink link) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _linkDb.add(link);
    return link;
  }

  @override
  Future deleteLink(String linkId) async{
    await Future.delayed(Duration(milliseconds: 500));

    ExercisePropertyLink object = _linkDb.firstWhere((element) => element.getId() == linkId);
    _linkDb.removeWhere((element) => element.getId() == linkId);
    return object;
  }

  @override
  Future getLink(String linkId) async{
    await Future.delayed(Duration(milliseconds: 500));
    ExercisePropertyLink object = _linkDb.firstWhere((element) => element.getId() == linkId);
    return object;
  }

  @override
  Future<List<ExercisePropertyLink>> getLinksOfExercise(String exerciseId)async {
    await Future.delayed(Duration(milliseconds: 500));

    List<ExercisePropertyLink> objects = List<ExercisePropertyLink>.from(_linkDb);

    objects = objects
        .where((element) => element.exerciseId == exerciseId)
        .toList();

    return objects;
  }

  @override
  Future<List<ExercisePropertyLink>> getLinksOfUserProperty(String userPropertyId) async{
    await Future.delayed(Duration(milliseconds: 500));

    List<ExercisePropertyLink> objects = List<ExercisePropertyLink>.from(_linkDb);

    objects = objects
        .where((element) => element.userPropertyId == userPropertyId)
        .toList();

    return objects;
  }

  @override
  Future updateLink(String id, ExercisePropertyLink link) async {
    await Future.delayed(Duration(milliseconds: 500));
    int index = _linkDb.indexWhere((element) => element.getId() == id);
    _linkDb[index] = link;
    return link;
  }

  @override
  Future<List<ExercisePropertyLink>> getLinkList({List<String>? ids, int? count, int? offset}) async{

    await Future.delayed(Duration(milliseconds: 500));

    List<ExercisePropertyLink> objects = List<ExercisePropertyLink>.from(_linkDb);
    if(ids != null){
      objects = objects.where((element) => ids.contains(element.getId())).toList();
    }

    if(offset != null){
      objects = objects.sublist(min(offset,objects.length -1));
    }

    if(count != null){
      objects = objects.sublist(0,min(count,objects.length -1));
    }

    return objects;
  }

}