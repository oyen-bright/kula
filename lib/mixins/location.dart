import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/services/location_service.dart';
import 'package:kula/utils/enums.dart';

mixin LocationMixin {
  Future<bool> requestLocationPermission(BuildContext context,
      {bool shouldRequest = false}) async {
    final response = await context
        .read<LocationService>()
        .checkLocationPermission(shouldRequest: shouldRequest);

    if (!response.isGranted && context.mounted) {
      if (!shouldRequest) {
        return false;
      }

      if (response.status == null) {
        Future.microtask(() => context.showSnackBar(
            response.error,
            BarType.action,
            const SnackBarAction(
                label: "enable", onPressed: Geolocator.openLocationSettings)));
        return false;
      } else {
        Future.microtask(() => context.showSnackBar(
            response.error,
            BarType.action,
            const SnackBarAction(
                label: "enable", onPressed: Geolocator.openAppSettings)));
        return false;
      }
    }
    return true;
  }
}
