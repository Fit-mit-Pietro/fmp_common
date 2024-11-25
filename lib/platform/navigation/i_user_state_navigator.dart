import 'package:flutter/material.dart';
import 'package:fmp_common/platform/model_services/user/local_user_service.dart';

import 'user_state_navigator.dart';

abstract class IUserStateNavigator {
  factory IUserStateNavigator() {
    return UserStateNavigator();
  }

  Future<void> init(void Function() onUpdate, Widget homeScreen);

  void navigateAccordingToUserState(LocalUserState state);
}
