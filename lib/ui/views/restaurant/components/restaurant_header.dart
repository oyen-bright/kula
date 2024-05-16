import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/cubits/restaurant_cubit/meal_model.dart';
import 'package:kula/cubits/restaurant_cubit/restaurant_model.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/utils/amount_formatter.dart';

class RestaurantHeader extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantHeader({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393.w,
      height: 120.h,
      constraints: const BoxConstraints(
        minHeight: 120,
        maxHeight: 142,
        maxWidth: 363,
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                restaurant.previewImage,
              ))),
      child: Stack(
        children: [
          Positioned.fill(
              child: Container(
            color: Colors.black.withOpacity(0.7),
          )),
          Positioned.fill(
              child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.padding.horizontal, vertical: 12.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => context.pop(),
                        icon: Image.asset(
                          AppImages.roundBackButton,
                          scale: 2,
                        )),
                    // Hero(
                    // tag: "resturant-image${restaurant.id}",
                    // child:
                    Text(
                      restaurant.storeName,
                      style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: AppColors.milkyWhite),
                    ),
                    // ),
                    Row(
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
                          style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: AppColors.milkyWhite,
                              decoration: TextDecoration.underline),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ],
                ),
                // const Spacer(),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            text: 'delivery cost\n',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.transparent,
                                fontWeight: FontWeight.w600),
                            children: <TextSpan>[
                              TextSpan(
                                text: '₦1,500',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.transparent,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const VerticalDivider(
                        thickness: 1.1,
                        color: Colors.white,
                      ),
                      Expanded(
                        flex: 2,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Wait time\n',
                            style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                            children: <TextSpan>[
                              TextSpan(
                                text: restaurant.duration,
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.inputFieldHintTextColor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const VerticalDivider(
                        thickness: 1.1,
                        color: Colors.white,
                      ),
                      Expanded(
                        child: TextButton(
                            onPressed: restaurant.meals != null
                                ? () {
                                    AppRouter.router.push(
                                        AppRoutes.restaurantReview,
                                        extra: restaurant);
                                  }
                                : null,
                            child: const AutoSizeText(
                              "More Details >",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class RestaurantHeaderMeal extends StatelessWidget {
  final Meal meal;

  const RestaurantHeaderMeal({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393.w,
      height: 120.h,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(meal.image))),
      child: Stack(
        children: [
          Positioned.fill(
              child: Container(
            color: Colors.black.withOpacity(0.7),
          )),
          Positioned.fill(
              child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.padding.horizontal, vertical: 12.h),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => context.pop(),
                      icon: Image.asset(
                        AppImages.roundBackButton,
                        scale: 2,
                      )),
                  const Spacer(),
                ]),
          )),
          Positioned.fill(
              child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.padding.horizontal, vertical: 12.h),
            child: Column(
              children: [
                const Spacer(),
                Hero(
                  tag: "Meal-Image${meal.id}",
                  child: Text(
                    meal.name,
                    style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: AppColors.milkyWhite),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r),
                  decoration: BoxDecoration(
                      color: AppColors.tertiaryColor,
                      borderRadius: BorderRadius.circular(
                          AppConstants.borderRadius.small)),
                  child: AutoSizeText(
                    amountFormatter(meal.price),
                    maxLines: 1,
                    style: context.textTheme.bodySmall
                        ?.copyWith(color: Colors.black),
                  ),
                ),
                const Spacer(),
                // const Spacer(),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
