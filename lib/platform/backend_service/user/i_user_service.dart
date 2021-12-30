
import 'package:fmp_common/platform/backend_service/user/user_service_config.dart';
import 'package:fmp_common/platform/models/user_service/user.dart';
import 'package:fmp_common/platform/models/user_service/user_login_result.dart';
import 'package:fmp_common/platform/models/user_service/user_register_result.dart';

abstract class IUserService{

  Future<User?> get(String token);

  Future delete(String token);


  Future<UserLoginResult> login(String userEmail,String userPassword);


  Future<UserRegisterResult> register(User user,String userPassword);

}