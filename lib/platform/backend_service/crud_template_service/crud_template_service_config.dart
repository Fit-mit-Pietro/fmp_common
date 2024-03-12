part of crud_template_service;

class CRUDTemplateServiceConfig {
  CRUDTemplateServiceConfig({
//    this.SERVICE_URL =
        //"http://ec2-52-59-251-16.eu-central-1.compute.amazonaws.com:3001",
    this.SERVICE_URL =
        "${ServerData.URL}:3001",
  });

  final SERVICE_URL;
  //final SERVICE_URL = "http://localhost";
  //final SERVICE_URL = "http://3.123.20.40";
  //final SERVICE_URL = "http://3.69.147.22";
}
