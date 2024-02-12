part of '../app_router.dart';

class Profile {
  static final routes = [
    GoRoute(
      parentNavigatorKey: AppRouter.profileNavigatorKey,
      path: AppRoutes.profile,
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: const Center(child: Text("Profile")),
          state: state,
        );
      },
    ),
  ];
}
