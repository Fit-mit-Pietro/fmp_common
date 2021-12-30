
enum UserRegisterResultStatus {successful,userAlreadyExists,unknownError,unableToReachServer}

class UserRegisterResult{

  final UserRegisterResultStatus _status;
  UserRegisterResultStatus get status => _status;

  UserRegisterResult(this._status);
}