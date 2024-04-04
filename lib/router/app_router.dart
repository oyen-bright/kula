library app_router;

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/cubits/restaurant_cubit/restaurant_model.dart';
import 'package:kula/ui/views/add_address/add_address_view.dart';
import 'package:kula/ui/views/authentication/login/login_view.dart';
import 'package:kula/ui/views/authentication/sign_up/email_verification_view.dart';
import 'package:kula/ui/views/authentication/sign_up/models/registration_input.dart';
import 'package:kula/ui/views/authentication/sign_up/phone_verification.dart';
import 'package:kula/ui/views/authentication/sign_up/phone_verification_confirm.dart';
import 'package:kula/ui/views/authentication/sign_up/sign_up_view.dart';
import 'package:kula/ui/views/authentication/sign_up/sign_up_welcome.dart';
import 'package:kula/ui/views/authentication/sign_up/user_details.dart';
import 'package:kula/ui/views/bottom_navigator/bottom_navigator.dart';
import 'package:kula/ui/views/cart/cart_delivery_instruction_view.dart';
import 'package:kula/ui/views/cart/cart_view.dart';
import 'package:kula/ui/views/change_location/change_location_view.dart';
import 'package:kula/ui/views/home/home_view.dart';
import 'package:kula/ui/views/home/welcome_view.dart';
import 'package:kula/ui/views/orders/order_details_view.dart';
import 'package:kula/ui/views/orders/orders_view.dart';
import 'package:kula/ui/views/profile/profile_customer_suport.dart';
import 'package:kula/ui/views/profile/profile_details_view.dart';
import 'package:kula/ui/views/profile/profile_feedback.dart';
import 'package:kula/ui/views/profile/profile_manage_address.dart';
import 'package:kula/ui/views/profile/profile_privacy_policy.dart';
import 'package:kula/ui/views/profile/profile_terms_of_use.dart';
import 'package:kula/ui/views/profile/profile_view.dart';
import 'package:kula/ui/views/restaurant/restaurant_meal.dart';
import 'package:kula/ui/views/restaurant/restaurant_new_review.dart';
import 'package:kula/ui/views/restaurant/restaurant_review.dart';
import 'package:kula/ui/views/restaurant/restaurant_view.dart';
import 'package:kula/ui/views/search/search_view.dart';
import 'package:kula/ui/views/splash/splash_view.dart';
import 'package:kula/utils/subpart_route_util.dart';
import 'package:kula/utils/types.dart';

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
