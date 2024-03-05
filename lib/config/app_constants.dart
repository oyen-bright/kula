/*
  Commonly used constants across the project
  (API endpoints, keys for shared preferences, default parameters, etc.)
 */

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppConstants {
  AppConstants._();

  static const String appName = 'Kula';
  static const String appDomain = 'https://kula.com';
  static const String appDescription = 'Food app';
  static const double viewPaddingHorizontal = 15;
  static const double viewPaddingHorizontalProfile = 20;

  static const double viewPaddingVertical = 10;
  static const double transactionTimeout = 60;
  static const double transactionConfirmationTimeout = 60;
  static const double scrollUnderElevation = 5;
  static const String appErrorMessage = 'Something went wrong please try again';
  static const String appCurrency = "\$";
  static const double distanceToUnlockVehicle = 15.0;
  static const double endTripParkingLocationRadius = 20;

  static const double authenticationMaxWidth = 660.0;
  static const double viewMaxWidth = 660.0;

  static const double fabPadding = 20.0;

  static const double borderRadiusLarge = 16.0;
  static const double borderRadius = 10.0;
  static const double borderRadiusSmall = 5.0;
  static const double borderRadiusMedium = 8.0;

  static const Size designSize = Size(393, 852);
  static Duration welcomeDelay = 1.seconds;
}
