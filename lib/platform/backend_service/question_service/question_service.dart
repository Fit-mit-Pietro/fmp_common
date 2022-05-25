library question_service;

import 'package:fmp_common/platform/backend_service/crud_template_service/crud_template_service.dart';

import 'package:fmp_common/platform/util/id_service.dart';
import 'package:fmp_question_service_api/api.dart' as API;


part 'question_service_config.dart';
part 'question_service_mock.dart';
part 'question_service_real.dart';
part 'i_question_service.dart';
part 'question_extension.dart';
part 'question.dart';

enum QuestionServiceType {mock,real}

class QuestionService{
  QuestionService._();

  static late IQuestionService instance;

  static Future init(QuestionServiceType userServiceType,QuestionServiceConfig config) async{
    instance = IQuestionService(userServiceType,config);
  }
}