part of crud_template_service;

class CRUDTemplateServiceReal<T extends Identifiable>
    implements ICRUDTemplateService<T> {
  // ignore: unused_field
  final CRUDTemplateServiceConfig _config;

  CRUDTemplateServiceReal(this._config);

  @override
  Future<T> delete(String id) {
    throw UnimplementedError();
  }

  @override
  Future<T> getById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<T>> getList({List<String>? ids, int? count, int? offset}) {
    throw UnimplementedError();
  }

  @override
  Future<T> update(String id, T updatedModel) {
    throw UnimplementedError();
  }

  @override
  Future<T> create(T t) {
    throw UnimplementedError();
  }
}
