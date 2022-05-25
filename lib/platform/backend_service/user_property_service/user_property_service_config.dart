part of user_property_service;

class UserPropertyServiceConfig extends CRUDTemplateServiceConfig{

  UserPropertyServiceConfig({
    SERVICE_URL = "http://10.0.2.2:3001",
  }) : super(
      SERVICE_URL: SERVICE_URL,
  );

}
