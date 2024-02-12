part of '../app_router.dart';

class Home {
  static final routes = [
    GoRoute(
      parentNavigatorKey: AppRouter.homeNavigatorKey,
      path: AppRoutes.home,
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: const Center(child: Text("Home")),
          state: state,
        );
      },
    ),
  ];
}
