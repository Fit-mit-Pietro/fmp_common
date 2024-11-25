part of crud_template_service;

class CRUDTemplateServiceMock<T extends Identifiable>
    implements ICRUDTemplateService<T> {
  // ignore: unused_field
  final CRUDTemplateServiceConfig _config;

  CRUDTemplateServiceMock(this._config);

  final List<T> _objects = [];

  @override
  Future<T> delete(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));

    T object = _objects.firstWhere((element) => element.getId() == id);
    _objects.removeWhere((element) => element.getId() == id);
    return object;
  }

  @override
  Future<T> getById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    T object = _objects.firstWhere((element) => element.getId() == id);
    return object;
  }

  @override
  Future<List<T>> getList({List<String>? ids, int? count, int? offset}) async {
    await Future.delayed(const Duration(milliseconds: 500));

    const maxCount = 999999999;

    return List.from(_objects
        .where((element) => ids?.contains(element.getId()) ?? true)
        .skip(offset ?? 0)
        .take(count ?? maxCount));
  }

  @override
  Future<T> update(String id, T updatedModel) async {
    await Future.delayed(const Duration(milliseconds: 500));
    int index = _objects.indexWhere((element) => element.getId() == id);
    _objects[index] = updatedModel;
    return updatedModel;
  }

  @override
  Future<T> create(T t) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _objects.add(t);
    return t;
  }
}
