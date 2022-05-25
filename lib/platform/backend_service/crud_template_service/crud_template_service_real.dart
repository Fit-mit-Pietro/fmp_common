
part of crud_template_service;

class CRUDTemplateServiceReal<T extends Identifiable> implements ICRUDTemplateService<T>{
  
  CRUDTemplateServiceConfig _config;

  CRUDTemplateServiceReal(this._config);

  @override
  Future<T> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<T> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<List<T>> getList({List<String>? ids,int? count,int? offset}) {
    // TODO: implement getList
    throw UnimplementedError();
  }

  @override
  Future<T> update(String id, T updatedModel) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<T> create(T t) {
    // TODO: implement create
    throw UnimplementedError();
  }
}