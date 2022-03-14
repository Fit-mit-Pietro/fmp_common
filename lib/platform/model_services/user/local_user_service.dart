


import 'package:fmp_common/platform/backend_service/backend_service.dart';
import 'package:fmp_common/platform/models/user_service/user.dart';
import 'package:fmp_common/platform/models/user_service/user_login_result.dart';
import 'package:fmp_common/platform/models/user_service/user_register_result.dart';
import 'package:fmp_common/platform/persistence/secure_storage_service.dart';

enum LocalUserState {loggedOut,loggedIn,unverified}

// this class will also take care to cache a users credentials
class LocalUserService{

  LocalUserService._();

  String? userToken;

  User? _user;
  User? get user => _user;

  LocalUserState _localUserState = LocalUserState.loggedOut;
  LocalUserState get localUserState => _localUserState;

  static Future init() async{
    instance = LocalUserService._();
  }

  static late LocalUserService instance;

  Future<LocalUserState> tryToLoadSavedUser() async{
    String? email = await SecureStorageService.instance.readValue(SSSKeys.KEY_USER_EMAIL);
    String? password = await SecureStorageService.instance.readValue(SSSKeys.KEY_USER_PASSWORD);
    if(email != null && password!=null){
      await login(email, password);
    }else{
      _localUserState = LocalUserState.loggedOut;
    }
    return _localUserState;

  }

  Future<UserLoginResult> login(String email,String password) async{
    UserLoginResult result = await BackendService.instance.user.login(email, password);
    if(result.status == UserLoginResultStatus.successful){
      await onUserLoggedInSuccessful(result,password);
    }else{
      onUserLoggedInFailed(result);
    }


    return result;
  }

  Future onUserLoggedInSuccessful(UserLoginResult result,String password) async{
    if(result.token != null && result.user != null){

      userToken = result.token;
      _localUserState = LocalUserState.loggedIn;
      _user = result.user;

      await SecureStorageService.instance.storeValue(SSSKeys.KEY_USER_EMAIL, result.user!.email);
      await SecureStorageService.instance.storeValue(SSSKeys.KEY_USER_PASSWORD, password);


    }else{
      _localUserState = LocalUserState.loggedOut;
      print("Error: login successful but no token or user");
    }
  }

  void onUserLoggedInFailed(UserLoginResult result){
    _localUserState = LocalUserState.loggedOut;
  }

  void onUserRegisteredSuccessful(UserRegisterResult result,String password,String email){
    login(email,password);
  }

  void onUserRegisteredFailed(UserRegisterResult result){

  }

  Future delete() async{

    await logOut();

    if(userToken != null){
      await BackendService.instance.user.delete(userToken!);
    }else{
      print("Cant delete user as token is null");
    }
  }

  Future logOut() async{
    _localUserState = LocalUserState.loggedOut;

    await SecureStorageService.instance.deleteValue(SSSKeys.KEY_USER_EMAIL);
    await SecureStorageService.instance.deleteValue(SSSKeys.KEY_USER_PASSWORD);

  }


  Future<UserRegisterResult> register(User user,String userPassword) async {
    UserRegisterResult result = await BackendService.instance.user.register(user, userPassword);
    if(result.status == UserRegisterResultStatus.successful){
      onUserRegisteredSuccessful(result,userPassword,user.email);
    }else{
      onUserRegisteredFailed(result);
    }
    return result;
  }

}
