import 'dart:convert';
import 'dart:developer';

import 'package:kula/data/http/http_repository.dart';

abstract class _OTPService {
  Future<OTPServiceResponse> emailOTP(String email);

  Future<OTPServiceResponse> emailOTPVerify(String email, String otp);

  Future<OTPServiceResponse> phoneNumberOTP(String phoneNumber);

  Future<OTPServiceResponse> phoneNumberVerify(String phoneNumber, String otp);
}

class OTPServiceResponse<T> {
  final String? error;
  final T data;

  OTPServiceResponse({required this.error, required this.data});
}

class OTPService implements _OTPService {
  @override
  Future<OTPServiceResponse> emailOTP(String email) async {
    try {
      final response = await AppRepository.emailOTP(email);
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final message = data['message'];
      return OTPServiceResponse(error: null, data: message);
    } catch (e) {
      OTPService.logger(e.toString());
      return OTPServiceResponse(error: e.toString(), data: null);
    }
  }

  @override
  Future<OTPServiceResponse> emailOTPVerify(String email, String otp) async {
    try {
      final response = await AppRepository.emailOTPVerify(email, otp);
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final message = data['message'];

      return OTPServiceResponse(error: null, data: message);
    } catch (e) {
      OTPService.logger(e.toString());
      return OTPServiceResponse(error: e.toString(), data: null);
    }
  }

  @override
  Future<OTPServiceResponse<String?>> phoneNumberOTP(String phoneNumber) async {
    try {
      final response = await AppRepository.phoneNumberOTP(phoneNumber);
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final message = data['message'];

      return OTPServiceResponse(error: null, data: message);
    } catch (e) {
      OTPService.logger(e.toString());
      return OTPServiceResponse(error: e.toString(), data: null);
    }
  }

  @override
  Future<OTPServiceResponse<String?>> phoneNumberVerify(
      String phoneNumber, String otp) async {
    try {
      final response = await AppRepository.phoneNumberVerify(phoneNumber, otp);
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final message = data['message'];

      return OTPServiceResponse(error: null, data: message);
    } catch (e) {
      OTPService.logger(e.toString());
      return OTPServiceResponse(error: e.toString(), data: null);
    }
  }

  static void logger(String error) {
    log(error, name: "OTP Service ");
  }
}
