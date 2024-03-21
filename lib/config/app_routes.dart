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

  static const String signUp = '/sign-up';
  static const String signUpWelcome = '$signUp/welcome';
  static const String signUpPhoneVerification = '$signUp/phone-verification';
  static const String signUpPhoneVerificationConfirm =
      '$signUp/phone-verification-confirm';
  static const String signUpEmailVerification = '$signUp/email-verification';
  static const String signUpUserDetails = '$signUp/details';
  static const String onBoarding = '/onboarding';

  static const String home = '/home';
  static const String homeWelcome = '$home/welcome';
  static const String cart = '/cart';
  static const String cartDeliveryInstruction = '$cart/cart';

  static const String orders = '/orders';

  static const String profile = '/profile';
  static const String profileDetails = '$profile/profile-details';
  static const String profileManageAddress = '$profile/profile-manage-address';
  static const String profileCustomerSupport =
      '$profile/profile-customer-support';
  static const String profileGiveFeedback = '$profile/profile-give-feedback';
  static const String profileTermsOfUse = '$profile/terms';
  static const String profilePrivacyPolicies = '$profile/privacy-policies';

  static const String addAddress = '/add-address';
  static const String orderDetails = '/order-details';
  static const String search = '/search';
  static const String searchGiveFeedBack = '/feed-back';
  static const String changeLocation = '/change-location';

  static const String restaurant = '/restaurant';
  static const String restaurantReview = '$restaurant/review';
  static const String restaurantReviewNew = '$restaurant/create-review';
  static const String restaurantMeal = '$restaurant/meal';
}
