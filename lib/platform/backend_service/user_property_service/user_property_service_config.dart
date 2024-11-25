part of user_property_service;

class UserPropertyServiceConfig extends CRUDTemplateServiceConfig {
  UserPropertyServiceConfig({
    String serviceUrl = "http://10.0.2.2:3001",
  }) : super(
          serviceUrl: serviceUrl,
        );
}
