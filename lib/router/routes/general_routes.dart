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
    GoRoute(
      parentNavigatorKey: AppRouter.parentNavigatorKey,
      path: AppRoutes.addAddress,
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: const AddAddress(),
          state: state,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppRouter.parentNavigatorKey,
      path: AppRoutes.search,
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: const SearchView(),
          state: state,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppRouter.parentNavigatorKey,
      path: AppRoutes.changeLocation,
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: const ChangeLocationView(),
          state: state,
        );
      },
    ),

    GoRoute(
      parentNavigatorKey: AppRouter.parentNavigatorKey,
      path: AppRoutes.searchGiveFeedBack,
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: const ProfileFeedBack(),
          state: state,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppRouter.parentNavigatorKey,
      path: AppRoutes.orderDetails,
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: OrderDetailsView(
            order: state.extra as Order,
          ),
          state: state,
        );
      },
    ),

    GoRoute(
        parentNavigatorKey: AppRouter.parentNavigatorKey,
        path: AppRoutes.restaurant,
        redirect: (_, state) {
          if (state.extra is Restaurant || state.extra is ResMeal) {
            return null;
          }
          return AppRoutes.homeWelcome;
        },
        pageBuilder: (context, state) {
          return AppRouter.setupPage(
            child: RestaurantView(
              restaurant: state.extra as Restaurant,
            ),
            state: state,
          );
        },
        routes: [
          GoRoute(
            parentNavigatorKey: AppRouter.parentNavigatorKey,
            path: routeSubPath(AppRoutes.restaurantReview),
            pageBuilder: (context, state) {
              return AppRouter.setupPage(
                child: RestaurantReview(
                  restaurant: state.extra as Restaurant,
                ),
                state: state,
              );
            },
          ),
          GoRoute(
            parentNavigatorKey: AppRouter.parentNavigatorKey,
            path: routeSubPath(
              AppRoutes.restaurantReviewNew,
            ),
            pageBuilder: (context, state) {
              return AppRouter.setupPage(
                child: CreateReview(
                  restaurant: state.extra as Restaurant,
                ),
                state: state,
              );
            },
          ),
          GoRoute(
            parentNavigatorKey: AppRouter.parentNavigatorKey,
            path: routeSubPath(AppRoutes.restaurantMeal),
            pageBuilder: (context, state) {
              return AppRouter.setupPage(
                child: RestaurantMeal(
                  restaurantId: (state.extra as ResMeal).restaurant,
                  meal: (state.extra as ResMeal).meal,
                ),
                state: state,
              );
            },
          ),
        ]),
    //Authentication routes
    GoRoute(
      parentNavigatorKey: AppRouter.parentNavigatorKey,
      path: AppRoutes.login,
      redirect: (_, state) {
        return null;
      },
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: const LoginView(),
          state: state,
        );
      },
    ),

    GoRoute(
        parentNavigatorKey: AppRouter.parentNavigatorKey,
        path: AppRoutes.signUp,
        pageBuilder: (context, state) {
          return AppRouter.setupPage(
            child: const SignUpView(),
            state: state,
          );
        },
        routes: [
          GoRoute(
            parentNavigatorKey: AppRouter.parentNavigatorKey,
            path: routeSubPath(AppRoutes.signUpWelcome),
            pageBuilder: (context, state) {
              return AppRouter.setupPage(
                child: const SignUpWelcomeView(),
                state: state,
              );
            },
          ),
          GoRoute(
            parentNavigatorKey: AppRouter.parentNavigatorKey,
            path: routeSubPath(AppRoutes.signUpEmailVerification),
            redirect: (_, state) {
              final input = state.extra as RegistrationInput?;
              if (input == null) {
                return AppRoutes.signUp;
              }
              return null;
            },
            pageBuilder: (context, state) {
              final input = state.extra as RegistrationInput;

              return AppRouter.setupPage(
                child: EmailVerificationView(
                  inputs: input,
                ),
                state: state,
              );
            },
          ),
          GoRoute(
            parentNavigatorKey: AppRouter.parentNavigatorKey,
            path: routeSubPath(AppRoutes.signUpPhoneVerification),
            redirect: (_, state) {
              final input = state.extra as RegistrationInput?;
              if (input == null) {
                return AppRoutes.signUp;
              }
              return null;
            },
            pageBuilder: (context, state) {
              final input = state.extra as RegistrationInput;

              return AppRouter.setupPage(
                child: PhoneNumberVerificationView(
                  inputs: input,
                ),
                state: state,
              );
            },
          ),
          GoRoute(
            parentNavigatorKey: AppRouter.parentNavigatorKey,
            path: routeSubPath(AppRoutes.signUpPhoneVerificationConfirm),
            redirect: (_, state) {
              final input = state.extra as RegistrationInput?;
              if (input == null) {
                return AppRoutes.signUp;
              }
              return null;
            },
            pageBuilder: (context, state) {
              final input = state.extra as RegistrationInput;

              return AppRouter.setupPage(
                child: PhoneNumberVerificationConfirmView(
                  inputs: input,
                ),
                state: state,
              );
            },
          ),
          GoRoute(
            parentNavigatorKey: AppRouter.parentNavigatorKey,
            path: routeSubPath(AppRoutes.signUpUserDetails),
            redirect: (_, state) {
              final input = state.extra as RegistrationInput?;
              if (input == null) {
                return AppRoutes.signUp;
              }
              return null;
            },
            pageBuilder: (context, state) {
              final input = state.extra as RegistrationInput;

              return AppRouter.setupPage(
                child: UserDetailsView(
                  inputs: input,
                ),
                state: state,
              );
            },
          ),
        ]),
  ];
}
