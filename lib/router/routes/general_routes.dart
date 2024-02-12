part of '../app_router.dart';

class General {
  static final routes = [
    GoRoute(
      parentNavigatorKey: AppRouter.parentNavigatorKey,
      path: AppRoutes.splash,
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: const Center(child: Text("splash")),
          state: state,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppRouter.parentNavigatorKey,
      path: AppRoutes.onBoarding,
      redirect: (_, state) {
        if (AppConfig.finishedOnboarding) {
          return AppRoutes.login;
        }
        return null;
      },
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: const Center(child: Text("Onboarding")),
          state: state,
        );
      },
    ),
  ];
}
