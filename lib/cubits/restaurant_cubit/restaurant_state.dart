part of 'restaurant_cubit.dart';

@freezed
class RestaurantState with _$RestaurantState {
  const RestaurantState._();
  const factory RestaurantState.initial() = _Initial;
  const factory RestaurantState.loaded(
      {required List<Restaurant> restaurants}) = _Loaded;
  const factory RestaurantState.loading(
      {required List<Restaurant> restaurants}) = _Loading;
  const factory RestaurantState.error(
      {required String error,
      @Default([]) List<Restaurant> restaurants}) = _Error;

  List<Restaurant> get restaurants {
    return map(
      loaded: (state) => state.restaurants,
      error: (state) => state.restaurants,
      initial: (_) => [],
      loading: (state) => state.restaurants,
    );
  }
}
