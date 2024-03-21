part of '../app_router.dart';

class Home {
  static final routes = [
    GoRoute(
        parentNavigatorKey: AppRouter.homeNavigatorKey,
        path: AppRoutes.home,
        pageBuilder: (context, state) {
          return AppRouter.setupPage(
            child: const HomeView(),
            state: state,
          );
        },
        routes: [
          GoRoute(
            parentNavigatorKey: AppRouter.parentNavigatorKey,
            path: routeSubPath(AppRoutes.homeWelcome),
            pageBuilder: (context, state) {
              return AppRouter.setupPage(
                child: const WelcomeView(),
                state: state,
              );
            },
          ),
        ]),
  ];
}
