library exercise_service;

import 'dart:math';

import 'package:fmp_api_clients/swagger_generated_code/excercise_service_api.swagger.dart'
    as swagger;
import 'package:fmp_common/platform/backend_service/auth_interceptor.dart';
import 'package:fmp_common/platform/backend_service/crud_template_service/crud_template_service.dart';
import 'package:fmp_common/platform/backend_service/filter/filter_lib.dart';
import 'package:fmp_common/platform/util/id_service.dart';
// import 'package:fmp_exercise_service_api/api.dart' as api;
import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercise_service_config.dart';
part 'exercise_service_mock.dart';
part 'exercise_service_real.dart';
part 'i_exercise_service.dart';
part 'exercise.dart';
part 'exercise_property_link_value.dart';
part 'exercise_property_link_value_extension.dart';
part 'exercise_property_link.dart';
// part 'exercise_property_link.dart.g';
part 'exercise_extension.dart';
part 'exercise_property_link_extension.dart';
part 'exercise_service.g.dart';

enum ExerciseServiceType { mock, real }

class ExerciseService {
  ExerciseService._();

  static late IExerciseService instance;

  static Future init(
      ExerciseServiceType userServiceType, ExerciseServiceConfig config) async {
    instance = IExerciseService(userServiceType, config);
  }
}
