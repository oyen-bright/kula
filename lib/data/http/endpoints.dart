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
}
