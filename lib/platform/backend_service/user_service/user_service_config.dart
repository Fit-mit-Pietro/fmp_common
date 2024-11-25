part of user_service;

class UserServiceConfig {
  UserServiceConfig({
    this.serviceUrl = "${ServerData.URL}:3001",
    this.registerEndpoint = "/register",
    this.loginEndpoint = "/login",
    this.deleteUserEndpoint = "/delete",
  });

  final String serviceUrl;

  final String registerEndpoint;
  final String loginEndpoint;
  final String deleteUserEndpoint;
}
