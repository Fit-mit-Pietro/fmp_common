part of user_service;

class _UserServiceReal implements IUserService {
  final UserServiceConfig _config;

  _UserServiceReal(this._config);

  final Duration _timeoutDuration = const Duration(seconds: 15);

  @override
  Future<User?> get(String token) {
    throw UnimplementedError();
  }

  Uri _getUriForEndpoint(String endpoint) {
    return Uri.parse(_config.serviceUrl + endpoint);
  }

  @override
  Future delete(String token) async {
    // TODO: (Julian) We need to add error handling here and define a return type
    print(token);

    try {
      http.Response response = await http.delete(
        _getUriForEndpoint(_config.deleteUserEndpoint),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      ).timeout(_timeoutDuration);

      print(response.statusCode);
      print(response.body);
      print(response.reasonPhrase);
    } catch (e) {
      if (e is SocketException) {
        SocketException socketException = e;
        print(socketException);
        throw socketException;
      } else {
        print(e);
      }
      return UserLoginResult(UserLoginResultStatus.unableToReachServer);
    }
  }

  @override
  Future<UserLoginResult> login(String userEmail, String userPassword) async {
    String username = userEmail;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$userPassword'));
    print("Starting to log in");
    try {
      http.Response response = await http.get(
        _getUriForEndpoint(_config.loginEndpoint),
        headers: {
          HttpHeaders.authorizationHeader: basicAuth,
        },
      ).timeout(_timeoutDuration);
      print("Response status code: ${response.statusCode}");
      if (response.statusCode == 400) {
        return UserLoginResult(UserLoginResultStatus.userCorrupted);
      }
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonBody = jsonDecode(response.body);

        Map<String, dynamic> userJson = jsonBody[Keys.keyHttpBodyUser];
        userJson[Keys.userEmail] = userEmail;

        print("User json: $userJson");
        User user = User.fromJson(userJson);
        print("User: ${user.toJson()}");

        Map<String, dynamic> tokenJson = jsonBody[Keys.keyHttpBodyToken];
        String token = tokenJson[Keys.keyTokenAccessToken];

        return UserLoginResult(
          UserLoginResultStatus.successful,
          token: token,
          user: user,
        );
      }
    } catch (e) {
      if (e is SocketException) {
        SocketException socketException = e;
        print(socketException);
        throw socketException;
      } else {
        print(e);
      }
      return UserLoginResult(UserLoginResultStatus.unableToReachServer);
    }

    return UserLoginResult(UserLoginResultStatus.unknownError);
  }

  @override
  Future<UserRegisterResult> register(User user, String userPassword) async {
    String username = user.email;

    final basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$userPassword'))}';

    final json = <String, String>{
      "username": user.username,
      "familyname": user.familyName,
      "firstname": user.firstName,
    };

    try {
      final http.Response response = await http
          .post(
            _getUriForEndpoint(_config.registerEndpoint),
            headers: {
              HttpHeaders.authorizationHeader: basicAuth,
              HttpHeaders.contentTypeHeader: 'application/json',
            },
            body: jsonEncode(json),
          )
          .timeout(_timeoutDuration);

      return switch (response.statusCode) {
        >= 200 && <= 299 =>
          const UserRegisterResult(UserRegisterResultStatus.successful),
        >= 300 && <= 399 =>
          const UserRegisterResult(UserRegisterResultStatus.unknownError),
        400 =>
          const UserRegisterResult(UserRegisterResultStatus.userAlreadyExists),
        >= 401 && <= 499 =>
          const UserRegisterResult(UserRegisterResultStatus.unknownError),
        >= 500 && <= 599 => const UserRegisterResult(
            UserRegisterResultStatus.unableToReachServer),
        _ => const UserRegisterResult(UserRegisterResultStatus.unknownError)
      };
    } on SocketException {
      return const UserRegisterResult(
          UserRegisterResultStatus.unableToReachServer);
    } catch (_) {
      return const UserRegisterResult(UserRegisterResultStatus.unknownError);
    }
  }
}
