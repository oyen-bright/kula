import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/cubits/restaurant_cubit/meal_model.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/utils/amount_formatter.dart';

class RestaurantMealCard extends StatelessWidget {
  final Meal meal;
  final void Function()? onTap;
  const RestaurantMealCard({
    super.key,
    required this.meal,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
            // color: AppColors.cardColor,
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
              child: onTap != null
                  ? Image.network(
                      meal.image,
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  meal.name,
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
                  meal.description,
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
                      amountFormatter(meal.price),
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
