import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/cubits/restaurant_cubit/meal_model.dart';
import 'package:kula/cubits/restaurant_cubit/restaurant_cubit.dart';
import 'package:kula/cubits/restaurant_cubit/restaurant_model.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';
import 'package:kula/ui/components/widgets/refresh_indicator.dart';
import 'package:kula/ui/components/widgets/shimmer.dart';
import 'package:kula/utils/day_of_week.dart';

import 'components/restaurant_header.dart';
import 'components/restaurant_meal_info.dart';

class RestaurantView extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantView({super.key, required this.restaurant});

  @override
  State<RestaurantView> createState() => _RestaurantViewState();
}

class _RestaurantViewState extends State<RestaurantView> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    getRestaurantsMeal();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void getRestaurantsMeal() {
    if (widget.restaurant.meals != null) return;
    context.read<RestaurantCubit>().getRestaurantsMeal(widget.restaurant.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantCubit, RestaurantState>(
        listener: (context, state) {
      state.mapOrNull(error: (state) => context.showSnackBar(state.error));
    }, builder: (BuildContext context, RestaurantState state) {
      final Restaurant restaurant =
          state.getRestaurantByID(widget.restaurant.id)!;

      return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RestaurantHeader(
                restaurant: restaurant,
              ),
              Container(
                height: 48.h,
                margin: EdgeInsets.symmetric(
                    horizontal: AppConstants.padding.horizontal),
                child: Row(
                  children: [
                    Image.asset(
                      AppImages.openIcon,
                      scale: 2,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Expanded(
                        child: Text(
                      widget.restaurant.openingHours[
                              getDayOfWeek(DateTime.now().weekday)
                                  .toLowerCase()] ??
                          "N/A",
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ))
                  ],
                ),
              ),
              if (restaurant.meals == null)
                AppShimmer(
                  child: _buildSearchBar(restaurant).withHorViewPadding,
                )
              else
                _buildSearchBar(restaurant).withHorViewPadding,
              ValueListenableBuilder(
                  valueListenable: searchController,
                  builder: (context, value, child) {
                    List<Meal> filteredMeals = restaurant.meals ?? [];

                    if (value.text.isNotEmpty) {
                      filteredMeals = restaurant.meals!
                          .where((meal) => meal.name
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase()))
                          .toList();
                    }

                    return Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 16.h,
                              horizontal: AppConstants.padding.horizontal),
                          child: (restaurant.meals == null)
                              ? _buildLoadingLIst()
                              : _buildMealLIst(restaurant, filteredMeals)),
                    );
                  })
            ],
          ),
        ),
      );
    });
  }

  AppTextField _buildSearchBar(Restaurant restaurant) {
    return AppTextField(
        readOnly: restaurant.meals == null,
        keyboardType: TextInputType.none,
        hintColor: const Color.fromARGB(255, 170, 174, 184),
        hintText: "Search for a meal",
        controller: searchController,
        suffixIcon: Image.asset(
          AppImages.searchIcon,
          scale: 2,
        ));
  }

  Widget _buildMealLIst(Restaurant restaurant, List<Meal> meals) {
    return AppRefreshIndicator(
      onRefresh: () => context
          .read<RestaurantCubit>()
          .getRestaurantsMeal(widget.restaurant.id),
      child: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: RestaurantMealCard(
                onTap: () {
                  if (!restaurant.isOpen) {
                    context.showSnackBar("Restaurant is current closed");
                    return;
                  }
                  AppRouter.router.push(AppRoutes.restaurantMeal,
                      extra: (restaurant: restaurant.id, meal: meals[index]));
                },
                meal: meals[index],
              ),
            );
          }),
    );
  }

  SingleChildScrollView _buildLoadingLIst() {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
            18,
            (index) => AppShimmer(
                    child: Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: RestaurantMealCard(
                    meal: Meal.dummy,
                    onTap: null,
                  ),
                ))),
      ),
    );
  }
}
