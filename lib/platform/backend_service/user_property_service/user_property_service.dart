library user_property_service;

import 'package:fmp_common/platform/backend_service/crud_template_service/crud_template_service.dart';
import 'package:fmp_user_property_service_api/api.dart' as API;
import 'dart:convert';

part 'user_property_service_config.dart';
part 'user_property_service_mock.dart';
part 'user_property_service_real.dart';
part 'i_user_property_service.dart';
part 'user_property_extension.dart';
part 'user_property.dart';

enum UserPropertyServiceType {mock,real}

class UserPropertyService {
  UserPropertyService._();

  static late IUserPropertyService instance;

  static Future init(UserPropertyServiceType userServiceType,UserPropertyServiceConfig config) async{
    instance = IUserPropertyService(userServiceType,config);
  }
}