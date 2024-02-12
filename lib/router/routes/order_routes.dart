part of '../app_router.dart';

class Orders {
  static final routes = [
    GoRoute(
      parentNavigatorKey: AppRouter.ordersNavigatorKey,
      path: AppRoutes.orders,
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: const Center(child: Text("Orders")),
          state: state,
        );
      },
    ),
  ];
}
