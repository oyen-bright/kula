// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kula/cubits/restaurant_cubit/restaurant_model.dart';
import 'package:kula/cubits/restaurant_cubit/resturant_review_model.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/ui/components/widgets/shimmer.dart';
import 'package:kula/ui/components/widgets/star_rating.dart';

class RestaurantReviewCard extends StatelessWidget {
  final RestaurantReviewM review;
  final Restaurant restaurant;
  const RestaurantReviewCard({
    Key? key,
    required this.review,
    required this.restaurant,
  }) : super(key: key);

  static Widget get shimmer {
    return AppShimmer(
        child: RestaurantReviewCard(
            review: RestaurantReviewM.dummy, restaurant: Restaurant.dummy));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      width: 393.w,
      constraints:
          BoxConstraints(maxHeight: 200.h, minHeight: double.minPositive),
      // height: 200.h,
      child: InkWell(
        onTap: () => ViewReview(review: review)
            .asBottomSheet(context, backgroundColor: Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(children: [
              Flexible(
                child: Text(
                  review.userId,
                  style: context.textTheme.titleMedium?.copyWith(
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: StarRating(
                  starSize: 17,
                  rating: review.rating.toDouble(),
                ),
              )
            ]),
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                const CircleAvatar(
                  radius: 2,
                  backgroundColor: AppColors.lightGray,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Flexible(
                    child: Text(
                  restaurant.getMealById(review.mealId)?.name ?? "N/A",
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: AppColors.primaryColor, fontSize: 13),
                ))
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            AutoSizeText(review.review,
                maxLines: 3,
                style: context.textTheme.titleMedium
                    ?.copyWith(color: AppColors.darkGrey, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

class ViewReview extends StatelessWidget {
  const ViewReview({
    super.key,
    required this.review,
  });

  final RestaurantReviewM review;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 354.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                padding: EdgeInsets.zero,
                style:
                    IconButton.styleFrom(visualDensity: VisualDensity.compact),
                onPressed: () => context.pop(),
                icon: const Icon(Icons.close)),
          ),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Text(
              review.review,
            ),
          )
        ],
      ),
    );
  }
}
