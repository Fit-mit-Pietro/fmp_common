import 'package:flutter/widgets.dart';
import 'package:fmp_common/platform/navigation/data/base_navigation_data.dart';

import 'package:fmp_common/platform/navigation/routing/transition_mode.dart';

class FadeRoute<T> extends PageRouteBuilder<T> {
  final Widget? page;
  FadeRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page!,
          reverseTransitionDuration: BaseNavigationData.pageTransitionDuration,
          transitionDuration: BaseNavigationData.pageTransitionDuration,
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

class SlideRoute<T> extends PageRouteBuilder<T> {
  final Widget? page;
  final TransitionMode? transitionMode;

  SlideRoute({this.page, this.transitionMode})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page!,
          reverseTransitionDuration: BaseNavigationData.pageTransitionDuration,
          transitionDuration: BaseNavigationData.pageTransitionDuration,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: transitionMode == TransitionMode.slideFromLeft
                  ? const Offset(-1, 0)
                  : transitionMode == TransitionMode.slideFromRight
                      ? const Offset(1, 0)
                      : transitionMode == TransitionMode.slideFromBotton
                          ? const Offset(0, 1)
                          : null,
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

class SlideFromToRoute<T> extends PageRouteBuilder<T> {
  final Widget? page;
  final TransitionMode? transitionMode;

  SlideFromToRoute({this.page, this.transitionMode})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                page!,
            reverseTransitionDuration:
                BaseNavigationData.pageTransitionDuration,
            transitionDuration: BaseNavigationData.pageTransitionDuration,
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              bool reverse = animation.status == AnimationStatus.reverse;

              var _begin = transitionMode == TransitionMode.slideFromRightToLeft
                  ? const Offset(1, 0)
                  : null;

              var _begin2 =
                  transitionMode == TransitionMode.slideFromRightToLeft
                      ? const Offset(-1, 0)
                      : null;

              return SlideTransition(
                position: Tween<Offset>(
                  begin: reverse ? _begin2 : _begin,
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            });
}
