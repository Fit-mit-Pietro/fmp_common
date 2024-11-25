import 'package:flutter/material.dart';
import 'package:fmp_common/platform/navigation/i_user_state_navigator.dart';

class UserStateNavigationService {
  static Future init({
    required void Function() onUpdate,
    required Widget homeScreen,
  }) async {
    _instance = IUserStateNavigator();
    await _instance.init(onUpdate, homeScreen);
  }

  static IUserStateNavigator _instance = IUserStateNavigator();

  static IUserStateNavigator get instance => _instance;
}
