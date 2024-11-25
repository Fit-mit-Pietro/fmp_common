library company_service;

import 'package:flutter/foundation.dart';
import 'package:fmp_common/platform/backend_service/auth_interceptor.dart';
import 'package:fmp_common/platform/backend_service/crud_template_service/crud_template_service.dart';
import 'package:fmp_common/platform/util/id_service.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:fmp_api_clients/swagger_generated_code/company_service_api.swagger.dart'
    as swagger;

// Service
part 'company_service_config.dart';
part 'company_service_mock.dart';
part 'company_service_real.dart';
part 'i_company_service.dart';

// Model
part 'company.dart';
part 'company_url.dart';
part 'company_user_link.dart';

part 'company_service.g.dart';

enum CompanyServiceType {
  real,
  mock,
}

class CompanyService {
  static late ICompanyService instance;

  static Future<void> init(
    CompanyServiceType type,
    CompanyServiceConfig config,
  ) async {
    instance = ICompanyService(type, config);
  }
}
