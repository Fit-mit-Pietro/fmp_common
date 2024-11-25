import 'package:flutter/foundation.dart';
import 'package:fmp_common/platform/backend_service/user_service/user_service.dart';
import 'package:fmp_common/platform/models/user_service/user.dart';
import 'package:fmp_common/platform/models/user_service/user_login_result.dart';
import 'package:fmp_common/platform/models/user_service/user_register_result.dart';
import 'package:fmp_common/platform/persistence/secure_storage_service.dart';

const bool _kAutoLogin = true;

enum LocalUserState {
  loggedOut,
  loggedIn,
  unverified,
}

// this class will also take care to cache a users credentials
class LocalUserService extends ChangeNotifier {
  LocalUserService._();

  String? userToken;

  User? _user;
  User? get user => _user;

  LocalUserState _localUserState = LocalUserState.loggedOut;
  LocalUserState get localUserState => _localUserState;

  void _updateState(LocalUserState newState) {
    if (_localUserState == newState) {
      return;
    }

    _localUserState = newState;
    notifyListeners();
  }

  static Future init() async {
    instance = LocalUserService._();
  }

  static late LocalUserService instance;

  Future<LocalUserState> tryToLoadSavedUser() async {
    String? email =
        await SecureStorageService.instance.readValue(SSSKeys.email);
    String? password =
        await SecureStorageService.instance.readValue(SSSKeys.password);
    if (email != null && password != null) {
      await login(email, password);
    } else if (kDebugMode && _kAutoLogin) {
      await login('j.kelsch@neox-studios.de', '!Nailuj32*!');
    } else {
      _updateState(LocalUserState.loggedOut);
    }
    return _localUserState;
  }

  Future<UserLoginResult> login(String email, String password) async {
    UserLoginResult result = await UserService.instance.login(email, password);
    if (result.status == UserLoginResultStatus.successful) {
      await onUserLoggedInSuccessful(result, password);
    } else {
      onUserLoggedInFailed(result);
    }

    return result;
  }

  Future<void> onUserLoggedInSuccessful(
      UserLoginResult result, String password) async {
    if (result.token == null || result.user == null) {
      _updateState(LocalUserState.loggedOut);

      print("Error: login successful but no token or user");
      return;
    }

    userToken = result.token;
    _user = result.user;
    _updateState(LocalUserState.loggedIn);

    notifyListeners();

    await SecureStorageService.instance
        .storeValue(SSSKeys.email, result.user!.email);
    await SecureStorageService.instance.storeValue(SSSKeys.password, password);

    print("User successfully logged in");
  }

  void onUserLoggedInFailed(UserLoginResult result) {
    _updateState(LocalUserState.loggedOut);
  }

  Future<void> onUserRegisteredSuccessful(
      UserRegisterResult result, String password, String email) async {
    await login(email, password);
  }

  Future onUserRegisteredFailed(UserRegisterResult result) async {}

  Future<LocalUserState> delete() async {
    await logOut();

    if (userToken != null) {
      await UserService.instance.delete(userToken!);
    } else {
      print("Cant delete user as token is null");
    }

    return _localUserState;
  }

  Future<LocalUserState> logOut() async {
    _updateState(LocalUserState.loggedOut);

    await SecureStorageService.instance.deleteValue(SSSKeys.email);
    await SecureStorageService.instance.deleteValue(SSSKeys.password);

    return _localUserState;
  }

  Future<UserRegisterResult> register(User user, String userPassword) async {
    UserRegisterResult result =
        await UserService.instance.register(user, userPassword);
    if (result.status == UserRegisterResultStatus.successful) {
      print("Register successful");
      await onUserRegisteredSuccessful(result, userPassword, user.email);
    } else {
      print("Register failed");

      await onUserRegisteredFailed(result);
    }
    return result;
  }
}
