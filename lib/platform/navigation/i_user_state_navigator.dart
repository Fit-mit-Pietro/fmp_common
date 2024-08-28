import 'package:flutter/material.dart';
import 'package:fmp_common/platform/model_services/user/local_user_service.dart';
import 'package:fmp_common/platform/navigation/user_state_navigation_service.dart';

import 'user_state_navigator.dart';

abstract class IUserStateNavigator {
  factory IUserStateNavigator(BaseNavigationType type) {
    switch (type) {
      case BaseNavigationType.STANDARD:
        return UserStateNavigator();
    }
  }

  Future? init(Function update, Widget ScreenHome);

  void navigateAccordingToUserState(LocalUserState state);
}
