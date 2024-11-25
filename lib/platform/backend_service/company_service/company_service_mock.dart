part of company_service;

class _CompanyServiceMock extends CRUDTemplateServiceMock<Company>
    implements ICompanyService {
  _CompanyServiceMock(super.config) {
    create(Company.createNew(label: "Neox Studios GmbH"));
    create(Company.createNew(label: "Neue Firma 2"));
    create(Company.createNew(label: "Neue Firma 3"));
  }
}
