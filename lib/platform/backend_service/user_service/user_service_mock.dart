part of user_service;

class _UserServiceMock implements IUserService {
  final MockBackend _backend;
  // ignore: unused_field
  final UserServiceConfig _config;

  _UserServiceMock(this._backend, this._config);

  @override
  Future<User?> get(String id) {
    return _backend.db.user.get(id);
  }

  @override
  Future<UserLoginResult> login(String userEmail, String userPassword) {
    return _backend.auth.login(userEmail, userPassword);
  }

  @override
  Future<UserRegisterResult> register(User user, String userPassword) {
    return _backend.auth.register(user.email, userPassword);
  }

  @override
  Future delete(String token) {
    throw UnimplementedError();
  }
}
