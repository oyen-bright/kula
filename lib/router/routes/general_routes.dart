part of '../app_router.dart';

class General {
  static final routes = [
    GoRoute(
      parentNavigatorKey: AppRouter.parentNavigatorKey,
      path: AppRoutes.splash,
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: const SplashView(),
          state: state,
        );
      },
    ),

    //Authentication routes
    GoRoute(
        parentNavigatorKey: AppRouter.parentNavigatorKey,
        path: AppRoutes.login,
        redirect: (_, state) {
          return null;

          // if (AppConfig.finishedOnboarding) {
          //   return AppRoutes.login;
          // }
          // return null;
        },
        pageBuilder: (context, state) {
          return AppRouter.setupPage(
            child: const LoginView(),
            state: state,
          );
        },
        routes: [
          GoRoute(
            parentNavigatorKey: AppRouter.parentNavigatorKey,
            path: routeSubPath(AppRoutes.loginWelcome),
            pageBuilder: (context, state) {
              return AppRouter.setupPage(
                child: const LoginWelcomeView(),
                state: state,
              );
            },
          ),
        ]),
  ];
}
