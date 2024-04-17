/*
  Commonly used constants across the project
  (API endpoints, keys for shared preferences, default parameters, etc.)
 */

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppConstants {
  AppConstants._();

  static const String appName = 'Kula';
  static const String appDomain = 'https://kula.com';
  static const String appDescription = 'Food app';
  static const String appCurrency = '₦';

  static const String appErrorMessage = 'Something went wrong please try again';

  String publicKey = 'FLWPUBK_TEST-11cb0e0963f9e2efad1e071a37760e7b-X';
  String secretKey = 'FLWSECK_TEST-eeb06bd6d8ebf1ab96e2b521a46d447d-X';
  String encryptionKey = 'FLWSECK_TEST4011af440443';

  static const flutterWaveKeys = (
    publicKey: 'FLWPUBK_TEST-11cb0e0963f9e2efad1e071a37760e7b-X',
    secretKey: 'FLWSECK_TEST-eeb06bd6d8ebf1ab96e2b521a46d447d-X',
    encryptionKey: 'FLWSECK_TEST4011af440443',
    currency: ["NGN"]
  );

  // static const double borderRadiusLarge = 16.0;
  // static const double borderRadius = 10.0;
  // static const double borderRadiusSmall = 5.0;
  // static const double borderRadiusMedium = 8.0;

  static ({double horizontal, int vertical}) padding = (
    horizontal: 20.w,
    vertical: 0,
  );

  static ({
    double large,
    double medium,
    double normal,
    double small
  }) borderRadius =
      (normal: 10.0.r, small: 5.0.r, medium: 8.0.r, large: 16.0.r);

  static final snackBarDuration = (
    success: 3.seconds,
    loading: 10.seconds,
    action: 10.seconds,
    error: 4.seconds
  );

  static const Size designSize = Size(393, 852);
  static Duration welcomeDelay = 1.seconds;
}
