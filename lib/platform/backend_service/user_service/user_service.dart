library user_service;

import 'dart:convert';
import 'dart:io';

import 'package:fmp_common/platform/backend_service/mocks/mock_backend.dart';
import 'package:http/http.dart' as http;
import 'package:fmp_common/fmp_common.dart';

part 'user_service_config.dart';
part 'user_service_mock.dart';
part 'user_service_real.dart';
part 'i_user_service.dart';

enum UserServiceType { mock, real }

class UserService {
  UserService._();

  static late IUserService instance;

  static Future init(
      UserServiceType userServiceType, UserServiceConfig config) async {
    instance = IUserService(userServiceType, config);
  }
}
