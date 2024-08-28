library company_service;

import 'package:fmp_common/platform/backend_service/crud_template_service/crud_template_service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_service_config.dart';
part 'company_service_mock.dart';
part 'company_service_real.dart';
part 'company_service.g.dart';
part 'i_company_service.dart';
part 'company.dart';

enum CompanyServiceType { real, mock }

class CompanyService {
  static late ICompanyService instance;

  static Future<void> init(
      CompanyServiceType type, CompanyServiceConfig config) async {
    instance = ICompanyService(type, config);
  }
}
