library question_service;

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fmp_common/platform/backend_service/crud_template_service/crud_template_service.dart';

import 'package:fmp_common/platform/util/id_service.dart';
import 'package:fmp_question_service_api/api.dart' as api;

import 'package:fmp_api_clients/swagger_generated_code/question_service_api.swagger.dart'
    as swagger;

part 'question_service_config.dart';
part 'question_service_mock.dart';
part 'question_service_real.dart';
part 'i_question_service.dart';
part 'question_extension.dart';
part 'question.dart';
part 'question_service_real_rework.dart';

enum QuestionServiceType {
  mock,
  real,
  rework,
}

class QuestionService {
  QuestionService._();

  static late IQuestionService instance;

  static Future init(
      QuestionServiceType userServiceType, QuestionServiceConfig config) async {
    instance = IQuestionService(userServiceType, config);
  }
}
