part of '../app_router.dart';

class Cart {
  static final routes = [
    GoRoute(
      parentNavigatorKey: AppRouter.cartNavigatorKey,
      path: AppRoutes.cart,
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: const Center(child: Text("Cart")),
          state: state,
        );
      },
    ),
  ];
}
