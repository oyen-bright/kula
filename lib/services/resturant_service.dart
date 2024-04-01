import 'dart:convert';
import 'dart:developer';

import 'package:kula/data/http/http_repository.dart';
import 'package:kula/utils/types.dart';

abstract class _RestaurantService {
  Future<RestaurantServiceResponse> getRestaurants(Location location);
}

class RestaurantServiceResponse<T> {
  final String? error;
  final T data;

  RestaurantServiceResponse({required this.error, required this.data});
}

class RestaurantService implements _RestaurantService {
  @override
  Future<RestaurantServiceResponse> getRestaurants(Location location) async {
    try {
      final response = await AppRepository.getRestaurants(location);
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      log(data.toString(), name: "get ruestureant data");
      final message = data['message'];

      return RestaurantServiceResponse(error: null, data: message);
    } catch (e) {
      RestaurantService.logger(e.toString());
      return RestaurantServiceResponse(error: e.toString(), data: null);
    }
  }

  static void logger(String error) {
    log(error, name: "Restaurant Service ");
  }
}
