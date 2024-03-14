import 'package:http/http.dart';

import 'endpoints.dart';
import 'http_client.dart';

class HttpRepository {
  HttpRepository._();

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
        endpoint: Endpoint.register, payload: {"code": otp, "email": email});
  }

  static Future<Response> phoneNumberOTP(String phoneNumber) async {
    return await HttpClient.postRequest(
        endpoint: Endpoint.register, payload: {"phone_number": phoneNumber});
  }

  static Future<Response> phoneNumberVerify(
      String phoneNumber, String otp) async {
    return await HttpClient.postRequest(
        endpoint: Endpoint.register,
        payload: {"code": otp, "phone_number": phoneNumber});
  }
}
