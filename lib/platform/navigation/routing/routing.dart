library MyRouting;


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmp_common/platform/navigation/data/base_navigation_data.dart';
import 'package:fmp_common/platform/navigation/routing/routing_page_animated.dart';
import 'package:fmp_common/platform/navigation/routing/transition_mode.dart';


dynamic getRoute(Widget screen,TransitionMode mode){

  switch(mode){

    case TransitionMode.FADE:
      return FadeRoute(page: screen);

    case TransitionMode.SLIDE_FROM_LEFT:
      return SlideRoute(page: screen,transitionMode: mode,);

    case TransitionMode.SLIDE_FROM_RIGHT:
      return SlideRoute(page: screen,transitionMode: mode);

    case TransitionMode.SLIDE_FROM_BOTTOM:
      return SlideRoute(page: screen,transitionMode: mode);

    case TransitionMode.SLIDE_FROM_RIGHT_TO_LEFT:
      return SlideFromToRoute(page: screen,transitionMode: mode);

    case TransitionMode.NONE:
      return PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: BaseNavigationData.PAGE_TRANSIT_DURATION_MS),
          pageBuilder: (_, __, ___) => screen
      );

  }
}

Future<Widget> buildPageAsync(Widget? screen) async {
  return Future.microtask(() {
    return screen!;
  });
}


Future<dynamic> push({required Widget screen,TransitionMode? mode,required NavigatorState navigator}) async{

  mode ??= TransitionMode.FADE;
  return await navigator.push(
    getRoute(await buildPageAsync(screen),mode),
  );
}

Future<dynamic>  pushReplacement({required Widget screen,TransitionMode? mode,required NavigatorState navigator}) async{
  mode ??= TransitionMode.FADE;
  return await navigator.pushReplacement(
    getRoute(await buildPageAsync(screen),mode),
  );
}

void pop(BuildContext context,{dynamic data}){
  Navigator.pop(context,data);
}