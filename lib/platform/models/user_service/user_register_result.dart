enum UserRegisterResultStatus {
  successful,
  userAlreadyExists,
  unknownError,
  unableToReachServer,
}

class UserRegisterResult {
  const UserRegisterResult(this._status);

  final UserRegisterResultStatus _status;

  UserRegisterResultStatus get status => _status;
}
