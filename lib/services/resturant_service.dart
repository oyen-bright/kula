import 'dart:convert';
import 'dart:developer';

import 'package:kula/cubits/restaurant_cubit/meal_model.dart';
import 'package:kula/cubits/restaurant_cubit/restaurant_model.dart';
import 'package:kula/cubits/restaurant_cubit/resturant_review_model.dart';
import 'package:kula/data/http/http_repository.dart';
import 'package:kula/utils/types.dart';

abstract class _RestaurantService {
  Future<RestaurantServiceResponse<List<Restaurant>?>> getRestaurants(
      Location location);
  Future<RestaurantServiceResponse<List<Meal>?>> getTodaysSpecial();
  Future<RestaurantServiceResponse<List<Meal>?>> getRestaurantMeal(
      {required Location location, required String id});
  Future<RestaurantServiceResponse<List<RestaurantReviewM>?>>
      getRestaurantReviews(String id);
  Future<RestaurantServiceResponse<String?>> giveRestaurantReview(
      {required String vendorId,
      required String mealId,
      required String review,
      required String rating});
}

class RestaurantServiceResponse<T> {
  final String? error;
  final T data;

  RestaurantServiceResponse({required this.error, required this.data});
}

class RestaurantService implements _RestaurantService {
  @override
  Future<RestaurantServiceResponse<List<Restaurant>?>> getRestaurants(
      Location location) async {
    try {
      final response = await AppRepository.getRestaurants(location);
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      final restaurants = List.from(data['data']['data'])
          .map(((e) => Restaurant.fromJson(e)))
          .toList();

      return RestaurantServiceResponse(error: null, data: restaurants);
    } catch (e) {
      RestaurantService.logger(e.toString());
      return RestaurantServiceResponse(error: e.toString(), data: null);
    }
  }

  @override
  Future<RestaurantServiceResponse<List<Meal>?>> getTodaysSpecial() async {
    try {
      final response = await AppRepository.getTodaySpecial();
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      final meals =
          List.from(data['data']).map(((e) => Meal.fromJson(e))).toList();

      return RestaurantServiceResponse(error: null, data: meals);
    } catch (e) {
      RestaurantService.logger(e.toString());
      return RestaurantServiceResponse(error: e.toString(), data: null);
    }
  }

  static void logger(String error) {
    log(error, name: "Restaurant Service ");
  }

  @override
  Future<RestaurantServiceResponse<List<Meal>?>> getRestaurantMeal(
      {required Location location, required String id}) async {
    try {
      final response = await AppRepository.getRestaurantMeals(location, id);
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      final meals = List.from(data['data']['meals']['data'])
          .map(((e) => Meal.fromJson(e)))
          .toList();

      return RestaurantServiceResponse(error: null, data: meals);
    } catch (e) {
      RestaurantService.logger(e.toString());
      return RestaurantServiceResponse(error: e.toString(), data: null);
    }
  }

  @override
  Future<RestaurantServiceResponse<List<RestaurantReviewM>?>>
      getRestaurantReviews(String id) async {
    try {
      final response = await AppRepository.getRestaurantReviews(id);
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      final reviews = (data['data']['data'] as List)
          .map((e) => RestaurantReviewM.fromJson(Map.from(e)))
          .toList();

      return RestaurantServiceResponse(error: null, data: reviews);
    } catch (e) {
      RestaurantService.logger(e.toString());
      return RestaurantServiceResponse(error: e.toString(), data: null);
    }
  }

  @override
  Future<RestaurantServiceResponse<String?>> giveRestaurantReview(
      {required String vendorId,
      required String mealId,
      required String review,
      required String rating}) async {
    try {
      final payload = {
        "meal_id": mealId,
        "vendor_id": vendorId,
        "rating": rating,
        "review": review
      };
      final response = await AppRepository.giveReview(payload);
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final message = data['message'];

      return RestaurantServiceResponse(error: null, data: message);
    } catch (e) {
      RestaurantService.logger(e.toString());
      return RestaurantServiceResponse(error: e.toString(), data: null);
    }
  }
}
