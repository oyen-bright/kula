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
