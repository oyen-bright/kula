library app_router;

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kula/config/app_config.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/ui/views/bottom_navigator/bottom_navigator.dart';

part './routes/cart_routes.dart';
part './routes/general_routes.dart';
part './routes/home_routes.dart';
part './routes/order_routes.dart';
part './routes/profile_routes.dart';

class AppRouter {
  factory AppRouter() {
    return _instance;
  }

  static Page setupPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }

  static final AppRouter _instance = AppRouter._internal();
  static AppRouter get instance => _instance;
  static GlobalKey<NavigatorState> get generateNavigatorKey =>
      GlobalKey<NavigatorState>();

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      AppRouter.generateNavigatorKey;

  static final GlobalKey<NavigatorState> homeNavigatorKey =
      AppRouter.generateNavigatorKey;
  static final GlobalKey<NavigatorState> cartNavigatorKey =
      AppRouter.generateNavigatorKey;
  static final GlobalKey<NavigatorState> ordersNavigatorKey =
      AppRouter.generateNavigatorKey;
  static final GlobalKey<NavigatorState> profileNavigatorKey =
      AppRouter.generateNavigatorKey;

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  AppRouter._internal() {
    final routes = [
      _shellRoutes(),
      ...General.routes,
    ];
    router = GoRouter(
      // observers: [MyAppRouteObserver()],
      navigatorKey: parentNavigatorKey,
      initialLocation: AppRoutes.splash,
      routes: routes,
    );

    log("Initialized", name: "Router");
  }

  StatefulShellRoute _shellRoutes() {
    return StatefulShellRoute.indexedStack(
      parentNavigatorKey: parentNavigatorKey,
      branches: [
        StatefulShellBranch(
          navigatorKey: homeNavigatorKey,
          routes: Home.routes,
        ),
        StatefulShellBranch(
          navigatorKey: cartNavigatorKey,
          routes: Cart.routes,
        ),
        StatefulShellBranch(
          navigatorKey: ordersNavigatorKey,
          routes: Orders.routes,
        ),
        StatefulShellBranch(
          navigatorKey: profileNavigatorKey,
          routes: Profile.routes,
        ),
      ],
      pageBuilder: (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return setupPage(
          child: AppBottomNavigator(
            child: navigationShell,
          ),
          state: state,
        );
      },
    );
  }
}
