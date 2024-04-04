part of 'restaurant_cubit.dart';

@freezed
class RestaurantState with _$RestaurantState {
  const RestaurantState._();
  const factory RestaurantState.initial() = _Initial;
  const factory RestaurantState.loaded(
      {required List<Restaurant> restaurants,
      required List<Meal> todaySpecials}) = _Loaded;
  const factory RestaurantState.loading(
      {required List<Restaurant> restaurants,
      required List<Meal> todaySpecials}) = _Loading;
  const factory RestaurantState.error(
      {required String error,
      @Default([]) List<Restaurant> restaurants,
      @Default([]) List<Meal> todaySpecials}) = _Error;

  List<Restaurant> get restaurants {
    return map(
      loaded: (state) => state.restaurants,
      error: (state) => state.restaurants,
      initial: (_) => [],
      loading: (state) => state.restaurants,
    );
  }

  List<Meal> get todaySpecials {
    return map(
      loaded: (state) => state.todaySpecials,
      error: (state) => state.todaySpecials,
      initial: (_) => [],
      loading: (state) => state.todaySpecials,
    );
  }

  Restaurant? getRestaurantByID(String id) {
    try {
      return restaurants.firstWhere((e) {
        return (e.id == id);
      });
    } catch (e) {
      return null;
    }
  }
}
