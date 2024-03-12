import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_colors.dart';

class RestaurantMealCard extends StatelessWidget {
  const RestaurantMealCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //TODO: test height responsiceness
    return InkWell(
      onTap: () => AppRouter.router.push(AppRoutes.restaurantMeal),
      child: Container(
        height: 142.h,
        alignment: Alignment.center,
        padding: EdgeInsets.all(15.r),
        constraints: const BoxConstraints(
          minHeight: 140,
          maxHeight: 142,
          maxWidth: 363,
        ),
        decoration: BoxDecoration(
            color: AppColors.cardColor,
            border: Border.all(color: AppColors.cardStrokeColor, width: 2),
            borderRadius:
                BorderRadius.circular(AppConstants.borderRadius.medium)),
        width: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 84.h,
              height: double.infinity,
              decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius:
                      BorderRadius.circular(AppConstants.borderRadius.medium),
                  border: Border.all(color: AppColors.lightGreyColor)),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Chukas buka",
                  maxLines: 1,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                AutoSizeText(
                  "2 Catfish, pepper stew, potato fries , mixed with honey glazed gizzard and bay leaves.",
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: AppColors.greyTextColor,
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                        color: AppColors.tertiaryColor,
                        borderRadius: BorderRadius.circular(
                            AppConstants.borderRadius.small)),
                    child: AutoSizeText(
                      "₦40,000",
                      maxLines: 1,
                      style: context.textTheme.bodySmall
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
