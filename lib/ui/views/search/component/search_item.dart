import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/themes/app_colors.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium)),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 84,
            height: double.infinity,
            decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius:
                    BorderRadius.circular(AppConstants.borderRadiusMedium),
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
                "Chicken pepper soup",
                maxLines: 1,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Expanded(
                child: AutoSizeText(
                  "2 chicken laps, pepper stew, potato fries,mixed with honey glazed gizzard and bay leaves.",
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: AppColors.greyTextColor,
                    fontSize: 15,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r),
                  decoration: BoxDecoration(
                      color: AppColors.tertiaryColor,
                      borderRadius: BorderRadius.circular(
                          AppConstants.borderRadiusSmall)),
                  child: AutoSizeText(
                    "₦40,000",
                    maxLines: 1,
                    style: context.textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
