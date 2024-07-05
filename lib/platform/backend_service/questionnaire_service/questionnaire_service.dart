library questionnaire_service;

import 'dart:convert';

import 'package:fmp_common/platform/backend_service/crud_template_service/crud_template_service.dart';
import 'package:fmp_common/platform/backend_service/filter/filter_lib.dart';
import 'package:fmp_common/platform/backend_service/question_service/question_service.dart';
import 'package:fmp_common/platform/backend_service/user_property_service/user_property_service.dart';
import 'package:fmp_common/platform/util/id_service.dart';
import 'package:collection/collection.dart';

import 'package:fmp_questionnaire_service_api/api.dart' as API;

part 'questionnaire_service_config.dart';
part 'questionnaire_service_mock.dart';
part 'questionnaire_service_real.dart';
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


enum QuestionnaireServiceType {mock,real}

class QuestionnaireService{
  QuestionnaireService._();

  static late IQuestionnaireService instance;

  static Future init(QuestionnaireServiceType userServiceType,QuestionnaireServiceConfig config) async{
    instance = IQuestionnaireService(userServiceType,config);
  }
}