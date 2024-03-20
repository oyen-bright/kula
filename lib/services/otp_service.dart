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
      final response = await HttpRepository.emailOTP(email);
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
      final response = await HttpRepository.emailOTPVerify(email, otp);
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final message = data['message'];

      return OTPServiceResponse(error: null, data: message);
    } catch (e) {
      OTPService.logger(e.toString());
      return OTPServiceResponse(error: e.toString(), data: null);
    }
  }

  @override
  Future<OTPServiceResponse> phoneNumberOTP(String phoneNumber) {
    // TODO: implement phoneNumberOTP
    throw UnimplementedError();
  }

  @override
  Future<OTPServiceResponse> phoneNumberVerify(String phoneNumber, String otp) {
    // TODO: implement phoneNumberVerify
    throw UnimplementedError();
  }

  static void logger(String error) {
    log(error, name: "OTP Service ");
  }
}
