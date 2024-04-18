import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kula/config/app_environment.dart';
import 'package:kula/utils/enums.dart';

@immutable
class Endpoint {
  const Endpoint._();

  static bool get isProduction {
    return AppEnvironment.environment == Environment.production;
  }

  static final _baseUrl = AppEnvironment.apiURL;

  static final login = "$_baseUrl/login";
  static final register = "$_baseUrl/register";

  static final emailOTP = "$_baseUrl/send-email-otp";
  static final emailOTPVerify = "$_baseUrl/email-otp/verify";
  static final phoneOTP = "$_baseUrl/send-otp-phone";
  static final phoneOTPVerify = "$_baseUrl/phone-otp/verify";

  static final address = "$_baseUrl/addresses";
  static final addAddress = "$_baseUrl/address/add";
  static final setDefault = "$_baseUrl/address/set-default";

  static final restaurant = "$_baseUrl/resturants";
  static final restaurantMeal = "$_baseUrl/resturant/meal";
  static final restaurantReview = "$_baseUrl/review";
  static final restaurantReviewCreate = "$_baseUrl/review/create";
  static final todaySpecial = "$_baseUrl/promotion/today-special";

  static final addToCart = "$_baseUrl/cart/add-to-cart";
  static final myCart = "$_baseUrl/cart/my-cart";
  static final clearCart = "$_baseUrl/cart/clear-cart";
  static final deleteCart = "$_baseUrl/cart/delete";
  static final updateCart = "$_baseUrl/cart/update";
  static final feedback = "$_baseUrl/feedback/create";
  static final profileUpdate = "$_baseUrl/profile/update";
  static final wallet = "$_baseUrl/wallet";

  static final createOrder = "$_baseUrl/order/create";
  static final getOrder = "$_baseUrl/order/history";
  static final getOrderDetails = "$_baseUrl/order/show";
  static final verifyTransaction = "$_baseUrl/payment/verify";
}
