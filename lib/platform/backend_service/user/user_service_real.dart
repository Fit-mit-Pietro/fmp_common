
import 'dart:convert';
import 'dart:io';

import 'package:fmp_common/platform/backend_service/user/user_service_config.dart';
import 'package:fmp_common/platform/keys/keys.dart';
import 'package:http/http.dart' as http;

import 'package:fmp_common/platform/backend_service/user/i_user_service.dart';
import 'package:fmp_common/platform/models/user_service/user.dart';
import 'package:fmp_common/platform/models/user_service/user_login_result.dart';
import 'package:fmp_common/platform/models/user_service/user_register_result.dart';

class UserServiceReal with UserServiceConfig implements IUserService{

  @override
  Future<User?> get(String token) {
    // TODO: implement get
    throw UnimplementedError();
  }

  Uri _getUriForEndpoint(String endpoint){
    return Uri.parse(USER_SERVICE_URL+ ":"+ USER_SERVICE_PORT +endpoint);
  }

  @override
  Future delete(String token) async{
    print(token);
    String bearerAuth = 'Bearer ' + token;

    try{
      http.Response response =  await http.delete(
        _getUriForEndpoint(USER_SERVICE_ENDPOINT_USER_DELETE),
        headers: {
          HttpHeaders.authorizationHeader: bearerAuth,
        },
      ).timeout(Duration(milliseconds: 10000));

      print(response.statusCode);
      print(response.body);
      print(response.reasonPhrase);
    }catch(e){
      if(e is SocketException){
        SocketException socketException = e as SocketException;
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

    try{
      http.Response response =  await http.get(
        _getUriForEndpoint(USER_SERVICE_ENDPOINT_USER_LOG_IN),
        headers: {
          HttpHeaders.authorizationHeader: basicAuth,
        },
      ).timeout(Duration(milliseconds: 20000));

      if(response.statusCode == 400){
        return UserLoginResult(UserLoginResultStatus.userCorrupted);
      }if(response.statusCode == 200){

        Map<String,dynamic> jsonBody = jsonDecode(response.body);

        Map<String,dynamic> userJson = jsonBody[Keys.KEY_HTTP_BODY_USER];
        userJson[Keys.USER_EMAIL] = userEmail;
        User user = User.fromJson(userJson);

        Map<String,dynamic> tokenJson = jsonBody[Keys.KEY_HTTP_BODY_TOKEN];
        String token = tokenJson[Keys.KEY_TOKEN_ACCESS_TOKEN];

        return UserLoginResult(UserLoginResultStatus.successful,
          token: token,
          user: user,
        );
      }
    }catch(e){
      if(e is SocketException){
        SocketException socketException = e as SocketException;
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

    try{
      http.Response response =  await http.post(
          _getUriForEndpoint(USER_SERVICE_ENDPOINT_USER_REGISTER),
          headers: {
            HttpHeaders.authorizationHeader: basicAuth,
          },
          body: user.toJson()
      ).timeout(Duration(milliseconds: 10000));

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