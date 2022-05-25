
part of crud_template_service;

abstract class ICRUDTemplateService<T extends Identifiable>{
  factory ICRUDTemplateService(CrudTemplateServiceType userServiceType,CRUDTemplateServiceConfig config){
    switch(userServiceType){
      case CrudTemplateServiceType.mock:
        return CRUDTemplateServiceMock<T>(config);
      case CrudTemplateServiceType.real:
        return CRUDTemplateServiceReal<T>(config);
    }
  }

  Future<T> create(T t);

  Future<T> getById(String id);

  Future<List<T>> getList({
    List<String>? ids,int? count,int? offset
  });

  Future<T> update(String id, T updatedModel);

  Future<void> delete(String id);

}