part of '../app_router.dart';

class Cart {
  static final routes = [
    GoRoute(
        parentNavigatorKey: AppRouter.cartNavigatorKey,
        path: AppRoutes.cart,
        pageBuilder: (context, state) {
          return AppRouter.setupPage(
            child: const CartView(),
            state: state,
          );
        },
        routes: [
          GoRoute(
            parentNavigatorKey: AppRouter.cartNavigatorKey,
            path: routeSubPath(AppRoutes.cartDeliveryInstruction),
            pageBuilder: (context, state) {
              return AppRouter.setupPage(
                child: const CartExtraDeliveryView(),
                state: state,
              );
            },
          ),
        ]),
  ];
}
