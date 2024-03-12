import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/components/drop_down/star_filter_drop_down.dart';
import 'package:kula/ui/components/headers/app_bar.dart';

import 'components/restaurant_info.dart';
import 'components/restaurant_meal_list.dart';
import 'components/restaurant_review_card.dart';

class RestaurantReview extends StatelessWidget {
  const RestaurantReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViewAppBar(
        title: "",
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  const RestaurantInfo(),
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
                  const Align(
                          alignment: Alignment.centerRight,
                          child: StarFilterDropdown())
                      .withHorViewPadding,
                  // const StarRating(
                  //   rating: 2.5,
                  // )

                  Expanded(
                    child: ListView.separated(
                      itemCount: 10,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          thickness: 1.5,
                          height: 1,
                          color: AppColors.babyBlue,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return const RestaurantReviewCard();
                      },
                    ),
                  ),
                ],
              ),
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
                            const RestaurantMealList().asBottomSheet(context);
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
                            .push(AppRoutes.restaurantReviewNew),
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
