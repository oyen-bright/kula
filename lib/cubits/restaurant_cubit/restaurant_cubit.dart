// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kula/services/location_service.dart';
import 'package:kula/services/resturant_service.dart';
import 'package:kula/utils/types.dart';

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
    emit(RestaurantState.loading(restaurants: state.restaurants));

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

    final response = await restaurantService.getRestaurants(usersLocation);
    if (response.error != null) {
      emit(RestaurantState.error(
          restaurants: state.restaurants, error: response.error ?? ""));
      return;
    }

    emit(const RestaurantState.loaded(restaurants: []));
  }
}
