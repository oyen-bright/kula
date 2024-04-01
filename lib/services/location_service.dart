import 'package:geolocator/geolocator.dart';

abstract class _LocationService {
  Future<({String? error, Position? position, bool? hasPermission})>
      getCurrentLocation(
          [LocationAccuracy desiredAccuracy = LocationAccuracy.high]);

  Future<({String? error, bool isGranted, LocationPermission? status})>
      checkLocationPermission({bool shouldRequest = true});
}

class LocationService implements _LocationService {
  @override
  Future<({String? error, Position? position, bool? hasPermission})>
      getCurrentLocation(
          [LocationAccuracy desiredAccuracy = LocationAccuracy.high]) async {
    try {
      final response =
          await Geolocator.getCurrentPosition(desiredAccuracy: desiredAccuracy);

      return (error: null, position: response, hasPermission: null);
    } catch (e) {
      final response = await checkLocationPermission(shouldRequest: false);
      if (response.isGranted) {
        return (error: e.toString(), position: null, hasPermission: true);
      }

      return (error: response.error, position: null, hasPermission: false);
    }
  }

  @override
  Future<({String? error, bool isGranted, LocationPermission? status})>
      checkLocationPermission({bool shouldRequest = true}) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return (
        error: "Location services are disabled.",
        isGranted: false,
        status: null
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      if (shouldRequest) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied) {
        return (
          error: "Location service is denied. Please enable it to continue.",
          isGranted: false,
          status: permission
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return (
        error:
            "Location service is permanently denied. Please enable it in settings.",
        isGranted: false,
        status: permission
      );
    }

    return (error: null, isGranted: true, status: permission);
  }
}
