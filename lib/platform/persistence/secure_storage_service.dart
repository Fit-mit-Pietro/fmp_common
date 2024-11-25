import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SSSKeys {
  static const String password = "user_password";
  static const String email = "user_email";
}

class SecureStorageService {
  SecureStorageService._();
  static late SecureStorageService instance;
  static Future init() async {
    instance = SecureStorageService._();
  }

  static const bool kUseFlutterSecureStorage = kDebugMode;

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> storeValue(String key, String value) async {
    if (kUseFlutterSecureStorage) {
      await _secureStorage.write(
        key: key,
        value: value,
      );
    }
  }

  Future<String?> readValue(String key) async {
    if (kUseFlutterSecureStorage) {
      await _secureStorage.read(key: key);
    }

    return null;
  }

  Future<void> deleteValue(String key) async {
    if (kUseFlutterSecureStorage) {
      await _secureStorage.delete(key: key);
    }
  }
}
