part of '../app_router.dart';

class Profile {
  static final routes = [
    GoRoute(
        parentNavigatorKey: AppRouter.profileNavigatorKey,
        path: AppRoutes.profile,
        pageBuilder: (context, state) {
          return AppRouter.setupPage(
            child: const ProfileView(),
            state: state,
          );
        },
        routes: [
          GoRoute(
            parentNavigatorKey: AppRouter.profileNavigatorKey,
            path: routeSubPath(AppRoutes.profileDetails),
            pageBuilder: (context, state) {
              return AppRouter.setupPage(
                child: const ProfileDetails(),
                state: state,
              );
            },
          ),
          GoRoute(
            parentNavigatorKey: AppRouter.profileNavigatorKey,
            path: routeSubPath(AppRoutes.profileManageAddress),
            pageBuilder: (context, state) {
              return AppRouter.setupPage(
                child: const ProfileManageAddressView(),
                state: state,
              );
            },
          ),
          GoRoute(
            parentNavigatorKey: AppRouter.profileNavigatorKey,
            path: routeSubPath(AppRoutes.profileCustomerSupport),
            pageBuilder: (context, state) {
              return AppRouter.setupPage(
                child: const ProfileCustomerSupport(),
                state: state,
              );
            },
          ),
          GoRoute(
            parentNavigatorKey: AppRouter.profileNavigatorKey,
            path: routeSubPath(AppRoutes.profileGiveFeedback),
            pageBuilder: (context, state) {
              return AppRouter.setupPage(
                child: const ProfileFeedBack(),
                state: state,
              );
            },
          ),
          GoRoute(
            parentNavigatorKey: AppRouter.profileNavigatorKey,
            path: routeSubPath(AppRoutes.profilePrivacyPolicies),
            pageBuilder: (context, state) {
              return AppRouter.setupPage(
                child: const ProfilePrivacyPolicy(),
                state: state,
              );
            },
          ),
          GoRoute(
            parentNavigatorKey: AppRouter.profileNavigatorKey,
            path: routeSubPath(AppRoutes.profileTermsOfUse),
            pageBuilder: (context, state) {
              return AppRouter.setupPage(
                child: const ProfileTermsOfUse(),
                state: state,
              );
            },
          ),
        ]),
  ];
}
