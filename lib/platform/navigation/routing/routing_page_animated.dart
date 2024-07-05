


import 'package:flutter/widgets.dart';
import 'package:fmp_common/platform/navigation/data/base_navigation_data.dart';

import 'package:fmp_common/platform/navigation/routing/transition_mode.dart';

class FadeRoute extends PageRouteBuilder {
  final Widget? page;
  FadeRoute({this.page})
      : super(
    pageBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page!,
    reverseTransitionDuration: const Duration(milliseconds: BaseNavigationData.PAGE_TRANSIT_DURATION_MS),
    transitionDuration: const Duration(milliseconds: BaseNavigationData.PAGE_TRANSIT_DURATION_MS),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
  );
}

class SlideRoute extends PageRouteBuilder {

  final Widget? page;
  final TransitionMode? transitionMode;

  SlideRoute({this.page,this.transitionMode})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page!,
    reverseTransitionDuration: const Duration(milliseconds: BaseNavigationData.PAGE_TRANSIT_DURATION_MS),
    transitionDuration: const Duration(milliseconds: BaseNavigationData.PAGE_TRANSIT_DURATION_MS),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: transitionMode==TransitionMode.SLIDE_FROM_LEFT?
            const Offset(-1, 0):transitionMode==TransitionMode.SLIDE_FROM_RIGHT?
            const Offset(1,0):transitionMode==TransitionMode.SLIDE_FROM_BOTTOM?
            const Offset(0,1):null,
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}


class SlideFromToRoute extends PageRouteBuilder {

  final Widget? page;
  final TransitionMode? transitionMode;

  SlideFromToRoute({this.page, this.transitionMode}) : super(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation,) =>
      page!,
      reverseTransitionDuration: const Duration(milliseconds: BaseNavigationData.PAGE_TRANSIT_DURATION_MS),
      transitionDuration: const Duration(milliseconds: BaseNavigationData.PAGE_TRANSIT_DURATION_MS),
      transitionsBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,) {
        bool reverse = animation.status == AnimationStatus.reverse;

        var _begin = transitionMode == TransitionMode.SLIDE_FROM_RIGHT_TO_LEFT
            ? const Offset(1, 0)
            : null;

        var _begin2 = transitionMode == TransitionMode.SLIDE_FROM_RIGHT_TO_LEFT
            ? const Offset(-1, 0)
            : null;

        return SlideTransition(
          position: Tween<Offset>(
            begin: reverse?_begin2:_begin,
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      });

}