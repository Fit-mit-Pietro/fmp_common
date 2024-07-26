library user_property_service;

import 'package:fmp_common/platform/backend_service/auth_interceptor.dart';
import 'package:fmp_common/platform/backend_service/crud_template_service/crud_template_service.dart';
// import 'package:fmp_user_property_service_api/api.dart' as API;

import 'package:fmp_api_clients/swagger_generated_code/user_property_api.swagger.dart'
    as swagger;
import 'package:json_annotation/json_annotation.dart';

part 'user_property_service_config.dart';
part 'user_property_service_mock.dart';
part 'user_property_service_real.dart';
part 'i_user_property_service.dart';
part 'user_property_extension.dart';
part 'user_property.dart';
part 'user_property_service.g.dart';

enum UserPropertyServiceType { mock, real }

class UserPropertyService {
  UserPropertyService._();

  static late IUserPropertyService instance;

  static Future init(UserPropertyServiceType userServiceType,
      UserPropertyServiceConfig config) async {
    instance = IUserPropertyService(userServiceType, config);
  }
}
