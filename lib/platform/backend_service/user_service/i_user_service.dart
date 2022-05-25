
part of user_service;

abstract class IUserService{

  factory IUserService(UserServiceType userServiceType,UserServiceConfig config){
    switch(userServiceType){

      case UserServiceType.mock:
        return _UserServiceMock(MockBackend(),config);
      case UserServiceType.real:
        return _UserServiceReal(config);
    }
  }

  Future<User?> get(String token);

  Future delete(String token);


  Future<UserLoginResult> login(String userEmail,String userPassword);


  Future<UserRegisterResult> register(User user,String userPassword);

}