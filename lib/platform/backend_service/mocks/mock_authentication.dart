
import 'package:fmp_common/platform/models/user_service/user.dart';
import 'package:fmp_common/platform/models/user_service/user_login_result.dart';
import 'package:fmp_common/platform/models/user_service/user_register_result.dart';

class MockAuth{

  //email password;
  final Map<String,String> _registeredUsers =  <String,String>{};

  Future<UserRegisterResult> register(String email,String password) async{

    await Future.delayed(const Duration(milliseconds: 500));

    if(_registeredUsers.containsKey(email)) {
      return UserRegisterResult(UserRegisterResultStatus.userAlreadyExists);
    }
    _registeredUsers[email] = password;
    return UserRegisterResult(UserRegisterResultStatus.successful);
  }


  Future<UserLoginResult> login(String email,String password) async{

    await Future.delayed(const Duration(milliseconds: 500));
    return UserLoginResult(
        UserLoginResultStatus.successful,
        token: "tokesfokjefoawkdaw",
        user: User(email:email, familyName: 'MockFamily',firstName: "MockFirstName",username: "MMock")
    );

    if(_registeredUsers.containsKey(email)){

      String? nullablePasswordFromDb = _registeredUsers[email];

      if(nullablePasswordFromDb != null){
        String passwordFromDb = nullablePasswordFromDb;

        if(passwordFromDb == password){
          return UserLoginResult(
            UserLoginResultStatus.successful,
            token: "tokesfokjefoawkdaw",
            user: User(email:email, familyName: 'MockFamily',firstName: "MockFirstName",username: "MMock")
          );

        }else {
          return UserLoginResult(UserLoginResultStatus.wrongPassword);
        }
      }else{
        return UserLoginResult(UserLoginResultStatus.userCorrupted);
      }
    }else{
      return UserLoginResult(UserLoginResultStatus.userNotFound);
    }

  }

}