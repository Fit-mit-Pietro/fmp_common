


import 'package:flutter/material.dart';
import 'package:fmp_common/platform/navigation/i_base_navigator.dart';

enum BaseNavigationType {STANDARD}

class BaseNavigatorService{

  static Future init(BaseNavigationType type,Function updateCallback,Widget homeScreen) async{
    _instance = IBaseNavigator(type);
    await _instance.init(updateCallback as dynamic Function(),homeScreen);
  }

  static IBaseNavigator _instance = IBaseNavigator(BaseNavigationType.STANDARD);
  static IBaseNavigator get instance => _instance ;
}

