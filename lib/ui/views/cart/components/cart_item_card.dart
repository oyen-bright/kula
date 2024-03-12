import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 142.h,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      constraints: const BoxConstraints(
          // minHeight: 140,
          // maxHeight: 142.h,
          // maxWidth: 363,
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
            width: 84.w,
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
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      "Chukas buka",
                      maxLines: 1,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: () {},
                      child: Image.asset(
                        AppImages.deleteItemIcon,
                        scale: 2,
                      ))
                ],
              ),
              AutoSizeText(
                "Gwarimpa",
                maxLines: 2,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: AppColors.greyTextColor,
                  fontSize: 15,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Row(
                children: [
                  Image.asset(
                    AppImages.timeIcon,
                    scale: 1.8,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Expanded(
                    child: Text(
                      "50-55 minutes",
                      maxLines: 1,
                      style: context.textTheme.bodyMedium
                          ?.copyWith(color: AppColors.greyTextColor),
                    ),
                  )
                ],
              ),
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                        color: AppColors.tertiaryColor,
                        borderRadius: BorderRadius.circular(
                            AppConstants.borderRadius.small)),
                    child: AutoSizeText(
                      "₦40,000",
                      maxLines: 1,
                      style: context.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              color: context.colorScheme.primary,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            width: 30.w,
                            height: 30.w,
                            alignment: Alignment.center,
                            child: Image.asset(
                              AppImages.decreaseIcon,
                              scale: 2,
                              color: context.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: context.colorScheme.primary,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          width: 30.w,
                          height: 30.w,
                          alignment: Alignment.center,
                          child: Image.asset(
                            AppImages.increaseIcon,
                            scale: 2,
                            color: context.colorScheme.onPrimary,
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: context.colorScheme.secondary,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                  color: context.colorScheme.primary)),
                          width: 30.w,
                          height: 30.w,
                          alignment: Alignment.center,
                          child: Text(
                            "1",
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
