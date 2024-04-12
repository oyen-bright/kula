import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/cubits/restaurant_cubit/restaurant_cubit.dart';
import 'package:kula/cubits/restaurant_cubit/restaurant_model.dart';
import 'package:kula/cubits/restaurant_cubit/resturant_review_model.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/services/resturant_service.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/components/drop_down/star_filter_drop_down.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/ui/components/widgets/refresh_indicator.dart';

import 'components/restaurant_info.dart';
import 'components/restaurant_meal_list.dart';
import 'components/restaurant_review_card.dart';

class RestaurantReview extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantReview({super.key, required this.restaurant});

  @override
  State<RestaurantReview> createState() => _RestaurantReviewState();
}

class _RestaurantReviewState extends State<RestaurantReview> {
  List<RestaurantReviewM>? reviews;
  List<RestaurantReviewM>? filteredReviews;

  ({String? mealId, int? rating}) filterOption = (mealId: null, rating: null);

  @override
  void initState() {
    loadReviews();
    super.initState();
  }

  Future<void> loadReviews() {
    return context
        .read<RestaurantService>()
        .getRestaurantReviews(widget.restaurant.id)
        .then((res) {
      if (!mounted || !context.mounted) {
        return;
      }

      if (res.error != null) {
        context.showSnackBar(res.error);
        return;
      }

      reviews = res.data?.reviews ?? [];
      context.read<RestaurantCubit>().updateRestaurant(widget.restaurant
          .copyWith(
              averageRating: res.data?.stat.average,
              totalRatings: res.data?.stat.count));
      filterReview();
    });
  }

  void filterReview() {
    if (reviews == null) {
      return;
    }

    setState(() {
      filteredReviews = reviews!.where((e) {
        bool shouldReturn = true;
        if (filterOption.mealId != null) {
          shouldReturn = e.mealId == filterOption.mealId;
        }

        if (filterOption.rating != null && shouldReturn) {
          shouldReturn = e.rating == filterOption.rating;
        }

        return shouldReturn;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViewAppBar(
        title: "",
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                RestaurantInfo(
                  restaurant: widget.restaurant,
                ),
                SizedBox(
                  height: 16.h,
                ),
                const Divider(
                  thickness: 1.5,
                  height: 1,
                  color: AppColors.babyBlue,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: StarFilterDropdown(
                      selectedStars: filterOption.rating,
                      onChanged: (selected) {
                        if (selected == null) {
                          return;
                        }

                        filterOption =
                            (mealId: filterOption.mealId, rating: selected);
                        filterReview();
                      },
                    )).withHorViewPadding,
                if (reviews != null &&
                    (filteredReviews?.isEmpty ?? reviews!.isEmpty))
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: const Text("No Reviews"),
                  )
                else ...{
                  Expanded(
                      child: AppRefreshIndicator(
                    onRefresh: loadReviews,
                    child: reviews == null
                        ? ListView.separated(
                            itemCount: 10,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider(
                                thickness: 1.5,
                                height: 1,
                                color: AppColors.babyBlue,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return RestaurantReviewCard.shimmer;
                            },
                          )
                        : ListView.separated(
                            itemCount:
                                filteredReviews?.length ?? reviews!.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider(
                                thickness: 1.5,
                                height: 1,
                                color: AppColors.babyBlue,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return RestaurantReviewCard(
                                restaurant: widget.restaurant,
                                review:
                                    filteredReviews?[index] ?? reviews![index],
                              );
                            },
                          ),
                  )),
                }
              ],
            ),
          ),
          Container(
            width: 393.w,
            height: 118.h,
            // margin: EdgeInsets.only(bottom: 34.h),
            padding: EdgeInsets.symmetric(
                vertical: 16.h, horizontal: AppConstants.padding.horizontal),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 145.w,
                      height: 48.h,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppConstants.borderRadius.large))),
                          onPressed: () {
                            RestaurantMealList(
                              restaurant: widget.restaurant,
                            ).asBottomSheet<String?>(context).then((res) {
                              if (res == null) {
                                return;
                              }
                              filterOption =
                                  (mealId: res, rating: filterOption.rating);
                              filterReview();
                            });
                          },
                          child: const Text("All items")),
                    ),
                    SizedBox(
                      width: 200.w,
                      height: 48.h,
                      child: AppElevatedButton(
                        elevation: 0,
                        title: "Write a review",
                        onPressed: () => AppRouter.router
                            .push(AppRoutes.restaurantReviewNew,
                                extra: widget.restaurant)
                            .then((value) => loadReviews()),
                      ),
                    )
                  ],
                ),
                const Spacer()
              ],
            ),
          )
        ],
      ),
    );
  }
}
