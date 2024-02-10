/*
  Commonly used constants across the project
  (API endpoints, keys for shared preferences, default parameters, etc.)
 */

import 'package:emr_005/themes/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppConstants {
  AppConstants._();

  static const String appName = 'Ecomoto';
  static const String ecobookName = 'Ecobook';
  static const String appDomain = 'https://ecomoto.io';
  static const String appHostName = 'ecomoto.io';
  static const String appDescription = 'Vehicle Rental';
  static const double viewPaddingHorizontal = AppSizes.size16;
  static const double viewPaddingGrid = AppSizes.size10;
  static const double viewPaddingVertical = AppSizes.size20;
  static const double transactionTimeout = 60;
  static const double transactionConfirmationTimeout = 60;
  static const double scrollUnderElevation = 5;
  static const String appErrorMessage = 'Please try again';
  static const String appCurrency = "\$";
  static const LatLng defaultLocation = LatLng(39.8333333, -98.585522);
  static const double distanceToUnlockVehicle = 15.0;
  static const double endTripParkingLocationRadius = 20;

  static const double authenticationMaxWidth = 660.0;
  static const double viewMaxWidth = 660.0;

  static const double fabPadding = 20.0;

  static const Duration vehicleVideoDuration = Duration(minutes: 1);
  static const int maximumVideoFileSizeMB = 15;
  static const EdgeInsets contentPadding = EdgeInsets.symmetric(
    horizontal: AppSizes.size10,
    vertical: AppSizes.size12,
  );

  static const double borderRadiusLarge = 15.0;
  static const double borderRadius = 10.0;
  static const double borderRadiusSmall = 5.0;
  static const double borderRadiusMedium = 8.0;
}
