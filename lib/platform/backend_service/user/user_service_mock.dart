
import 'package:fmp_common/platform/backend_service/mocks/mock_backend.dart';
import 'package:fmp_common/platform/backend_service/user/i_user_service.dart';
import 'package:fmp_common/platform/models/user_service/user.dart';
import 'package:fmp_common/platform/models/user_service/user_login_result.dart';
import 'package:fmp_common/platform/models/user_service/user_register_result.dart';

class UserServiceMock implements IUserService{

  final MockBackend _backend;

  UserServiceMock(this._backend);

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
    // TODO: implement delete
    throw UnimplementedError();
  }




}