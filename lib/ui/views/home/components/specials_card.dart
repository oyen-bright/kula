import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/cubits/restaurant_cubit/meal_model.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/utils/amount_formatter.dart';

class SpecialMealCard extends StatelessWidget {
  final Meal meal;
  final void Function()? onTap;
  const SpecialMealCard({
    super.key,
    required this.meal,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 273.w,
      height: 187.h,
      constraints: const BoxConstraints(minHeight: 187, minWidth: 273),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Container(
                    decoration: BoxDecoration(
                        // color: Colors.transparent,
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(
                            AppConstants.borderRadius.medium)),
                    child: onTap != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(
                                AppConstants.borderRadius.medium),
                            child: Image.network(
                              meal.image,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const SizedBox.shrink(),
                  )),
                  Positioned(
                    top: 15,
                    left: 15,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: ShapeDecoration(
                          color: Colors.amber,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(
                                  AppConstants.borderRadius.small))),
                      child: AutoSizeText(
                        meal.vendor?.storeName ?? "N/A",
                        style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 13),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 9.5.h,
            ),
            Row(
              children: [
                Expanded(
                    child: AutoSizeText(
                  meal.name,
                  maxLines: 1,
                  style: context.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w700, fontSize: 16),
                )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                      color: AppColors.tertiaryColor,
                      borderRadius: BorderRadius.circular(
                        AppConstants.borderRadius.small,
                      )),
                  child: AutoSizeText(
                    amountFormatter(meal.price),
                    maxLines: 1,
                    style: context.textTheme.bodyMedium?.copyWith(fontSize: 12),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
