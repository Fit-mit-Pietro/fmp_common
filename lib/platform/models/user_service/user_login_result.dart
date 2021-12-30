

import 'package:fmp_common/platform/models/user_service/user.dart';

enum UserLoginResultStatus {successful,userNotFound,userCorrupted,wrongPassword,timeout,unknownError,unableToReachServer}


class UserLoginResult{

  final UserLoginResultStatus _status;
  UserLoginResultStatus get status => _status;

  String? _token;
  String? get token => _token;

  User? _user;
  User? get user => _user;

  UserLoginResult(this._status,{User? user,String? token}){
    this._token = token;
    this._user = user;
  }
}