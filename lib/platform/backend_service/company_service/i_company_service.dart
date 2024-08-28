part of company_service;

abstract class ICompanyService implements ICRUDTemplateService<Company> {
  factory ICompanyService(
          CompanyServiceType type, CompanyServiceConfig config) =>
      switch (type) {
        CompanyServiceType.real => _CompanyServiceReal(config),
        CompanyServiceType.mock => _CompanyServiceMock(config),
      };
}
