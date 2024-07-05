
part of user_service;

class _UserServiceReal implements IUserService{

  final UserServiceConfig _config;

  _UserServiceReal(this._config);

  @override
  Future<User?> get(String token) {
    // TODO: implement get
    throw UnimplementedError();
  }

  Uri _getUriForEndpoint(String endpoint){
    return Uri.parse(_config.SERVICE_URL +endpoint);
  }

  @override
  Future delete(String token) async{
    print(token);
    String bearerAuth = 'Bearer ' + token;

    try{
      http.Response response =  await http.delete(
        _getUriForEndpoint(_config.USER_SERVICE_ENDPOINT_USER_DELETE),
        headers: {
          HttpHeaders.authorizationHeader: bearerAuth,
        },
      ).timeout(const Duration(milliseconds: 10000));

      print(response.statusCode);
      print(response.body);
      print(response.reasonPhrase);
    }catch(e){
      if(e is SocketException){
        SocketException socketException = e;
        print(socketException);
        throw socketException;
      }else {
        print(e);
      }
      return UserLoginResult(UserLoginResultStatus.unableToReachServer);
    }
  }

  @override
  Future<UserLoginResult> login(String userEmail, String userPassword) async {

    String username = userEmail;
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$userPassword'));
    print("Starting to log in");
    try{
      http.Response response =  await http.get(
        _getUriForEndpoint(_config.USER_SERVICE_ENDPOINT_USER_LOG_IN),
        headers: {
          HttpHeaders.authorizationHeader: basicAuth,
        },
      ).timeout(const Duration(milliseconds: 15000));
      print("Response status code: ${response.statusCode}");
      if(response.statusCode == 400){
        return UserLoginResult(UserLoginResultStatus.userCorrupted);
      }if(response.statusCode == 200){

        Map<String,dynamic> jsonBody = jsonDecode(response.body);

        Map<String,dynamic> userJson = jsonBody[Keys.KEY_HTTP_BODY_USER];
        userJson[Keys.USER_EMAIL] = userEmail;

        print("User json: $userJson");
        User user = User.fromJson(userJson);
        print("User: ${user.toJson()}");

        Map<String,dynamic> tokenJson = jsonBody[Keys.KEY_HTTP_BODY_TOKEN];
        String token = tokenJson[Keys.KEY_TOKEN_ACCESS_TOKEN];

        return UserLoginResult(UserLoginResultStatus.successful,
          token: token,
          user: user,
        );
      }
    }catch(e){
      if(e is SocketException){
        SocketException socketException = e;
        print(socketException);
        throw socketException;
      }else {
        print(e);
      }
      return UserLoginResult(UserLoginResultStatus.unableToReachServer);
    }

    return UserLoginResult(UserLoginResultStatus.unknownError);

  }

  @override
  Future<UserRegisterResult> register(User user,String userPassword) async{

    String username = user.email;
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$userPassword'));

    Map<String,String> json = {
      "username": user.username,
      "familyname": user.familyName,
      "firstname": user.firstName
    };

    try{
      http.Response response =  await http.post(
          _getUriForEndpoint(_config.USER_SERVICE_ENDPOINT_USER_REGISTER),
          headers: {
            HttpHeaders.authorizationHeader: basicAuth,
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: jsonEncode(json)

      ).timeout(const Duration(milliseconds: 10000));

      if(response.statusCode == 400){
        return UserRegisterResult(UserRegisterResultStatus.userAlreadyExists);
      }if(response.statusCode == 201) {
        return UserRegisterResult(UserRegisterResultStatus.successful);
      }

    }on SocketException{
      return UserRegisterResult(UserRegisterResultStatus.unableToReachServer);
    }


    return UserRegisterResult(UserRegisterResultStatus.unknownError);

  }


  
}