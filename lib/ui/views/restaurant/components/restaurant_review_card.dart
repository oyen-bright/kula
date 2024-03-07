import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/ui/components/widgets/star_rating.dart';

class RestaurantReviewCard extends StatelessWidget {
  const RestaurantReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      width: 393.w,
      height: 200.h,
      child: Column(
        children: [
          Row(children: [
            Flexible(
              child: Text(
                "Adebolwale Constance ",
                style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.darkGrey,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            const Expanded(
              child: StarRating(
                starSize: 17,
                rating: 2.5,
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
                "Catfish pepper soup",
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: AppColors.primaryColor, fontSize: 13),
              ))
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
              "The chocolate bar was good, but it was too sweet for me. Please reduce the amount of sweeteners you use in cooking this food so It can be properly consumed. It was also not cold enough, melting aw...",
              style: context.textTheme.titleMedium
                  ?.copyWith(color: AppColors.darkGrey, fontSize: 14)),
        ],
      ),
    );
  }
}
