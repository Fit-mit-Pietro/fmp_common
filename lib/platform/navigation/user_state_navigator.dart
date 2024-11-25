import 'package:flutter/material.dart';
import 'package:fmp_common/platform/model_services/user/local_user_service.dart';
import 'package:fmp_common/platform/navigation/i_user_state_navigator.dart';
import 'package:fmp_common/platform/navigation/routing/routing.dart';
import 'package:fmp_common/platform/navigation/routing/transition_mode.dart';
import 'package:fmp_common/ui/screens/auth_screens/screen_log_in.dart';

import 'data/user_state_navigator_global_keys.dart';

class UserStateNavigator implements IUserStateNavigator {
  late void Function() onUpdate;
  late Widget _homeScreen;

  @override
  Future<void> init(void Function() onUpdate, Widget homeScreen) async {
    print("Init BaseNavigator");
    this.onUpdate = onUpdate;
    this.onUpdate();
    _homeScreen = homeScreen;
  }

  @override
  void navigateAccordingToUserState(LocalUserState state) {
    final screen = switch (state) {
      LocalUserState.loggedOut ||
      LocalUserState.unverified =>
        const ScreenLogIn(),
      LocalUserState.loggedIn => _homeScreen,
    };

    pushReplacement(
        navigator: UserStateNavigatorGlobalKeys.appKey.currentState!,
        screen: screen,
        mode: TransitionMode.slideFromRight);
  }
}
