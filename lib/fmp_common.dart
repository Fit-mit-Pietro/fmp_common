library fmp_common;

import 'package:flutter/foundation.dart';

// screens
export 'ui/screens/auth_screens/screen_log_in.dart' show ScreenLogIn;
export 'ui/screens/auth_screens/screen_register.dart' show ScreenRegister;
export 'ui/screens/screen_loading.dart' show ScreenLoading;

// widgets
export 'ui/widgets/buttons/button_icon_text.dart';
export 'ui/widgets/buttons/main_icon_button.dart';
export 'ui/widgets/buttons/tappable.dart';
export 'ui/widgets/text_views/text_view_key_value.dart' show TextViewKeyValue;
export 'ui/widgets/input_widgets/auto_complete_text_field.dart'
    show AutoCompleteTextField;
export 'ui/widgets/filter/filter_widget.dart';
export 'ui/widgets/body_map_widget/switchable_body_canvas.dart';

// service
export 'platform/model_services/user/local_user_service.dart';
export 'platform/backend_service/exercise_service/exercise_service.dart';
export 'platform/backend_service/question_service/question_service.dart';
export 'platform/navigation/routing/routing.dart';

export 'platform/navigation/routing/transition_mode.dart';
export 'platform/navigation/user_state_navigation_service.dart';
export 'platform/navigation/data/user_state_navigator_global_keys.dart';
export 'platform/persistence/secure_storage_service.dart';
export 'platform/model_services/body_selector_view_service/body_selector_view_service.dart';

// ui services;
export 'ui/services/dialog/dialog_service.dart';

// validator
export 'platform/validator/string_validator.dart';

//models
export 'platform/models/user_service/user.dart';
export 'platform/models/user_service/user_delete_result.dart';
export 'platform/models/user_service/user_login_result.dart';
export 'platform/models/user_service/user_register_result.dart';

export 'platform/models/body_selector/body_part.dart';
export 'platform/models/body_selector/body_part_symptom.dart';
export 'platform/models/body_selector/body_selector_view_model.dart';

//keys
export 'platform/keys/keys.dart';

// class ServerData {
//   // static const String URL = "http://ec2-18-198-189-148.eu-central-1.compute.amazonaws.com";
// // ignore: constant_identifier_names
//   static const kDeploymentMode = true;

// //   static const String URL = kDeploymentMode
// //       ? "http://ec2-18-194-209-238.eu-central-1.compute.amazonaws.com"
// //       : "http://localhost";
// }
