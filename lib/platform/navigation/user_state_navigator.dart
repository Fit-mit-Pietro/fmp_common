import 'package:flutter/material.dart';
import 'package:fmp_common/platform/model_services/user/local_user_service.dart';
import 'package:fmp_common/platform/navigation/i_user_state_navigator.dart';
import 'package:fmp_common/platform/navigation/routing/routing.dart';
import 'package:fmp_common/platform/navigation/routing/transition_mode.dart';
import 'package:fmp_common/ui/screens/auth_screens/screen_log_in.dart';

import 'data/user_state_navigator_global_keys.dart';

class UserStateNavigator implements IUserStateNavigator {
  late Function update;
  late Widget _screenHome;

  @override
  Future? init(Function update, Widget screenHome) {
    print("Init BaseNavigator");
    this.update = update;
    this.update();
    _screenHome = screenHome;
    return null;
  }

  @override
  void navigateAccordingToUserState(LocalUserState state) {
    dynamic screen;

    switch (state) {
      case LocalUserState.loggedOut:
        screen = const ScreenLogIn();
        break;
      case LocalUserState.loggedIn:
        screen = _screenHome;
        break;
      case LocalUserState.unverified:
        screen = const ScreenLogIn();
        break;
    }

    pushReplacement(
        navigator: UserStateNavigatorGlobalKeys.appKey.currentState!,
        screen: screen,
        mode: TransitionMode.SLIDE_FROM_RIGHT);
  }
}
