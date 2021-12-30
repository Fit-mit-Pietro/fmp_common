



import 'package:flutter/material.dart';
import 'package:fmp_common/platform/model_services/user/local_user_service.dart';
import 'package:fmp_common/platform/navigation/base_navigator_service.dart';

import 'base_navigator.dart';

abstract class IBaseNavigator{

  factory IBaseNavigator(BaseNavigationType type){
    switch(type){
      case BaseNavigationType.STANDARD: return BaseNavigator();
      default: return BaseNavigator();
    }
  }

  Future? init(Function() update,Widget ScreenHome);

  void navigateAccordingToUserState(LocalUserState state);


}