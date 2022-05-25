library crud_template_service;

import 'dart:math';

part 'crud_template_service_config.dart';
part 'crud_template_service_mock.dart';
part 'crud_template_service_real.dart';
part 'i_crud_template_service.dart';
part 'i_identifiable.dart';

enum CrudTemplateServiceType {mock,real}

class CrudTemplateService<T extends Identifiable>{
  CrudTemplateService._();

  static late ICRUDTemplateService instance;

  static Future init(CrudTemplateServiceType userServiceType,CRUDTemplateServiceConfig config) async{
    instance = ICRUDTemplateService(userServiceType,config);
  }
}