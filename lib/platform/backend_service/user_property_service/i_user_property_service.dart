
part of user_property_service;

abstract class IUserPropertyService implements ICRUDTemplateService<UserProperty>{
  factory IUserPropertyService(
      UserPropertyServiceType userServiceType,
      UserPropertyServiceConfig config
      ){
    switch(userServiceType){

      case UserPropertyServiceType.mock:
        return _UserPropertyServiceMock(config);
      case UserPropertyServiceType.real:
        return _UserPropertyServiceReal(config);
    }
  }
}