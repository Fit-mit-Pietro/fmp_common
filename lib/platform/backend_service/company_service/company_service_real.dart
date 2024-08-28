part of company_service;

class _CompanyServiceReal implements ICompanyService {
  _CompanyServiceReal(CompanyServiceConfig config);

  @override
  Future<Company> create(Company t) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Company> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<List<Company>> getList({List<String>? ids, int? count, int? offset}) {
    // TODO: implement getList
    throw UnimplementedError();
  }

  @override
  Future<Company> update(String id, Company updatedModel) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
