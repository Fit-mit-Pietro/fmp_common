library questionnaire_service;

import 'package:fmp_common/fmp_common.dart';
import 'package:fmp_common/platform/backend_service/auth_interceptor.dart';
import 'package:fmp_common/platform/backend_service/crud_template_service/crud_template_service.dart';
import 'package:fmp_common/platform/backend_service/filter/filter_lib.dart';
import 'package:fmp_common/platform/backend_service/question_service/question_service.dart';
import 'package:fmp_common/platform/backend_service/user_property_service/user_property_service.dart';
import 'package:fmp_common/platform/util/id_service.dart';
import 'package:collection/collection.dart';

// import 'package:fmp_questionnaire_service_api/api.dart' as api;
import 'package:fmp_api_clients/swagger_generated_code/questionnaire_service_api.swagger.dart'
    as swagger;
import 'package:fmp_api_clients/swagger_generated_code/questionnaire_service_api.enums.swagger.dart'
    as swagger_enums;
import 'package:json_annotation/json_annotation.dart';

part 'questionnaire_extension.dart';
part 'questionnaire_service_config.dart';
part 'questionnaire_service_mock.dart';
part 'questionnaire_service_real.dart';
part 'questionnaire_service_real_rework.dart';

part 'models/questionnaire.dart';
part 'models/questionnaire_extensions.dart';
part 'models/questionnaire_element.dart';
part 'models/questionnaire_element_extension.dart';

part 'models/filled_question.dart';
part 'models/filled_question_extension.dart';
part 'models/filled_questionnaire.dart';
part 'models/filled_questionnaire_extension.dart';
part 'models/filled_questionnaire_element.dart';
part 'models/filled_questionnaire_element_extension.dart';
part 'models/user_property_extension.dart';
part '../questionnaire_service/i_questionnaire_service.dart';

part 'questionnaire_service.g.dart';

enum QuestionnaireServiceType {
  mock,
  real,
  rework,
}

class QuestionnaireService {
  QuestionnaireService._();

  static late IQuestionnaireService instance;

  static Future init(QuestionnaireServiceType userServiceType,
      QuestionnaireServiceConfig config) async {
    instance = IQuestionnaireService(userServiceType, config);
  }
}
