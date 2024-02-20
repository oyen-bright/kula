/*
  Initialize and configure GoRouter
 */
import 'package:flutter/foundation.dart' show immutable;

@immutable
class AppRoutes {
  const AppRoutes._();

  static const String root = '/';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String loginWelcome = '$login/welcome';
  static const String signUp = '/sign-up';
  static const String signUpWelcome = '$signUp/welcome';
  static const String signUpPhoneVerification = '$signUp/phone-verification';
  static const String signUpEmailVerification = '$signUp/email-verification';
  static const String signUpUserDetails = '$signUp/details';
  static const String onBoarding = '/onboarding';

  static const String home = '/';
  static const String cart = '/cart';
  static const String orders = '/orders';
  static const String profile = '/profile';
}
