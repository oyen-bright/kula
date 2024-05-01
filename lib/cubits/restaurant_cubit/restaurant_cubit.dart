// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kula/services/location_service.dart';
import 'package:kula/services/resturant_service.dart';
import 'package:kula/utils/types.dart';

import 'meal_model.dart';
import 'restaurant_model.dart';

part 'restaurant_cubit.freezed.dart';
part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantService restaurantService;
  LocationService locationService;
  RestaurantCubit(
    this.restaurantService,
    this.locationService,
  ) : super(const RestaurantState.initial());

  Future<void> getRestaurants() async {
    emit(RestaurantState.loading(
        restaurants: state.restaurants, todaySpecials: state.todaySpecials));

    final getUserLocationResponse = await locationService.getCurrentLocation();
    if (getUserLocationResponse.error != null) {
      emit(RestaurantState.error(
          restaurants: state.restaurants,
          error: getUserLocationResponse.error ?? ""));
      return;
    }
    final Location usersLocation = (
      latitude: getUserLocationResponse.position!.latitude,
      longitude: getUserLocationResponse.position!.longitude
    );

    final response = await Future.wait([
      restaurantService.getRestaurants(usersLocation),
      restaurantService.getTodaysSpecial()
    ]);

    if (response[0].error != null || response[1].error != null) {
      emit(RestaurantState.error(
          restaurants: state.restaurants,
          error: response[0].error ?? response[1].error ?? ""));
      return;
    }

    emit(RestaurantState.loaded(
        restaurants: List.from(response[0].data ?? []),
        todaySpecials: List.from(response[1].data ?? [])));

    _autoGetResturantMeals();
  }

  void _autoGetResturantMeals() async {
    for (var element in state.restaurants) {
      if (element.meals == null) {
        await getRestaurantsMealAuto(element.id);
      }
    }
  }

  Future<void> getRestaurantsMeal(
    String vendorID,
  ) async {
    emit(RestaurantState.loading(
        restaurants: state.restaurants, todaySpecials: state.todaySpecials));

    final getUserLocationResponse = await locationService.getCurrentLocation();
    if (getUserLocationResponse.error != null) {
      emit(RestaurantState.error(
          restaurants: state.restaurants,
          error: getUserLocationResponse.error ?? ""));
      return;
    }
    final Location usersLocation = (
      latitude: getUserLocationResponse.position!.latitude,
      longitude: getUserLocationResponse.position!.longitude
    );

    final response = await restaurantService.getRestaurantMeal(
        location: usersLocation, id: vendorID);

    if (response.error != null) {
      emit(RestaurantState.error(
          restaurants: state.restaurants, error: response.error ?? ""));
      return;
    }

    final newRestaurants = state.restaurants.map((e) {
      if (e.id != vendorID) return e;
      return e.copyWith(meals: response.data);
    }).toList();

    emit(RestaurantState.loaded(
        restaurants: newRestaurants, todaySpecials: state.todaySpecials));
  }

  Future<void> getRestaurantsMealAuto(
    String vendorID,
  ) async {
    final getUserLocationResponse = await locationService.getCurrentLocation();
    if (getUserLocationResponse.error != null) {
      return;
    }
    final Location usersLocation = (
      latitude: getUserLocationResponse.position!.latitude,
      longitude: getUserLocationResponse.position!.longitude
    );

    final response = await restaurantService.getRestaurantMeal(
        location: usersLocation, id: vendorID);

    if (response.error != null) {
      return;
    }

    final newRestaurants = state.restaurants.map((e) {
      if (e.id != vendorID) return e;
      return e.copyWith(meals: response.data);
    }).toList();

    emit(RestaurantState.loaded(
        restaurants: newRestaurants, todaySpecials: state.todaySpecials));
  }

  void updateRestaurant(Restaurant restaurant) {
    final updatedRestaurant = state.restaurants.map((element) {
      if (element.id == restaurant.id) {
        return restaurant;
      }
      return element;
    }).toList();
    emit(RestaurantState.loaded(
        restaurants: updatedRestaurant, todaySpecials: state.todaySpecials));
  }

  Restaurant? getResturantByMealId(
    String mealId,
  ) {
    for (var restaurant in state.restaurants) {
      var foundMeal = restaurant.meals?.firstWhere(
        (meal) => meal.id == mealId,
        orElse: () => Meal.dummy,
      );
      if (!foundMeal!.isDummy) {
        return restaurant;
      }
    }
    return null; // Return null if no restaurant with the specified mealId is found
  }
}
