part of company_service;

class _CompanyServiceMock extends CRUDTemplateServiceMock<Company>
    implements ICompanyService {
  _CompanyServiceMock(super.config);
}
