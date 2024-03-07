import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';

class VendorsCard extends StatelessWidget {
  const VendorsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppRouter.router.push(AppRoutes.restaurant),
      onLongPress: () => AppRouter.router.push(AppRoutes.restaurantReview),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        decoration: BoxDecoration(
            color: AppColors.cardColor,
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
                  color: Colors.red,
                  borderRadius:
                      BorderRadius.circular(AppConstants.borderRadius.medium)),
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
                  AutoSizeText(
                    "Chukas buka",
                    maxLines: 1,
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  AutoSizeText(
                    "Hot and spicy catfish daily",
                    maxLines: 1,
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
                                  "50-55 minutes",
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
                                const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '4.8 ',
                                    ),
                                    TextSpan(
                                      text: '(74)',
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
