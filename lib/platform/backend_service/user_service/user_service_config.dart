part of user_service;

class UserServiceConfig {
  UserServiceConfig(
      {this.SERVICE_URL =
          "http://ec2-52-59-251-16.eu-central-1.compute.amazonaws.com:3001",
      this.USER_SERVICE_ENDPOINT_USER_REGISTER = "/register",
      this.USER_SERVICE_ENDPOINT_USER_LOG_IN = "/login",
      this.USER_SERVICE_ENDPOINT_USER_DELETE = "/delete"});

  final SERVICE_URL;
  //final SERVICE_URL = "http://localhost";
  //final SERVICE_URL = "http://3.123.20.40";
  //final SERVICE_URL = "http://3.69.147.22";

  final USER_SERVICE_ENDPOINT_USER_REGISTER;
  final USER_SERVICE_ENDPOINT_USER_LOG_IN;
  final USER_SERVICE_ENDPOINT_USER_DELETE;
}
