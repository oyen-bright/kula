import 'package:http/http.dart';
import 'package:kula/utils/types.dart';

import 'endpoints.dart';
import 'http_client.dart';

class AppRepository {
  AppRepository._();

//AUTHENTICATION
  static Future<Response> login(String email, String password) async {
    return await HttpClient.postRequest(
        endpoint: Endpoint.login,
        payload: {"email": email, "password": password});
  }

  static Future<Response> createAccount(String firsName, String lastName,
      String phoneNumber, String dob, String email, String password) async {
    return await HttpClient.postRequest(endpoint: Endpoint.register, payload: {
      "first_name": firsName,
      "last_name": lastName,
      "phone_number": phoneNumber,
      "date_of_birth": dob,
      "email": email,
      "accept_terms": true,
      "privacy_policy": true,
      "email_verified": true,
      "phone_verified": true,
      "password": password
    });
  }

//OTP
  static Future<Response> emailOTP(String email) async {
    return await HttpClient.postRequest(
        endpoint: Endpoint.emailOTP, payload: {"email": email});
  }

  static Future<Response> emailOTPVerify(String email, String otp) async {
    return await HttpClient.postRequest(
        endpoint: Endpoint.emailOTPVerify,
        payload: {"code": otp, "email": email});
  }

  static Future<Response> phoneNumberOTP(String phoneNumber) async {
    return await HttpClient.postRequest(
        endpoint: Endpoint.phoneOTP, payload: {"phone_number": phoneNumber});
  }

  static Future<Response> phoneNumberVerify(
      String phoneNumber, String otp) async {
    return await HttpClient.postRequest(
        endpoint: Endpoint.phoneOTPVerify,
        payload: {"code": otp, "phone_number": phoneNumber});
  }

  //ADDRESS
  static Future<Response> addAddress(
      {required String street,
      required String houseNumber,
      required String floorNumber,
      required String longitude,
      required String latitude,
      required String additionalInfo}) async {
    return await HttpClient.postRequest(
        endpoint: Endpoint.addAddress,
        payload: {
          "street": street,
          "house_number": houseNumber,
          "floor_number": floorNumber,
          "longitude": longitude,
          "latitude": latitude,
          "additional_info": additionalInfo
        });
  }

  static Future<Response> getAddress() async {
    return await HttpClient.getRequest(
      endpoint: Endpoint.address,
    );
  }

  static Future<Response> deleteAddress(String addressId) async {
    return await HttpClient.deleteRequest(
      endpoint: "${Endpoint.address}/$addressId/",
    );
  }

  static Future<Response> setDefaultAddress(String id) async {
    return await HttpClient.postRequest(
        endpoint: Endpoint.setDefault,
        payload: {
          "id": id,
        });
  }

  //RESTAURANT
  static Future<Response> getRestaurants(Location location) async {
    return await HttpClient.getRequest(
      endpoint:
          "${Endpoint.restaurant}/${location.longitude}/${location.latitude}",
    );
  }

  static Future<Response> getRestaurantMeals(
      Location location, String id) async {
    return await HttpClient.getRequest(
      endpoint:
          "${Endpoint.restaurantMeal}/$id/${location.longitude}/${location.latitude}",
    );
  }

  static Future<Response> getRestaurantReviews(String id) async {
    return await HttpClient.getRequest(
      endpoint: "${Endpoint.restaurantReview}/$id",
    );
  }

  static Future<Response> getTodaySpecial() async {
    return await HttpClient.getRequest(
      endpoint: Endpoint.todaySpecial,
    );
  }

  //CART
  static Future<Response> addToCart(Map<String, dynamic> payload) async {
    return await HttpClient.postRequest(
        endpoint: Endpoint.addToCart, payload: payload);
  }

  static Future<Response> updateCartQuantity(
      Map<String, dynamic> payload, String cartID) async {
    return await HttpClient.patchRequest(
        endpoint: "${Endpoint.updateCart}/$cartID", payload: payload);
  }

  static Future<Response> getCart() async {
    return await HttpClient.getRequest(endpoint: Endpoint.myCart);
  }

  static Future<Response> clearCart() async {
    return await HttpClient.postRequest(
        endpoint: Endpoint.clearCart, payload: {});
  }

  static Future<Response> deleteCartItem(String id) async {
    return await HttpClient.deleteRequest(
        endpoint: "${Endpoint.deleteCart}/$id");
  }

  //PROFILE
  static Future<Response> sendFeedback(Map<String, dynamic> payload) async {
    return await HttpClient.postRequest(
        endpoint: Endpoint.feedback, payload: payload);
  }

  static Future<Response> updateProfile(Map<String, dynamic> payload) async {
    return await HttpClient.postRequest(
        endpoint: Endpoint.profileUpdate, payload: payload);
  }
}
