import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/cubits/restaurant_cubit/restaurant_cubit.dart';
import 'package:kula/cubits/restaurant_cubit/restaurant_model.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';
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
  @override
  void initState() {
    getRestaurantsMeal();
    super.initState();
  }

  void getRestaurantsMeal() {
    if (widget.restaurant.meals != null) return;
    context.read<RestaurantCubit>().getRestaurantsMeal(widget.restaurant.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RestaurantCubit, RestaurantState>(
      listener: (context, state) {
        state.mapOrNull(error: (state) => context.showSnackBar(state.error));
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              RestaurantHeader(
                restaurant: widget.restaurant,
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
              if (widget.restaurant.meals == null)
                AppShimmer(
                  child: AppTextField(
                      readOnly: true,
                      keyboardType: TextInputType.none,
                      hintColor: const Color.fromARGB(255, 170, 174, 184),
                      hintText: "Search for a meal",
                      suffixIcon: Image.asset(
                        AppImages.searchIcon,
                        scale: 2,
                      )).withHorViewPadding,
                )
              else
                AppTextField(
                    keyboardType: TextInputType.none,
                    hintColor: const Color.fromARGB(255, 170, 174, 184),
                    hintText: "Search for a meal",
                    suffixIcon: Image.asset(
                      AppImages.searchIcon,
                      scale: 2,
                    )).withHorViewPadding,
              BlocBuilder<RestaurantCubit, RestaurantState>(
                builder: (context, state) {
                  return Expanded(
                      child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Column(
                      children: [
                        if (widget.restaurant.meals == null)
                          ...List.generate(
                              18,
                              (index) => AppShimmer(
                                      child: Padding(
                                    padding: EdgeInsets.only(bottom: 10.h),
                                    child: const RestaurantMealCard(),
                                  )))
                        else
                          const RestaurantMealCard()
                      ],
                    ),
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
