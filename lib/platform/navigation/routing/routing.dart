library my_routing;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmp_common/platform/navigation/data/base_navigation_data.dart';
import 'package:fmp_common/platform/navigation/routing/routing_page_animated.dart';
import 'package:fmp_common/platform/navigation/routing/transition_mode.dart';

PageRouteBuilder<T> getPageRouteBuilder<T>(
        Widget screen, TransitionMode mode) =>
    switch (mode) {
      TransitionMode.fade => FadeRoute(page: screen),
      TransitionMode.slideFromLeft => SlideRoute(
          page: screen,
          transitionMode: mode,
        ),
      TransitionMode.slideFromRight =>
        SlideRoute(page: screen, transitionMode: mode),
      TransitionMode.slideFromBotton =>
        SlideRoute(page: screen, transitionMode: mode),
      TransitionMode.slideFromRightToLeft =>
        SlideFromToRoute(page: screen, transitionMode: mode),
      TransitionMode.none => PageRouteBuilder(
          transitionDuration: BaseNavigationData.pageTransitionDuration,
          pageBuilder: (_, __, ___) => screen)
    };

Future<Widget> buildPageAsync(Widget? screen) async {
  return Future.microtask(() {
    return screen!;
  });
}

Future<T?> push<T>({
  required Widget screen,
  TransitionMode? mode,
  required NavigatorState navigator,
}) async =>
    await navigator.push(
      getPageRouteBuilder(
          await buildPageAsync(screen), mode ?? TransitionMode.fade),
    );

Future<T?> pushReplacement<T extends Object?, TO extends Object?>({
  required Widget screen,
  TransitionMode? mode,
  required NavigatorState navigator,
}) async =>
    await navigator.pushReplacement<T, TO>(
      getPageRouteBuilder(await buildPageAsync(screen), TransitionMode.fade),
    );

void pop<T extends Object?>(BuildContext context, {T? result}) =>
    Navigator.pop<T>(context, result);
