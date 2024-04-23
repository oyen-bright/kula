import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/cubits/restaurant_cubit/restaurant_model.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';

class VendorsCard extends StatelessWidget {
  final Color backgroundColor;
  final void Function()? onTap;
  final Restaurant restaurant;
  const VendorsCard({
    super.key,
    this.backgroundColor = AppColors.cardColor,
    required this.restaurant,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: () => AppRouter.router.push(AppRoutes.restaurantReview),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: AppColors.cardStrokeColor, width: 2),
            borderRadius:
                BorderRadius.circular(AppConstants.borderRadius.medium)),
        width: double.infinity,
        height: 108.h,
        constraints: const BoxConstraints(
            // minHeight: 108,
            // maxHeight: 110,
            // minWidth: 353,
            ),
        child: Row(
          children: [
            Container(
              height: 84.h,
              width: 84.w,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius:
                      BorderRadius.circular(AppConstants.borderRadius.medium)),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(AppConstants.borderRadius.medium),
                child: onTap != null
                    ? Image.network(
                        restaurant.previewImage,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox.shrink(),
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero(
                  // tag: "resturant-image${restaurant.id}",
                  // child:
                  AutoSizeText(
                    restaurant.storeName,
                    maxLines: 1,
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  // ),
                  SizedBox(
                    height: 2.h,
                  ),
                  AutoSizeText(
                    restaurant.shortDescription,
                    maxLines: 2,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: AppColors.greyTextColor,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Image.asset(
                                AppImages.timeIcon,
                                scale: 2,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Expanded(
                                child: Text(
                                  restaurant.duration,
                                  maxLines: 1,
                                  style: context.textTheme.bodySmall?.copyWith(
                                      color: AppColors.greyTextColor),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                AppImages.starIcon,
                                scale: 2,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          '${restaurant.averageRating.toStringAsFixed(2)} ',
                                    ),
                                    TextSpan(
                                      text: '(${restaurant.totalRatings})',
                                    ),
                                  ],
                                ),
                                style: context.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
