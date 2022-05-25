
part of user_property_service;


class _UserPropertyServiceMock
    extends CRUDTemplateServiceMock<UserProperty>
    implements IUserPropertyService
{

  UserPropertyServiceConfig _config;

  _UserPropertyServiceMock(this._config):super(_config){
    create(UserProperty.createNew(
      label: "Symptom 1",
      id: "symptom_1"
    ));
    create(UserProperty.createNew(
        label: "Symptom 2",
        id: "symptom_2"    )
    );
    create(UserProperty.createNew(
        label: "Symptom 3",
        id: "symptom_3"    )
    );
  }
}