import 'package:flutter/material.dart';
import 'package:fmp_common/platform/navigation/i_user_state_navigator.dart';

enum BaseNavigationType { STANDARD }

class UserStateNavigationService {
  static Future init(
    BaseNavigationType type,
    Function updateCallback,
    Widget homeScreen,
  ) async {
    _instance = IUserStateNavigator(type);
    await _instance.init(updateCallback, homeScreen);
  }

  static IUserStateNavigator _instance =
      IUserStateNavigator(BaseNavigationType.STANDARD);
  static IUserStateNavigator get instance => _instance;
}
