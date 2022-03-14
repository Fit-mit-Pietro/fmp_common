

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SSSKeys{
  static const String KEY_USER_PASSWORD = "user_password";
  static const String KEY_USER_EMAIL = "user_email";
}

class SecureStorageService{

   SecureStorageService._();
  static late SecureStorageService instance;
  static Future init() async{
    instance = SecureStorageService._();
  }

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future storeValue(String key,String value){
    return _secureStorage.write(key: key, value: value);
    return Future.value();
  }

  Future<String?> readValue(String key){
    //return Future.value(null);
    return _secureStorage.read(key: key);
  }

  Future deleteValue(String key){

    return _secureStorage.delete(key: key);
  }

}



