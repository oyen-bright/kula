import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/themes/app_colors.dart';

class SpecialMealCard extends StatelessWidget {
  const SpecialMealCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 273.w,
      height: 187.h,
      constraints: const BoxConstraints(minHeight: 187, minWidth: 273),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(
                          AppConstants.borderRadiusMedium)),
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
                                AppConstants.borderRadiusSmall))),
                    child: AutoSizeText(
                      "Chicken Republic",
                      style: context.textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Expanded(
                  child: AutoSizeText(
                "Chicken n Chips",
                maxLines: 1,
                style: context.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              )),
              Container(
                padding: EdgeInsets.all(4.r),
                decoration: BoxDecoration(
                    color: AppColors.tertiaryColor,
                    borderRadius:
                        BorderRadius.circular(AppConstants.borderRadiusSmall)),
                child: AutoSizeText(
                  "₦4,000",
                  maxLines: 1,
                  style: context.textTheme.bodyMedium,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
